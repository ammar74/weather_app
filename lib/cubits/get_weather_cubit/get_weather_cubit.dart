import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialState());

   WeatherModel? weatherModel;

  getWeather(String cityName) async{
    try {
      weatherModel=
      await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      if (weatherModel != null ){
        emit(WeatherLoadedState(weatherModel: weatherModel!));
      }else if( weatherModel==null){
        emit(WeatherFailureState());
      }else{
        emit(IsLoadingState());
      }
    }  catch (e) {
      emit(WeatherFailureState());
    }
  }


}
