
import 'package:flutter/material.dart';
import '../data/models/weather_model.dart';

MaterialColor weatherColor(WeatherModel? weather) {
  switch (weather?.conditionWeather) {
    case "Sunny":
      return Colors.amber;
    case "Cloudy":
    case "Overcast":
      return Colors.grey;
    case "Mist":
    case "Fog":
      return Colors.blueGrey;
    case "Partly cloudy":
    case "Patchy rain possible":
    case "Patchy light drizzle":
    case "Light drizzle":
    case "Freezing drizzle":
    case "Light freezing drizzle":
    case "Heavy freezing drizzle":
    case "Patchy light rain":
    case "Light rain":
    case "Moderate rain at times":
    case "Moderate rain":
    case "Patchy light snow":
    case "Light snow":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
      return Colors.lightBlue;
    case "Heavy rain at times":
    case "Heavy rain":
      return Colors.teal;
    case "Patchy heavy snow":
    case "Heavy snow":
    case "Blowing snow":
    case "Blizzard":
      return Colors.blueGrey;
    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
    case "Light snow showers":
    case "Moderate or heavy snow showers":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.lightBlue;
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
      return Colors.teal;
    default:
      return Colors.grey;
  }
}
