part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class LoadingWeather extends WeatherState {}

final class LoadedWeather extends WeatherState {
  final WeatherModel weather;

  LoadedWeather({required this.weather});
}

final class FailureWeather extends WeatherState {
  final String message;

  FailureWeather({required this.message});
}
