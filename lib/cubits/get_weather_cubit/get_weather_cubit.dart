import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_api.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  WeatherModel? weatherModel;
  getCurrentWeather({required String cityName}) async {
    try {
      emit(LoadingWeatherState());
      weatherModel =
          await WeatherApi(dio: Dio()).getCurrentWeather(cityName: cityName);
      emit(LoadedWeatherState());
    } catch (e) {
      emit(FailureWeatherState());
    }
  }
}
