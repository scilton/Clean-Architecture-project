import 'package:http/http.dart' as http;

class HttpHelper {
  static Future<http.Response> postData({
    required String? url,
    Map<String, dynamic>? data,
  }) async {
    var response = await http.post(
      Uri.parse(
        "YourBaseURL${url!}", // your base url example: http://localhost:3000/api/
      ),
      headers: {
        "Content-Type": "application/json",
        "": "", // Other Headers like token"authorization" and language..etc
      },
      body: data,
    );
    // your prints: print(response.body.toString()); and others
    return response;
  }
}
