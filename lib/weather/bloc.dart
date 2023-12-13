import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_weather/models/weather_model.dart';
import 'package:one_weather/services/weather_services.dart';
import 'package:one_weather/weather/state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService weatherService;

  WeatherCubit(this.weatherService) : super(WeatherState(status: WeatherStatus.initial));

  Future<void> fetchWeather(String cityName) async {
    emit(WeatherState(status: WeatherStatus.loading));
    try {
      final weather = await weatherService.getWeather(cityName);
      emit(WeatherState(status: WeatherStatus.loaded, weather: weather));
    } catch (e) {
      emit(WeatherState(status: WeatherStatus.error, errorMessage: 'Failed to load weather data'));
    }
  }
}
