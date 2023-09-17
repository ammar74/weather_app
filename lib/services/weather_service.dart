import 'package:weather_app/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherService{
  final Dio dio;
  final String baseUrl= 'https://api.weatherapi.com/v1';
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async{
    try {
      Response response =await dio.get(
          '$baseUrl/forecast.json?key=820017f404fe4d96a49204317231109&q=$cityName&days=1');
      WeatherModel weatherModel= WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message']??
          'Oops, there was an error, please try Again';
      throw Exception(errMessage);
    }catch(e){
      throw Exception('Oops, there was an error, please try Again');
    }
  }
}