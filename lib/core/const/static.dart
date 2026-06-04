import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrl {
  static final String apiUrl = dotenv.env['apiUrl'] ?? '';
}
