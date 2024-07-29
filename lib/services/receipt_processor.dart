import 'dart:convert';
import 'dart:io';
import 'package:finance_app/config.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ReceiptProcessor {
  final String _apiKey = Config.openAIAPIKey;
  final String _apiUrl = "https://api.openai.com/v1/chat/completions";

  final ImagePicker _imagePicker = ImagePicker();

  Future<File?> pickImage() async {
    final PermissionStatus status = await Permission.camera.request();
    if (status.isGranted) {
      final XFile? image =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      return image != null ? File(image.path) : null;
    } else {
      throw Exception('Camera permission is required to pick an image');
    }
  }

  Future<Map<String, dynamic>> processReceipt(File imageFile) async {
    final String base64Image = base64Encode(await imageFile.readAsBytes());
    final String imageData = 'data:image/jpeg;base64,$base64Image';

    final response = await http.post(
      Uri.parse(_apiUrl),
      headers: {
        'Authorization': "Bearer $_apiKey",
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "model": "gpt-4o",
        "messages": [
          {
            "role": "user",
            "content": [
              {
                "type": "text",
                "text":
                    """This image provides information regarding a financial transaction. (Receipt, invoice, etc).
                           Extract the following information: 
                           - description (What the transaction is for),
                           - amount (The total amount of the transaction, as int or float),
                           - category (Food, Transportation, Health, Entertainment, Education, Other)
                           - notes (Any additional information that might be useful - This is a text field so try to extract information as text, not an object)
                           Try to extract as much information as possible from the image. 
                           Return the data in a JSON format. The notes field should be a text field, not an object."""
              },
              {
                "type": "image_url",
                "image_url": {
                  "url": imageData,
                }
              }
            ]
          }
        ],
        "max_tokens": 300
      }),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final jsonString = responseData['choices'][0]['message']['content'];
      final cleanJsonString = _cleanJsonString(jsonString);
      return json.decode(cleanJsonString);
    } else {
      throw Exception('Failed to process receipt: ${response.body}');
    }
  }

  String _cleanJsonString(String jsonString) {
    return jsonString
        .replaceAll('```json', '')
        .replaceAll('\n', '')
        .replaceAll('\t', '')
        .replaceAll('```', '');
  }
}
