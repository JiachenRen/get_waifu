import 'dart:convert';
import 'dart:io';

void main() {
  var file = File('data/waifu_details.json');
  var json = jsonDecode(file.readAsStringSync());
  print(json);
}