import 'dart:async';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService._();
  static final instance = ApiService._();

  Future<Uint8List?> downloadPdf(String url) async {
    try {
      final response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = response.bodyBytes;

        return data;
      }
    } on Exception catch (e) {
      print(e);
    }

    return null;
  }
}
