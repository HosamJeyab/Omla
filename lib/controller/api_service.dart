import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:omla/core/const/static.dart';
import 'package:omla/model/model.dart';

class APIService {
  final String _baseUrl = ApiUrl.apiUrl;
  Future<Rate> fetchExchangeRates() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return Rate.fromJson(jsonResponse);
      } else {
        throw Exception(
          "Failed to load rates: Status Code ${response.statusCode}",
        );
      }
    } on Exception catch (e) {
      return Rate.fromJson({
        "": {"": 1},
      });
    }
  }
}
