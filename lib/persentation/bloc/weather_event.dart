part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

final class GetWaetherEvent extends WeatherEvent {
  final String cityName;

  GetWaetherEvent({required this.cityName});
}
