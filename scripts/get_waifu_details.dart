import 'dart:convert';
import 'dart:io';
import 'package:get_waifu/my_waifu_list_client.dart';
import 'package:get_waifu/queued_task_manager.dart';

final _client = MyWaifuListClient();
final _mgr = QueuedTaskManager('download-waifu-details', 10,
    restDuration: Duration(milliseconds: 1));

void main() async {
  var metadataFile = File('data/waifu_metadata.json');
  var metadata = jsonDecode(metadataFile.readAsStringSync());
  var waifus = metadata['data'] as List<dynamic>;
  var ids =
      waifus.map((i) => (i as Map<String, dynamic>)['id'] as int).toList();
  var completed = 0;
  var total = ids.length;
  for (var i in ids) {
    var file = File('waifu_details/$i.json');
    if (file.existsSync()) {
      // Skip if already downloaded.
      completed++;
      continue;
    }
    _mgr.queueTask(() => _client.fetchWaifuDetails(i)).then((json) {
      file.createSync();
      file.writeAsStringSync(jsonEncode(json));
      completed++;
      print('Downloading $i ($completed / $total, %${(completed / total.toDouble() * 1000).toInt() / 10.0})');
    }).catchError((e) {
      print(e);
    });
  }

  // Combine waifu details into a single file
  print('Compiling...');
  var masterFile = File('data/waifu_details.json');
  List<dynamic> characters = [];
  for (var i in ids) {
    var detailsFile = File('waifu_details/$i.json');
    characters.add(jsonDecode(detailsFile.readAsStringSync())['data']);
  }
  masterFile.writeAsStringSync(jsonEncode(characters));
  print('Done.');
}
