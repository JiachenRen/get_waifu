import 'dart:convert';
import 'dart:io';

import 'package:get_waifu/my_waifu_list_client.dart';

var _client = MyWaifuListClient();

const _pageCount = 1239;

void main() async {
  await _client.createSession();

  for (var page = 1; page <= _pageCount; page++) {
    var file = File('waifu_metadata/$page.json');
    if (file.existsSync()) {
      // Skip if page already loaded.
      continue;
    }
    print('Downloading page $page of $_pageCount');
    file.createSync();
    String jsonData = await _client.fetchWaifuMetadata(page);
    file.writeAsStringSync(jsonData);
  }

  await _client.endSession();

  print('Metadata download completed. Combining into a single file...');

  List<dynamic> characters = [];
  for (var page = 1; page <= _pageCount; page++) {
    var json = jsonDecode(File('waifu_metadata/$page.json').readAsStringSync());
    var charList = json['data'] as List<dynamic>;
    characters.addAll(charList);
  }
  var metadataFile = File('data/waifu_metadata.json');
  if (!metadataFile.existsSync()) {
    metadataFile.createSync();
  }
  metadataFile.writeAsStringSync(jsonEncode({
    'data': characters
  }));

  print('Done.');
}

