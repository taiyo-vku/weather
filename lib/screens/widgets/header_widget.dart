import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather/controllers/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = '';
  final globalController = GlobalController.instane;

  @override
  void initState() {
    getAddress(globalController.getLattiude().value , globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(city),
        ),
      ],
    );
  }
}
