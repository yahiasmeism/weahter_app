import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/functions.dart';
import 'package:weather_app/bloc_observer.dart';
import 'package:weather_app/data/data_source/remote/remote_data_source.dart';
import 'package:weather_app/persentation/bloc/weather_bloc.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/persentation/views/home_view.dart';

void main(List<String> args) {
  Bloc.observer = MyBlocObserver();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(
          weatherRepository: WeatherRepository(remote: RemoteDataSource())),
      child: Builder(builder: (context) {
        return BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                useMaterial3: false,
                colorSchemeSeed:
                    state is LoadedWeather ? weatherColor(state.weather) : null,
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
