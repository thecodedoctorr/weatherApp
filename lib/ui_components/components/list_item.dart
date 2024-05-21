import 'package:flutter/material.dart';

class ForecastListItem extends StatelessWidget{
  final IconData weatherIcon;
  const ForecastListItem({super.key, required this.weatherIcon});

  @override
  Widget build(BuildContext context) {
    return Card(
      // abr of the day
      child: Icon(weatherIcon)
      // description
      // max/min temp
    );
  }


}