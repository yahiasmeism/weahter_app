import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search a City',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onSubmitted: (value) {
              BlocProvider.of<GetWeatherCubit>(context)
                  .getCurrentWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Search',
              hintText: 'Enter City Name',
              suffix: Icon(Icons.search),
            ),
            autofocus: true,
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherModel;
