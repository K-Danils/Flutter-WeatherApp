import 'dart:convert';
import 'package:http/http.dart' as http;

class Network {
  Uri url;
  http.Response response;
  Network(Uri url) {
    this.url = url;
  }
  Future getData() async {
    response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return "";
    }
  }
}
