

import 'package:flutter/material.dart';
import 'package:weather/WeatherApp/model/model.dart';
import 'package:weather/WeatherApp/network/network.dart';
import 'package:weather/WeatherApp/ui/list.dart';
import 'package:weather/WeatherApp/ui/mid_view.dart';
import 'package:weather/WeatherApp/model/model2.dart';
import 'package:video_player/video_player.dart';
import "dart:math";


class weatherForecast extends StatefulWidget {
  const weatherForecast({Key? key}) : super(key: key);

  @override
  State<weatherForecast> createState() => _weatherForecastState();
}

class _weatherForecastState extends State<weatherForecast> {
  late Future<WeatherForecastModel> forecastObject;
  late Future<WeatherForecastModel2> forecastCurrentObj;
  late VideoPlayerController _controller = VideoPlayerController.asset("lib/assets/custom/clearnightcustom.mp4");
  String _cityName = "dubai";
  bool _isVideoInitialized = false;
  @override
  void initState() {
    super.initState();

    forecastObject = Networkk().getWeatherForecast(cityName: _cityName);
    forecastCurrentObj = Network().getWeatherForecast(cityName: _cityName);
    initializeBackgroundPict();


  }
  void initializeBackgroundPict() async {
    String backgroundPictPath = await backgroundPic(isDay: forecastCurrentObj,time:forecastObject );

    _controller = VideoPlayerController.asset(backgroundPictPath );

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body:
      Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child:  VideoPlayer(_controller),
              ),
            ),
          )
          ,
          SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height,
            child: ListView(
              children: <Widget>[
                Stack(
                    children:
                    <Widget>[
                      //drop,


                      FutureBuilder<List<dynamic>>(
                          future: Future.wait(
                              [forecastCurrentObj, forecastObject]),
                          builder: (BuildContext context, AsyncSnapshot<List<
                              dynamic>> snapshot) {
                            if (snapshot.hasData) {
                              print(snapshot.data![0]);
                              print(snapshot.data![1]);
                              List<dynamic> data = snapshot.data!;
                              WeatherForecastModel2 forecastCurrentData = data[0] as WeatherForecastModel2;
                              WeatherForecastModel forecastObjectData = data[1] as WeatherForecastModel;

                              if (forecastCurrentData != null &&
                                  forecastObjectData != null) {
                                return Column(
                                    children: <Widget>[
                                      midView(forecastCurrentData, context),

                                      firstWidget(forecastObjectData, context),
                                      SizedBox(height: 10,),
                                      SecWidget(snapshot: forecastObjectData),
                                      SizedBox(height: 10,),
                                      TenDayForecast(
                                          snapshot: forecastObjectData),
                                      Grids(snapshot: forecastObjectData, context: context,),
                                      airQuality(forecastObjectData)
                                    ]
                                );
                              } else {
                                return Container(
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.purpleAccent,),),
                                );
                              }
                            } else {
                              return Container(
                                child: Center(child: CircularProgressIndicator(
                                  color: Colors.purpleAccent,),),
                              );
                            }
                          }

                      ),

                      Column(
                        children: <Widget>[
                          textFieldView(),
                          Divider(thickness: 1, height: 10,)
                        ],
                      ),

                    ])
              ],
            ),
          ),

        ],
      ),
    );
  }


//             child: ListView(
//               children: <Widget>[
//                 Stack(
//                     children:
//                     <Widget>[
//                       //drop,
//
//
//                       FutureBuilder<List<dynamic>>(
//                           future: Future.wait(
//                               [forecastCurrentObj, forecastObject]),
//                           builder: (BuildContext context, AsyncSnapshot<List<
//                               dynamic>> snapshot) {
//                             if (snapshot.hasData) {
//                               print(snapshot.data);
//                               List<dynamic> data = snapshot.data!;
//                               WeatherForecastModel2 forecastCurrentData = data[0] as WeatherForecastModel2;
//                               WeatherForecastModel forecastObjectData = data[1] as WeatherForecastModel;
//
//                               if (forecastCurrentData != null &&
//                                   forecastObjectData != null) {
//                                 return Column(
//                                     children: <Widget>[
//                                       midView(forecastCurrentData),
//
//                                       firstWidget(forecastObjectData, context),
//                                       SizedBox(height: 30,),
//                                       SecWidget(snapshot: forecastObjectData),
//                                       SizedBox(height: 30,),
//                                       TenDayForecast(
//                                           snapshot: forecastObjectData),
//                                       Slide(snapshot: forecastCurrentData)
//                                     ]
//                                 );
//                               } else {
//                                 return Container(
//                                   child: Center(
//                                     child: CircularProgressIndicator(
//                                       color: Colors.purpleAccent,),),
//                                 );
//                               }
//                             } else {
//                               return Container(
//                                 child: Center(child: CircularProgressIndicator(
//                                   color: Colors.purpleAccent,),),
//                               );
//                             }
//                           }
//
//                       ),
//
//                       Column(
//                         children: <Widget>[
//                           textFieldView(),
//                           Divider(thickness: 1, height: 10,)
//                         ],
//                       ),
//
//                     ])
//               ],
//             ),
//           ;);
//   }
//
  Widget textFieldView() {
    return Container(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter Text",
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(8),
          ),
          onSubmitted: (value) {
            setState(() {
              _cityName = value;
              forecastCurrentObj =
                  new Network().getWeatherForecast(cityName: _cityName,);
              forecastObject =
                  new Networkk().getWeatherForecast(cityName: _cityName);

              initializeBackgroundPict();

            });
          },
        )
    );
  }

  Future<AssetImage> backgroundPicc(
      {required Future<WeatherForecastModel2> isDay}) async {
    var dayBool = await isDay.then((value) => value.current?.isDay);

    if (dayBool == 0) {
      return AssetImage('lib/assets/other/stars.jpg');
    } else {
      return AssetImage('lib/assets/other/noon.jpg');
    }
  }


  Future<String> backgroundPic(
      {required Future<WeatherForecastModel2> isDay, required Future<WeatherForecastModel> time}) async {
    var dayBool = await isDay.then((value) => value.current?.isDay);
    var dayCondition = await isDay.then((value) =>
    value.current?.condition?.text);
    var localTime = await isDay.then((value) => value.location!.localtime);
    var sunrise = await time.then((value) => value.forecast!.forecastday![0].astro!.sunrise);
    var sunset = await time.then((value) => value.forecast!.forecastday![0].astro!.sunset);
    var partlyCloudyList = [
      'lib/assets/live/partlycloudy.mp4',
      'lib/assets/live/partlycloudyv2.mp4',
      'lib/assets/live/partlycloudyv3.mp4'];

    var cloudyList = [
      'lib/assets/live/cloudylive.mp4',
      'lib/assets/live/cloudyv4.mp4'];

    var sunnyList = [
      'lib/assets/live/noon.mp4',
      'lib/assets/live/sunnyflare.mp4',
      'lib/assets/live/synnyeast.mp4',
      'lib/assets/custom/clearday.mp4'
    ];

    final _random = new Random();
    if (dayBool == 1) { // day
      switch (dayCondition) {
        case "Partly cloudy":

            return partlyCloudyList[_random.nextInt(partlyCloudyList.length)];

        case "Sunny":

            return sunnyList[_random.nextInt(sunnyList.length)];

        case "cloudy":

            return cloudyList[_random.nextInt(cloudyList.length)];

        case "Overcast":
          return 'lib/assets/custom/clearnightsky (1).mp4';
        case "Mist":
          return 'lib/assets/live/windy.mp4';
        case "Patchy snow possible":
          return '';
        case "Patchy sleet possible":
          return 'partlycloudy.mp4';
        case "patchy freezing drizzle possible":
          return 'lib/assets/live/rainfallgood (2).mp4';
        case "Thundery outbreaks possible":
          return 'lib/assets/live/heavyrain.mp4';
        case "Blowing snow":
          return 'lib/assets/live/snowy.mp4';
        case "blizzard":
          return 'lib/assets/live/snowy.mp4';
        case "Fog":
          return 'lib/assets/live/sootycloudy.mp4';
        case "Patchy light rain":
          return 'lib/assets/live/rainy.mp4';
        case "Light rain":
          return 'lib/assets/live/rainfallgood (2).mp4';
        case "Heavy rain":
          return "lib/assets/live/rainfallgood (2).mp4";
        case "Light snow":
          return 'lib/assets/custom/clearnightsky (1).mp4';
        case "Light rain shower":
          return 'lib/assets/live/rainy.mp4';
        default:
          return "lib/assets/custom/clearnightsky (1).mp4";
      }
    }
    else if (dayBool == 0) { // night
      switch (dayCondition) {
        case "Clear":
          return 'lib/assets/live/rainfallgood (2).mp4``````````````````````````````````````````````````````````                                                                                        ';
        case "Partly cloudy":
          return 'lib/assets/custom/clearnightsky (1).mp4';
        case "cloudy":
          return 'lib/assets/live/partlycloudynight.mp4';
        case "Overcast":
          return 'lib/assets/live/patchycloudsnight.mp4'; //suspicious
        case "Mist":
          return 'lib/assets/live/patchycloudsnight.mp4';
        case "Patchy snow possible":
          return 'lib/assets/live/sootycloudy.mp4';
        case "Patchy sleet possible":
          return 'lib/assets/live/sootycloudy.mp4';
        case "patchy freezing drizzle possible":
          return 'lib/assets/live/sootycloudy.mp4';
        case "Thundery outbreaks possible":
          return 'lib/assets/custom/thunder (1) (1).mp4';
        case "Blowing snow":
          return 'lib/assets/live/snowy.mp4';
        case "blizzard":
          return '';
        case "Fog":
          return 'lib/assets/custom/clearnightsky (1).mp4';
        case "Patchy light rain":
          return 'lib/assets/live/rainfallgood (2).mp4';
        case "Light rain":
          return 'lib/assets/live/rainfallgood (2).mp4';
        case "Heavy rain":
          return 'lib/assets/live/heavyrain.mp4';
        case "Light snow":
          return 'lib/assets/live/snowy.mp4';
        case "Light rain shower":
          return 'lib/assets/live/rainfallgood (2).mp4';
        default:
          return 'lib/assets/custom/clearnightsky (1).mp4';
      }
    }
    return '';
  }
}