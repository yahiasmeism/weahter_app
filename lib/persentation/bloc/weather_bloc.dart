import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../data/models/weather_model.dart';
import '../../data/repository/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({required this.weatherRepository}) : super(WeatherInitial()) {
    on<GetWaetherEvent>((event, emit) async {
      try {
        LoadingWeather();
        WeatherModel weather =
            await weatherRepository.getWeather(cityName: event.cityName);
        emit(LoadedWeather(weather: weather));
      } catch (ex) {
        emit(FailureWeather(message: ex.toString()));
      }
    });
  }
}
