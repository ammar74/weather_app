import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//  Widget widget;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context){
                      return const SearchScreen();
                    }));
              },
              icon:const Icon(Icons.search) ,
          ),
        ],
      ),
      body:  BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
             if(state is InitialState){
              return const NoWeatherBody();
            }else if (state is IsLoadingState){
               return const Center(child: CircularProgressIndicator());
             } else if( state is WeatherLoadedState){
              return WeatherInfoBody(
                weather: state.weatherModel,
              );
            }else {
             return const Center(child: Text(' Oops there is an Error'));
            }
        } ,
      ),
    );
  }
}
