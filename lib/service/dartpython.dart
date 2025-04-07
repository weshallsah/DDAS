import 'dart:convert';

import 'package:ddas/constant.dart';
import 'package:http/http.dart' as http;

class DarttoPython {
  bool Startmoniter() {
    print(url);
    http.get(Uri.parse("${url}startmoniter"));
    return true;
  }

  bool Stopmoniter() {
    http.get(Uri.parse("${url}stopmoniter"));
    return true;
  }

  Future getdata() async {
    final res = await http.get(Uri.parse("${url}getdata"));
    print(res);
    return res;
  }

  Future scan() async {
    final res = await http.get(Uri.parse("${url}scan"));
    // print(res.body);
    return jsonDecode(res.body);
  }

  Future deleteFile(int id, String path) async {
    final Map<String, dynamic> body = {
      'id': id,
      'path': path,
    };
    final res = await http.delete(
      Uri.parse("${url}delete/${id}"),
      body: jsonEncode(body),
    );
    // print(res.body);
    return jsonDecode(res.body);
  }
}
