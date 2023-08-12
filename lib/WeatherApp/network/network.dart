
import 'dart:convert';

import 'package:weather/WeatherApp/model/model.dart';
import 'package:http/http.dart';
import 'package:weather/WeatherApp/model/model2.dart';
import 'package:weather/WeatherApp/weather_forecast.dart';
import '../util/forecast_util.dart';

class Networkk{
  Future<WeatherForecastModel> getWeatherForecast({required String cityName}) async {
    String url = "http://api.weatherapi.com/v1/forecast.json?key=${Util.appId}&q=${cityName}&days=10&aqi=yes&alerts=yes";


        final responsee = await get(Uri.parse(url));

        if (responsee.statusCode == 200 ){

          return WeatherForecastModel.fromJson(jsonDecode(responsee.body));

        }else{
          throw Exception("we could not fetch the weather data");
        }

    }


  }


class Network{
  Future<WeatherForecastModel2> getWeatherForecast({required String cityName}) async {

  String url2 = "http://api.weatherapi.com/v1/current.json?key=${Util.appId}&q=${cityName}&aqi=no";

  final response = await get(Uri.parse(url2));

  if (response.statusCode == 200 ){
     print(response.body);

     return WeatherForecastModel2.fromJson(jsonDecode(response.body));

  }else{
      throw Exception("we could not fetch the weather data");
  }
}
  }