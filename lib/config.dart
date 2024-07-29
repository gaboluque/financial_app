import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get openAIAPIKey => dotenv.env['OPENAI_API_KEY'] ?? '';
}
