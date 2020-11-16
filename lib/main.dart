import 'package:flutter/material.dart';

import 'package:weather_app/screens/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /// App Loads to the loading screen.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: LoadingScreen(),
    );
  }
}
