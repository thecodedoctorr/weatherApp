import 'package:dio/dio.dart';


import 'package:weatherapp/models/weather_conditions.dart';


class WeatherService{
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/forecast';
  static const apiKey = 'b2da5bd80452b4283d21efaf1126c2e5';
  final double latitude;
  final double longitude;

  WeatherService({required this.longitude, required this.latitude });

  Future<WeatherCondition> fetchData() async {
    final dio = Dio();
    final response = await dio.get('$_baseUrl?lat=$latitude&lon=$longitude&appid=$apiKey');
    if (response.statusCode == 200) {
      return WeatherCondition.fromJson(response.data);
    } else {
      throw Exception('Failed to load data');

    }
  }

}
