import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/controllers/global_controller.dart';
import 'package:weather/widgets/current_weather_widget.dart';
import 'package:weather/widgets/header_widget.dart';
import 'package:weather/widgets/hourly_weather_widget.dart';

import '../widgets/daily_data_forecast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const HeaderWidget(),

                    /// for our current temp['current']
                    CurrentWeatherWidget(
                      weatherDataCurrent:
                          globalController.getData().getCurrentWeather(),
                    ),

                    // for our hourly
                    HourlyWeatherWidget(
                        weatherDataHourly:
                            globalController.getData().getHourlyWeather()),


                    // daily

                    DailyDataForecast(
                      weatherDataDaily: globalController.getData().getDailyWeather(),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
