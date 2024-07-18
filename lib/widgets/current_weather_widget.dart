import 'package:flutter/material.dart';
import 'package:weather/models/weather_data_current.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({super.key, required this.weatherDataCurrent});

  final WeatherDataCurrent weatherDataCurrent;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${weatherDataCurrent.current.windSpeed}'),
    );
  }
}
