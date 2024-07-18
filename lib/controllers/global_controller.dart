import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather/api/fetch_weather_api.dart';

import '../models/weather_data.dart';

class GlobalController extends GetxController {
  static GlobalController get instane => Get.find();
  // create various variables
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;
  // instance for them to be called
  RxBool checkLoading() => _isLoading;
  RxDouble getLattiude() => _latitude;
  RxDouble getLongitude() => _longitude;

  final weatherData = WeatherData().obs;
  getData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }{
      getIndex();
    }
    super.onInit();
  }

  Future<dynamic> getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // return if service is not enabled
    if (!isServiceEnabled) {
      return Future.error('Location not enabled');
    }

    // Status of permission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('Location permission are denied forever.');
    } else if (locationPermission == LocationPermission.denied) {
      // request permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error('Location permission are denied.');
      }
    }

    // getting the currentposition
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      // update our lattiude and longitude
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;
      // calling our weather api

      return FetchWeatherAPI()
          .processData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });
    });
  }


  RxInt getIndex()
  {
    return _currentIndex;
  }
}
