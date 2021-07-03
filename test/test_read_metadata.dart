import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  var file = File('data/waifu_metadata.json');
  var json = jsonDecode(file.readAsStringSync());
  var waifuCount = 0;
  var husbandoCount = 0;
  var maxId = 0;
  for (var waifu in json['data']) {
    var type = waifu['type'];
    if (type == 'Waifu') {
      waifuCount++;
    } else {
      husbandoCount++;
    }
    maxId = max(waifu['id'], maxId);
  }
  print(maxId); // 39248
  print(waifuCount); // 26927
  print(husbandoCount); // 4038
}