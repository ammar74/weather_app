class WeatherModel {

  final String cityName;
  final DateTime date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String? image;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    this.image,
    required this.weatherCondition});

  factory WeatherModel.fromJson(json){
    return WeatherModel(
        cityName: json['location']['name'],
        date: DateTime.parse(json['location']['localtime']),
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon']
    );
 }
}