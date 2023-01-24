import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

Future<Uint8List> NetworkImageGetter(String url) async {
  var client = http.Client();
  try {
    var response = await client.get(Uri.parse(url));
    return response.bodyBytes;
  } finally {
    client.close();
  }
}
