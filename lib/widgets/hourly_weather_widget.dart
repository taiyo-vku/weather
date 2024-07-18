import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/models/weather_data_hourly.dart';
import 'package:weather/utils/constants/app_colors.dart';

import '../controllers/global_controller.dart';

class HourlyWeatherWidget extends StatelessWidget {
  HourlyWeatherWidget({super.key, required this.weatherDataHourly});
  final WeatherDataHourly weatherDataHourly;

  // card index
  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.topCenter,
          child: Text('Today',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 18)),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
      height: 150,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weatherDataHourly.hourly.length > 12
              ? 12
              : weatherDataHourly.hourly.length,
          itemBuilder: (context, index) {
            return Obx((() => GestureDetector(
                  onTap: () {
                    cardIndex.value = index;
                  },
                  child: Container(
                    width: 90,
                    margin: const EdgeInsets.only(left: 20, right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0.5, 0),
                          color: AppColors.dividerLine.withAlpha(150),
                          blurRadius: 30,
                          spreadRadius: 1,
                        ),
                      ],
                      gradient: cardIndex.value == index
                          ? const LinearGradient(colors: [
                              AppColors.firstGradientColor,
                              AppColors.secondGradientColor
                            ])
                          : null,
                    ),
                    child: HourlyDetails(
                      index: index,
                      cardIndex: cardIndex.toInt(),
                      temp: weatherDataHourly.hourly[index].temp!,
                      timeStamp: weatherDataHourly.hourly[index].dt!,
                      weatherIcon:
                          weatherDataHourly.hourly[index].weather![0].icon!,
                    ),
                  ),
                )));
          }),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  int temp;
  int timeStamp;
  String weatherIcon;
  int index;
  int cardIndex;

  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  HourlyDetails(
      {super.key,
      required this.index,
      required this.cardIndex,
      required this.temp,
      required this.timeStamp,
      required this.weatherIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            getTime(timeStamp),
            style: TextStyle(
                color: cardIndex == index ? Colors.white : Colors.black),
          ),
        ),
        Container(
          child: Image.asset('assets/weather/$weatherIcon.png',
              height: 40, width: 40),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            '$temp°C',
            style: TextStyle(
                color: cardIndex == index ? Colors.white : Colors.black),
          ),
        ),
      ],
    );
  }
}
