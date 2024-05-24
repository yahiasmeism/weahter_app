import 'package:dio/dio.dart';
class RemoteDataSource {
  final dio = Dio();

  RemoteDataSource();
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '8dd89e73090a497da47122751242504';
  Future<Map<String,dynamic>> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json',
        queryParameters: {
          "key": apiKey,
          'q': cityName,
        },
      );
      Map<String, dynamic> jsonData = response.data;
      return jsonData;
    } on DioException catch (e) {
      String messageError = e.response?.data['error']['message'] ??
          'oops, there was an error , try later';
      throw Exception(messageError);
    }
  }
}
