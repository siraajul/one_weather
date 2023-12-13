import 'package:one_weather/models/weather_model.dart';
import 'package:one_weather/services/weather_api.dart';
import 'package:one_weather/services/location_service.dart';

class WeatherService {
  final WeatherApi _weatherApi = WeatherApi();
  final LocationService _locationService = LocationService();

  Future<Weather> getWeather(String cityName) async {
    dynamic weatherData = await _weatherApi.fetchData(cityName);
    return Weather.fromJson(weatherData);
  }

  Future<String> getCurrentCity() async {
    return await _locationService.getCurrentCity();
  }
}
