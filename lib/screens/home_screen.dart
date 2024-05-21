
import 'package:flutter/material.dart';
import 'package:weatherapp/blocs/weather_bloc.dart';
import 'package:weatherapp/screens/weather_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text('Ouafae Weather'),
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
    ),
    drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Handle drawer item tap
              },
            ),
            // Add more ListTile widgets for additional drawer items
          ],
        ),
      ),
    body: BlocProvider(
    create: (context) => WeatherBloc(),
    child: const WeatherPreview(),
    ));
  }
}