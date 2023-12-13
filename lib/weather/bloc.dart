import 'package:bloc/bloc.dart';
import 'package:one_weather/weather/state.dart';
import '../services/weather_services.dart';
import 'event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({required this.weatherService}) : super(InitialState()) {
    on<FetchWeather>(_fetchWeather);
  }

  final WeatherService weatherService;


  Future<void> _fetchWeather(
    FetchWeather event,
    Emitter<WeatherState> emit,
  ) async {
    emit(LoadingState());

    final weather = await weatherService.getWeather(event.cityName);

    emit(Loaded(weather));


  }
}
