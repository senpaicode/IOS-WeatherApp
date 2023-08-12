import 'package:flutter/material.dart';
import 'weatherApp/weather_forecast.dart';

void main() {
  runApp(MyApp());

}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        // Customize other theme properties as desired
        // For example, you can set the background color:
        // scaffoldBackgroundColor: Colors.grey[900],
        // and text color:
        // textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
      ),
      home:weatherForecast(),
    );
  }
}