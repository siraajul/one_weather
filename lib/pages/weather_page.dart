import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:one_weather/models/weather_model.dart';
import 'package:one_weather/services/weather_services.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //api key
  final _weatherService = WeatherService();
  Weather? _weather;

  _fetchWeather() async {
    //get current city
    String cityName = await _weatherService.getCurrentCity('');
    //any errors
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }
    //any errors
    catch (e) {
      print(e);
    }
  }
  //init state
  @override
  void initState(){
    super.initState();
    //fetch weather on startup
      _fetchWeather();
    }


  //weather animations
String getWeatherAnimation(String? mainCondition){
    if (mainCondition == null) return 'assets/sunny.json';//default to sunny

    switch(mainCondition.toLowerCase()){
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/raining.json';
      default:
        return 'assets/sunny.json';
    }
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_weather?.cityName ?? "loading city..."),
            //animation
            Lottie.asset('assets/raining.json'),
            Text('${_weather?.temperature.round()}ºC'),
            Text(_weather?.mainCondition ?? "")
          ],
        ),
      ),
    );
  }
}
