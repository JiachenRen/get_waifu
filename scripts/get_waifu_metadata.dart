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
}

