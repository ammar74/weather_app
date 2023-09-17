import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0,),
        child: Center(
          child: TextField(
            onSubmitted: (value) async{
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 28,
              ),
              labelText: 'Search',
              suffixIcon: const Icon(Icons.search),
              hintText: 'Please Enter City Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              )
            ),
          ),
        ),
      ),
    );
  }
}
