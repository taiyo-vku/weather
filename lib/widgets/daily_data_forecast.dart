import 'package:flutter/material.dart';
import 'package:weather/models/weather_data_daily.dart';

class DailyDataForecast extends StatefulWidget {
  const DailyDataForecast({super.key, required this.weatherDataDaily});

  final WeatherDataDaily weatherDataDaily;
  @override
  State<DailyDataForecast> createState() => _DailyDataForecastState();
}

class _DailyDataForecastState extends State<DailyDataForecast> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
