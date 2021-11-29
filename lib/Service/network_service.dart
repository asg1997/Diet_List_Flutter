import 'package:http/http.dart' as http;

class NetworkService {
  static Future<http.Response> getResponse({required Uri uri}) async {
    return await http.get(uri);
  }
}

