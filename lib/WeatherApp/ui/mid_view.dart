
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/WeatherApp/model/model.dart';
import 'package:weather/WeatherApp/util/switch.dart';

import '../model/model2.dart';

Widget midView(WeatherForecastModel2 snapshot, BuildContext context){
  var forecastDay = snapshot.location!.localtime;
  var forecastDayTemp = snapshot.current!.tempC;
  var forecastCity = snapshot.location!.name;
  var forecastRegion = snapshot.location?.region;
  var forecastCountry = snapshot.location?.country;
  var forecastDes = snapshot.current!.condition!.text;
  var forecastHumidity = snapshot.current!.humidity;
  var forecastWind = snapshot.current!.gustKph;
  var forecastDayBool = snapshot.current!.isDay;
  var sizeofmobilewidth = MediaQuery.of(context).size.width;

  return Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
       // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[



            SizedBox(height: 20,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Stack(
                    children: <Widget> [
                      Padding(
                        padding: const EdgeInsets.only(top: 48.0),
                        child: Row(
                          children: [
                            Text("$forecastCity ", style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 40,
                              color: Colors.white,
                              shadows: [
                    Shadow(
                    color: Colors.black.withOpacity(0.5),
                            offset: Offset(0.5, 0.5),
                            blurRadius: 80,
                    ),
                ],),),
                            Icon(Icons.location_on_rounded),],
                        ),
                      ),




                      Padding(
                        padding:  EdgeInsets.only(left: 205.0, top: 40, right: sizeofmobilewidth * 0.03),
                        child: getWeatherPic(forecastText: forecastDes, isDay: forecastDayBool!, heightt: 100.0, widthh: 90)!,
                      ),

                ])],
              ),
            //////////////////////////////////////////////////////////


                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text("${forecastDayTemp?.toStringAsFixed(0)}°",style: TextStyle(fontSize: 90,
                            fontWeight: FontWeight.w200,
                            shadows: [
                            Shadow(
                            color: Colors.black.withOpacity(0.5),
                          offset: Offset(0.5, 0.5),
                          blurRadius: 80,
                        ),
                          ]),),
                      ),
                    ),



            Divider(height: 1,),
            

                ],


              ),

            ),
      );



}

