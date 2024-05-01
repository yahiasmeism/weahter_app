import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherApi {
  final Dio dio;

  WeatherApi({required this.dio});
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '8dd89e73090a497da47122751242504';
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json',
        queryParameters: {
          "key": apiKey,
          'q': cityName,
        },
      );
      Map<String, dynamic> jsonData = response.data;
      WeatherModel weatherModel = WeatherModel.fromJson(jsonData);
      return weatherModel;
    } on DioException catch (e) {
      String messageError = e.response?.data['error']['message'] ??
          'oops, there was an error , try later';
      throw Exception(messageError);
    }
  }
}
