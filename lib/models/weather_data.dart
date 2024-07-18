import 'package:weather/models/weather_data_hourly.dart';

import 'weather_data_current.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  WeatherData([this.current, this.hourly]);

  // function to fetch these values
  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather() => hourly!;
}
