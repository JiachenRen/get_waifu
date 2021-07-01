import 'dart:convert';
import 'dart:io';

import 'package:puppeteer/puppeteer.dart' hide Request;

class MyWaifuListClient {
  static const _apiEndpoint =
      'https://mywaifulist.moe/api/waifu/advancedsearch';

  String _xsrfToken;
  String _foreverAloneSessionToken;
  Browser _browser;

  MyWaifuListClient();

  Map<String, String> get requestHeaders => {
        'x-xsrf-token': _xsrfToken,
        'x-requested-with': 'XMLHttpRequest',
        'origin': 'https://mywaifulist.moe',
        'method': 'POST',
        'cookie':
            'XSRF-TOKEN=$_xsrfToken; forever_alone_session=$_foreverAloneSessionToken',
      };

  Future createSession() async {
    // Launch a Chromium browser instance
    _browser = await puppeteer.launch();

    // Open a new page
    var page = await _browser.newPage();

    await page.goto('https://mywaifulist.moe/browse');

    await page.cookies().then((cookies) {
      for (var cookie in cookies) {
        if (cookie.name == 'forever_alone_session') {
          _foreverAloneSessionToken = Uri.decodeFull(cookie.value).replaceAll('=', '');
        } else if (cookie.name == 'XSRF-TOKEN') {
          _xsrfToken = Uri.decodeFull(cookie.value).replaceAll("=", '');
        }
      }
    });

    if (_xsrfToken == null) {
      return Future.error('Error getting XSRF token');
    }

    if (_foreverAloneSessionToken == null) {
      return Future.error('Error getting forever alone session token');
    }

    print('Session Created.');
    print('XSRF-TOKEN: $_xsrfToken');
    print('forever_alone_session: $_foreverAloneSessionToken');
  }

  Future<String> fetchWaifuMetadata(int page) async {
    if (_xsrfToken == null || _foreverAloneSessionToken == null) {
      return Future.error('Session not created.');
    }
    var requestUrl = '$_apiEndpoint?page=$page';
    var payload = {
      "name": "",
      "starts_with": "",
      "tags": [],
      "nameSort": "ASC",
      "height": "",
      "weight": "",
      "bust": "",
      "hip": "",
      "waist": "",
      "blood_type": ""
    };
    var process =
        await Process.start("scripts/curl_waifu.sh", [], environment: {
      "URL": requestUrl,
      "PAYLOAD": jsonEncode(payload),
      "XSRF_TOKEN": _xsrfToken,
      "FOREVER_ALONE_SESSION_TOKEN": _foreverAloneSessionToken
    });
    String buffer = '';
    process.stdout.transform(utf8.decoder).forEach((element) {
      buffer += element;
    });
    await process.exitCode;
    return buffer;
  }

  Future endSession() {
    return _browser.close();
  }
}
