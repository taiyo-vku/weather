import 'package:flutter/material.dart';
import 'package:weather/views/get_started.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: GetStarted(),
    );
  }
}
