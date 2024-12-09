import 'package:http/http.dart' as http;

class Webservice {
  static Future allProducts(Url) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse(Url));
    request.headers.addAll(headers);
    var response = await request.send();
    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    } else {
      return null;
    }
  }
}
