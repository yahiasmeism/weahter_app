abstract class WeatherState{}
class NoWeatherState extends WeatherState{}
class LoadingWeatherState extends WeatherState{}
class LoadedWeatherState extends WeatherState{}
class FailureWeatherState extends WeatherState{}