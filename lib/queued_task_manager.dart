import 'dart:async';
import 'dart:collection';

typedef Future<T> TaskGenerator<T>();

class QueuedTask<T> {
  static int _idCounter = 0;
  Completer<T> _completer;
  TaskGenerator<T> _generator;
  bool _isCancelled = false;
  int id;

  bool get isCancelled => _isCancelled;

  Future<T> get future => _completer.future;

  QueuedTask(this._generator) {
    _completer = Completer();
    id = _idCounter++;
  }

  void cancel() {
    _isCancelled = true;
  }

  Future start(Duration timeout) async {
    return _generator().timeout(timeout).then((value) {
      _completer.complete(value);
    }).catchError((e, stacktrace) {
      _completer.completeError(e, stacktrace);
    });
  }
}

class QueuedTaskManager {
  final int maxConcurrentTasks;
  final Duration timeout;
  final String label;

  /// Resting duration between completing a task and starting the next task.
  final Duration restDuration;
  bool _isWorking;
  Queue<QueuedTask> _queuedTasks;
  Map<int, QueuedTask> _incompleteTasks;
  bool _isCancelled;

  bool get isWorking => _isWorking;

  bool get isCancelled => _isCancelled;

  QueuedTaskManager(this.label, this.maxConcurrentTasks,
      {this.timeout = const Duration(seconds: 10),
        this.restDuration = const Duration(milliseconds: 10)}) {
    _isWorking = false;
    _queuedTasks = Queue();
    _incompleteTasks = {};
  }

  Future<T> queueTask<T>(TaskGenerator<T> generator) {
    var task = QueuedTask(generator);
    _queuedTasks.addLast(task);
    if (!_isWorking) {
      _startWorking();
    }
    return task.future;
  }

  void cancelAll() {
    _isCancelled = true;
    _isWorking = false;
    _queuedTasks.clear();
    _incompleteTasks.values.forEach((task) {
      task.cancel();
    });
    print('[QueuedTaskManager: $label] cancelled.');
    _incompleteTasks.clear();
  }

  Future _startWorking() async {
    print('[QueuedTaskManager: $label] started.');
    _isWorking = true;
    _isCancelled = false;
    while (_queuedTasks.length > 0 && !_isCancelled) {
      if (_incompleteTasks.length < maxConcurrentTasks) {
        var task = _queuedTasks.removeFirst();
        _incompleteTasks[task.id] = task;
        task.start(timeout).whenComplete(() {
          if (_isCancelled) return;
          _incompleteTasks.remove(task.id);
        });
      }
      await new Future.delayed(restDuration);
    }
    print('[QueuedTaskManager: $label] done.');
    _isWorking = false;
  }
}
