import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:one_weather/models/weather_model.dart';
import 'package:one_weather/services/weather_services.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../weather/bloc.dart';
import '../weather/event.dart';
import '../weather/state.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(weatherService: WeatherService())
        ..add(FetchWeather('Sylhet')),
      child: BuildWeather(),
    );
  }
}

class BuildWeather extends StatelessWidget {
  const BuildWeather({super.key});

  //weather animations
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json'; //default to sunny

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
          if (state is LoadingState) {
            return const CircularProgressIndicator();
          }

          if (state is Loaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.weather.cityName ?? "loading city...",
                    style: const TextStyle(fontSize: 56.0, color: Colors.white),
                  ),
                  //animation
                  Lottie.asset('assets/raining.json'),
                  Text(
                    '${state.weather?.temperature.round()}ºC',
                    style: const TextStyle(fontSize: 46.0, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    state.weather?.mainCondition ?? "",
                    style: const TextStyle(fontSize: 26.0, color: Colors.white),
                  )
                ],
              ),
            );
          } else {
            return Text('Something went wrong');
          }
        }));
  }
}
