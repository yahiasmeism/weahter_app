import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:progress_indicators/progress_indicators.dart' as prog;

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getWeatherColor(weatherModel.conditionWeather),
            getWeatherColor(weatherModel.conditionWeather)[300]!,
            getWeatherColor(weatherModel.conditionWeather)[50]!,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: const TextStyle(fontSize: 38, fontWeight: FontWeight.w600),
          ),
          Text(
            'updated at : ${weatherModel.date.hour}:${weatherModel.date.month}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Transform.scale(
                scale: 1.5,
                child: CachedNetworkImage(
                    height: 60,
                    width: 60,
                    placeholder: (context, url) {
                      return Center(child: prog.JumpingDotsProgressIndicator());
                    },
                    imageUrl: weatherModel.image.contains('http')
                        ? weatherModel.image
                        : "https:${weatherModel.image}"),
              ),
              Text(
                weatherModel.temp.round().toString(),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Column(
                children: [
                  Text(
                    'maxTemp: ${weatherModel.maxTemp.round()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'minTemp: ${weatherModel.minTemp.round()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            weatherModel.conditionWeather,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
