import '../models/weather_model.dart';

//enum WeatherStatus { initial, loading, loaded, error }

abstract class WeatherState {}

class InitialState extends WeatherState {
  @override
  List<Object> get props => [];
}

class LoadingState extends WeatherState {
  @override
  List<Object> get props => [];
}

class Loaded extends WeatherState {

  Loaded(this.weather);

  final Weather weather;

  @override
  List<Object> get props => [weather];
}

class Error extends WeatherState {
  @override
  List<Object> get props => [];
}
