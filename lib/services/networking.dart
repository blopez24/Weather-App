import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  /// The url string to send http request.
  final String url;

  /// Class constructor is given a string.
  NetworkHelper(this.url);

  /// Uses http package to get json data from the url request.
  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
