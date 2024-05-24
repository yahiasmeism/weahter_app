import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/app/functions.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:progress_indicators/progress_indicators.dart' as prog;

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            weatherColor(weather)[300]!,
            weatherColor(weather),
            weatherColor(weather)[50]!,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weather.cityName,
            style: const TextStyle(fontSize: 38, fontWeight: FontWeight.w600),
          ),
          Text(
            'updated at : ${weather.date.hour}:${weather.date.month}',
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
                    imageUrl: weather.image.contains('http')
                        ? weather.image
                        : "https:${weather.image}"),
              ),
              Text(
                weather.temp.round().toString(),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Column(
                children: [
                  Text(
                    'maxTemp: ${weather.maxTemp.round()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'minTemp: ${weather.minTemp.round()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            weather.conditionWeather,
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
