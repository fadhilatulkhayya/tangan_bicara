import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>?> predict(File imageFile) async {
    final uri = Uri.parse(
        "https://ae59-103-148-130-222.ngrok-free.app/predict"); // Ganti IP sesuai server Flask-mu

    try {
      var request = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        return json.decode(responseBody);
      } else {
        print("❌ Server error: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Error sending image to API: $e");
    }

    return null;
  }
}
