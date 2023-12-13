import '../models/weather_model.dart';

//enum WeatherStatus { initial, loading, loaded, error }

abstract class WeatherState {}

class initialState extends WeatherState {}

class loadingState extends WeatherState {}

class loaded extends WeatherState {}

class error extends WeatherState {}
