//api key=7956ac64be1e40e0f8bbb3aebfd4d201

import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final Uri url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.statusCode);
      String data = response.body;
      // print(data);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
