import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weather_bloc.dart';
import 'search_view.dart';
import '../widgets/no_weather_body.dart';
import '../widgets/weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
        title: const Text(
          'Weather App',
        ),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return const NoWeatherBody();
          } else if (state is LoadingWeather) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedWeather) {
            return WeatherBody(
              weather: state.weather,
            );
          } else {
            return const Center(
              child: Text('Oops there was an error, try later'),
            );
          }
        },
      ),
    );
  }
}
