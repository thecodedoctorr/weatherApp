import 'package:flutter/material.dart';

class ForecastDetailed extends StatelessWidget{
  final IconData weatherIcon;
  const ForecastDetailed({super.key, required this.weatherIcon});

  @override
  Widget build(BuildContext context) {
    return Card(
      // abr of the day
      child: Icon(weatherIcon, size: 100)
      // description
      // max/min temp
    );
  }
}