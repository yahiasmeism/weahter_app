import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main(List<String> args) {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                useMaterial3: false,
                colorSchemeSeed: getWeatherColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.conditionWeather),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getWeatherColor(String? weather) {
  switch (weather) {
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
