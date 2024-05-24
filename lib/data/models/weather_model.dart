class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String conditionWeather;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.conditionWeather,
      required this.image,
      required this.minTemp,
      required this.maxTemp,
      required this.temp});

  factory WeatherModel.fromJson(Map<String,dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      conditionWeather: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
    );
  }
}
