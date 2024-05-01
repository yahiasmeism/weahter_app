import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  WeatherModel weatherModel = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SearchView();
                      },
                    ),
                  );

                  log(weatherModel.cityName);
                },
                icon: const Icon(Icons.search))
          ],
          title: const Text(
            'Weather App',
          ),
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is NoWeatherState) {
              return const NoWeatherBody();
            } else if (state is LoadingWeatherState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadedWeatherState) {
              return const WeatherBody();
            } else {
              return const Center(
                child: Text('Oops there was an error, try later'),
              );
            }
          },
        ));
  }
}
