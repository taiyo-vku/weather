import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

void main() {
  if (Platform.isAndroid || Platform.isIOS) {
    runApp(const Weather());
  }
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const Weather(),
  //   ),
  // );
}
