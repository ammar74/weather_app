
import 'package:weather_app/models/weather_model.dart';

abstract class WeatherState {}

class InitialState extends WeatherState{}

class IsLoadingState extends WeatherState{}

class WeatherLoadedState extends WeatherState{
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState{}
