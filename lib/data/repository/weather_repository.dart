import 'package:weather_app/data/data_source/remote/remote_data_source.dart';

import '../models/weather_model.dart';

class WeatherRepository {
  final RemoteDataSource remote;
  WeatherRepository({required this.remote});
  Future<WeatherModel> getWeather({required String cityName}) async {
    final jsonData = await remote.getCurrentWeather(cityName: cityName);
    return WeatherModel.fromJson(jsonData);
  }
}
