import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherApi {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';



  Future<dynamic> fetchData(String cityName) async {

    final response = await http.get(Uri.parse('$BASE_URL?q=$cityName&appid=${EnvironmentData.apiKey}&units=metric'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

class EnvironmentData{

   static final String? apiKey = dotenv.env['API_KEY'];
}