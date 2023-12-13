abstract class WeatherEvent {}

class FetchWeather extends WeatherEvent {
  final String cityName;

  FetchWeather(this.cityName);
}

class RefreshWeather extends WeatherEvent {
  final String cityName;

  RefreshWeather(this.cityName);
}
