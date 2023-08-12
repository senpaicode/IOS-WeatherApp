import 'package:flutter/material.dart';
import 'package:weather/WeatherApp/ui/mid_view.dart';

Widget? getWeatherPic({required String? forecastText,required int isDay,required double heightt,required double widthh}) {
  switch (isDay) {
    case 1:
      switch (forecastText) {
        case "Partly cloudy":
          return Image.asset('lib/assets/Day/pcloudy.png',height: heightt, width: widthh);
        case "Sunny":
          return Image.asset('lib/assets/Day/sunny.png', height: heightt, width: widthh,);
        case "cloudy":
          return Image.asset('lib/assets/Day/Cloudy.png',height: heightt, width: widthh);
        case "Overcast":
          return Image.asset("lib/assets/Day/Cloudy.png",height: heightt, width: widthh );
        case "Mist":
          return Image.asset("lib/assets/Day/Foggy.png",height: heightt, width: widthh);
        case "Patchy snow possible":
          return Image.asset("lib/assets/other/lsnow.png",height: heightt, width: widthh);
        case "Patchy sleet possible":
          return Image.asset("lib/assets/other/sleet.png",height: heightt, width: widthh);
        case "patchy freezing drizzle possible":
          return Image.asset("lib/assets/other/sleet.png",height: heightt, width: widthh);
        case "Thundery outbreaks possible":
          return Image.asset("lib/assets/Day/TStorm.png",height: heightt, width: widthh);
        case "Blowing snow":
          return Image.asset("lib/assets/other/Snow.png",height: heightt, width: widthh);
        case "blizzard":
          return Image.asset("lib/assets/Day/Lrain.png",height: heightt, width: widthh);
        case "Fog":
          return Image.asset("lib/assets/Day/Foggy.png",height: heightt, width: widthh);
        case "Patchy light rain":
          return Image.asset("lib/assets/Day/Lrain.png",height: heightt, width: widthh);
        case "Light rain":
          return Image.asset("lib/assets/Day/Lrain.png",height: heightt, width: widthh);
        case "Heavy rain":
          return Image.asset("lib/assets/Day/Rain.png",height: heightt, width: widthh);
        case "Light snow":
          return Image.asset("lib/assets/other/lsnow.png",height: heightt, width: widthh);
        case "Light rain shower":
          return Image.asset("lib/assets/Day/Tshower.png",height: heightt, width: widthh);
        default:
          return Image.asset("lib/assets/Day/Tshower.png",height: heightt, width: widthh);
      }
    case 0:
      switch (forecastText) {
        case "Clear":
          return Image.asset('lib/assets/Night/moon.png',height: heightt, width: widthh);
        case "Partly cloudy":
          return Image.asset("lib/assets/Night/pcloudy 0.png",height: heightt, width: widthh);
        case "cloudy":
          return Image.asset("lib/assets/Night/mcloudy 0.png",height: heightt, width: widthh);
        case "Overcast":
          return Image.asset("lib/assets/Night/mcloudy.png",height: heightt, width: widthh);//suspicious
        case "Mist":
          return Image.asset("lib/assets/other/wind.png",height: heightt, width: widthh);
        case "Patchy snow possible":
          return Image.asset("lib/assets/other/lsnow.png",height: heightt, width: widthh);
        case "Patchy sleet possible":
          return Image.asset("lib/assets/Night/hail 0.png",height: heightt, width: widthh);
        case "patchy freezing drizzle possible":
          return Image.asset("lib/assets/Night/moon.png",height: heightt, width: widthh);
        case "Thundery outbreaks possible":
          return Image.asset("lib/assets/Night/Tshower 0.png",height: heightt, width: widthh);
        case "Blowing snow":
          return Image.asset("lib/assets/other/Snow.png",height: heightt, width: widthh);
        case "blizzard":
          return Image.asset("lib/assets/other/Snow.png",height: heightt, width: widthh);
        case "Fog":
          return Image.asset("lib/assets/other/wind.png",height: heightt, width: widthh);
        case "Patchy light rain":
          return Image.asset("lib/assets/Night/moon.png",height: heightt, width: widthh);
        case "Light rain":
          return Image.asset("lib/assets/Night/Lrain 0.png",height: heightt, width: widthh);
        case "Heavy rain":
          return Image.asset("lib/assets/Night/rain 0.png",height: heightt, width: widthh);
        case "Light snow":
          return Image.asset("lib/assets/Night/hail 0.png",height: heightt, width: widthh);
        case "Light rain shower":
          return Image.asset("lib/assets/Night/Lrain 0.png",height: heightt, width: widthh);
        default:
          return Image.asset("lib/assets/Night/moon.png",height: heightt, width: widthh);
      }
  }
}
