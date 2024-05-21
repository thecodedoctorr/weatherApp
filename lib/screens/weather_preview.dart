import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/blocs/weather_bloc.dart';
import 'package:weatherapp/blocs/weather_event.dart';
import 'package:weatherapp/blocs/weather_state.dart';
import 'package:weatherapp/models/weather_conditions.dart';
import 'package:weatherapp/repo/api.dart';
import 'package:weather_animation/weather_animation.dart';

class WeatherPreview extends StatefulWidget {
  const WeatherPreview({super.key});

  @override
  State<WeatherPreview> createState() => _WeatherPreviewState();
}

class _WeatherPreviewState extends State<WeatherPreview> {
  DateTime todaysDate = DateTime.now();

  int currentIndex = 0;
  bool _isLoading = true;

  Position defaultPosition = Position(
    latitude: 0.0,
    longitude: 0.0,
    timestamp: DateTime.now(),
    accuracy: 1.0,
    altitude: 0.0,
    heading: 0.0,
    speed: 0.0,
    speedAccuracy: 1.0,
    altitudeAccuracy: 0.0,
    headingAccuracy: 0.0,
  );
  WeatherCondition defaultWeather = WeatherCondition(location: '', mainCondition: [], temp: [], humidity: [], pressure: [], );

  late WeatherCondition? weather = defaultWeather;
  late Position? currentCoordinates = defaultPosition;
  late WeatherService _weatherService;

  @override
  void initState() {
    super.initState();
    getCurrentCoordinates().then((_) {
      _weatherService = WeatherService(longitude: currentCoordinates!.longitude, latitude: currentCoordinates!.latitude);
      _startLoading();
      fetchData();
      setState(() {});
      context.read<WeatherBloc>().add(CurrentCoordinatesDetermined(currentCoordinates: currentCoordinates));
    });
  }

  String getSpecificDateAndDayName(int index) {
    switch (index) {
      case 0:
        String dayName = DateFormat('E').format(todaysDate);
        String monthDay = DateFormat('MMMM d').format(todaysDate);
        return '$dayName, $monthDay';
      case 1:
      case 2:
      case 3:
        DateTime nextDay = todaysDate.add(Duration(days: index));
        String dayName = DateFormat('E').format(nextDay);
        String monthDay = DateFormat('MMMM d').format(nextDay);
        return '$dayName, $monthDay';
      default:
        return 'Invalid index';
    }
  

  }
  String getWeatherImage(int currentIndex){
    switch (weather!.mainCondition[currentIndex]){
      case 'Rain':
        return 'assets/images/rainy.jpeg';
      case 'Clouds':
        return 'assets/images/cloudy.jpeg';
      case 'Sun':
        return 'assets/images/sunny.jpg';
      case 'Wind':
        return 'assets/images/windy.jpeg';
      default:
        return 'assets/images/sunny.jpg';
    }
  }


  Future<void> getCurrentCoordinates() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      return;
    }
    LocationPermission locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return;
      }
    }

    if (locationPermission == LocationPermission.deniedForever) {
      return;
    }

    currentCoordinates = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }

  Future<String> getCityName() async {
    List<Placemark> placeMark = await placemarkFromCoordinates(currentCoordinates!.latitude, currentCoordinates!.longitude);
    String? city = placeMark[0].locality;
    return city?? '';
  }

  Future<void> fetchData() async {
    if (currentCoordinates!= null) {
      try {
        weather = await _weatherService.fetchData();
        setState(() {});
      } catch (e) {
        if (kDebugMode) {
          print('Error fetching data: $e');
        }
      }
    }
  }

  void _startLoading() {
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void _retry() {
    setState(() {
      _isLoading = true;
    });
    _startLoading();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    double _startDragY = 0.0;

    return BlocConsumer<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state.currentCoordinates!= currentCoordinates) {
          currentCoordinates = state.currentCoordinates;
          _weatherService = WeatherService(longitude: currentCoordinates!.longitude, latitude: currentCoordinates!.latitude);
          fetchData();
        }
        if(currentIndex != state.daysIndex){
          currentIndex = state.daysIndex;
          fetchData();
        }
        if (state.weatherData!= weather) {
          weather = state.weatherData;
        }
      },

      builder: (BuildContext context, WeatherState state) {
        return GestureDetector(
          onVerticalDragStart: (details) {
            _startDragY = details.localPosition.dy;
          },
          onVerticalDragUpdate: (distance){
            if(distance.localPosition.dy > _startDragY + 50 ){
              setState(() {
                currentIndex = 0;
              });
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (weather != defaultWeather && weather != null) ?
                Column(
                  children: [
                    Text('${weather!.location} : ${getSpecificDateAndDayName(currentIndex)}', style: TextStyle(fontWeight: FontWeight.bold),),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Over all condition: ${weather!.mainCondition[currentIndex]}'),
                        Image.asset(getWeatherImage(currentIndex),
                          height: 250,
                          scale: 1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Text('Humidity: ${weather!.humidity[currentIndex]}'),
                    Text('Pressure: ${weather!.pressure[currentIndex]}'),
                    Text('temp: ${weather!.temp[currentIndex]}'),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap:(){
                              context.read<WeatherBloc>().add(IndexChanged(index: 0));
                            },
                            child: Column(
                              children: [
                                Text(getSpecificDateAndDayName(0)),
                                Text(weather!.mainCondition[0]),
                                Image.asset(getWeatherImage(0),
                                  height: 50,
                                  scale: 1,
                                )
                              ],
                            )),
                        const SizedBox(width: 30,),
                         GestureDetector(
                           onTap:(){
                             context.read<WeatherBloc>().add(IndexChanged(index: 1));
                           },
                        child: Column(
                          children: [
                            Text(getSpecificDateAndDayName(1)),
                            Text(weather!.mainCondition[1]),
                            Image.asset(getWeatherImage(1),
                              height: 50,
                              scale: 1,
                            )
                          ],
                        )),
                        const SizedBox(width:30,),
                        GestureDetector(
                          onTap:(){
                            context.read<WeatherBloc>().add(IndexChanged(index: 2));
                          },
                          child: Column(
                            children: [
                              Text(getSpecificDateAndDayName(2)),
                              Text(weather!.mainCondition[2]),
                              Image.asset(getWeatherImage(2),
                                height: 50,
                                scale: 1,
                              )
                            ],
                          )),
                        const SizedBox(width:30,),
                        GestureDetector(
                          onTap:(){
                            context.read<WeatherBloc>().add(IndexChanged(index: 3));
                          },
                          child: Column(
                            children: [
                              Text(getSpecificDateAndDayName(3)),
                              Text(weather!.mainCondition[3]),
                              Image.asset(getWeatherImage(3),
                                height: 50,
                                scale: 1,
                              )
                            ],
                          ))

                    ],),
                  ],
                )
                  :  Center(
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: _retry,
                  child: const Text('Retry', style: TextStyle(color: Colors.black)),
                ),
              ),
              ],
          ),
        );
      },
    );
  }
}
