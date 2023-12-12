import 'package:flutter/material.dart';
import 'package:one_weather/models/weather_model.dart';
import 'package:one_weather/services/weather_services.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  //api key
  final _weatherService = WeatherService('');
  Weather? _weather;

  //fetch_weather
_fetchWeather()async {
  //get current city
String cityName = await _weatherService.getCurrentCity();
  //any errors
  try{
    final weather = await _weatherService.getCurrentCity(cityName);
    setState(() {
      _weather = _weather;
    });
  }
  //any errors
catch(e){
    print(e);
}
}
  //weather animations
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

    );
  }
}
