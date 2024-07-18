import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/models/weather_data_daily.dart';
import 'package:weather/utils/constants/app_colors.dart';

class DailyDataForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyDataForecast({super.key, required this.weatherDataDaily});

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('MMM').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              'Next Days',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: weatherDataDaily.daily.length > 7
              ? 7
              : weatherDataDaily.daily.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 60,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 80,
                        child: Text(getDay(weatherDataDaily.daily[index].dt)),
                      ),
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset(
                            'assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png'),
                      ),
                      Text(
                          '${weatherDataDaily.daily[index].temp!.min}°C/${weatherDataDaily.daily[index].temp!.max}°C'),
                      Container(height: 1, color: AppColors.dividerLine)
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
