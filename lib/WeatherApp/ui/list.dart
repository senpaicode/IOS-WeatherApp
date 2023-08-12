import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/WeatherApp/model/model.dart';
import 'package:weather/WeatherApp/model/model2.dart';

DateTime now = DateTime.now();
int currentHour = now.hour;

Widget firstWidget(WeatherForecastModel snapshot, BuildContext context) {
  List<dynamic> alerts = snapshot.alerts!.alert!;
  return ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.1),
              border: Border.all(color: Colors.black.withOpacity(0.05)),
              borderRadius: BorderRadius.circular(20)),
          height: 80.0,
          width: MediaQuery.of(context).size.width - 40,
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 30.0,
                );
              },
              padding: EdgeInsets.all(50.0),
              itemCount: snapshot.alerts!.alert!.length,
              itemBuilder: (context, index) {
                // or return Text(snapshot.data[index].to_s);
                return Text("${alerts[index]}");
              }) //Icon(Icons.warning_amber_outlined, size: 50,),

          ),
    ),
  );
}

// Widget secWidget(WeatherForecastModel snapshot, BuildContext context) {
//   var forecast = snapshot.forecast?.forecastday?[0].hour;
//   return ClipRRect(
//     borderRadius: BorderRadius.circular(20.0),
//     child: Container(
//       height: 400.0,
//       width: MediaQuery.of(context).size.width,
//       color: Colors.grey.withOpacity(1),
//       child: ListView.builder(itemBuilder:
//       (context, index)
//       ),
//     ),
//   );
// }

class SecWidget extends StatefulWidget {
  final WeatherForecastModel snapshot;

  SecWidget({Key? key, required this.snapshot}) : super(key: key);

  @override
  State<SecWidget> createState() => _SecWidgetState();
}

class _SecWidgetState extends State<SecWidget> {
  @override
  Widget build(BuildContext context) {
    var forecast = widget.snapshot.forecast?.forecastday?[0].hour;
    var forecastday = widget.snapshot.forecast?.forecastday;
    var last = widget.snapshot.current?.lastUpdated;
    var updated = last!.split(" ")[1];
    List<dynamic> newList = <dynamic>[];
    // for(var hour in  forecast!){
    //   List<dynamic> oldList =  <dynamic>[];
    //
    //   if(int.parse(hour.time!.split(" ")[1].split(":")[0]) > (int.parse(updated.split(":")[0])) -1  ){
    //     print(updated);
    //     print(hour.time!.split(" ")[1].split(":")[0]);
    //
    //     if(hour.time != "Now"){
    //       hour.time = hour.time!.split(" ")[1].split(":")[0];
    //     }
    //     if(hour?.time == updated.split(":")[0]){
    //       hour.time = "Now";
    //
    //
    //     }
    //     oldList.add(hour);
    //     setState(() {
    //       newList = oldList;
    //     });
    //
    //   }
    //
    //
    // }
    print("${newList.length}ooooooo");
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          decoration:
              new BoxDecoration(color: Colors.grey.shade200.withOpacity(0.05)),
          height: 200,
          width: MediaQuery.of(context).size.width - 20,
          child: IntrinsicWidth(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.access_time,
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Hourly Forecast ",
                        style: TextStyle(color: Colors.white.withOpacity(0.75)),
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: forecast!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              index != 0
                                  ? Text(
                                      "${forecast[index].time!.split(" ")[1].substring(0, 2)}")
                                  : Text("Now"),
                              Image.network(
                                  "https:${forecast?[index].condition?.icon}"),
                              Text(
                                  "${forecast?[index].tempC?.toStringAsFixed(0)}°C")
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class secWidget extends StatelessWidget {
//   const secWidget({Key? key, required this.snapshot}) : super(key: key);
//   final WeatherForecastModel snapshot;
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     var forecast = snapshot.forecast?.forecastday?[0].hour;
//     var forecastday = snapshot.forecast?.forecastday;
//     var last = snapshot.current?.lastUpdated;
//     var updated = last!.split(" ")[1];
//     for(var hour in  forecast!){
//       if(int.parse(hour.time!.split(" ")[1].split(":")[0]) >= int.parse(updated.split(":")[0])  ){
//         print(updated);
//         print(hour.time!.split(" ")[1].split(":")[0]);
//
//       }
//
//     }
//     print(updated);
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(20.0),
//       child:
//           BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
//             child: Container(
//               decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
//               height: 200,
//               width: MediaQuery.of(context).size.width - 10,
//               child: IntrinsicWidth(
//                 child: Column(
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.only( top: 40, bottom:0
//                       ),
//                       child: Divider(
//                         thickness: 1,
//                       ),
//                     ),
//                     Expanded(
//                       child: ListView.builder(
//                       itemCount: forecast?.length ,
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder:
//                       (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: new Column(
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              children: <Widget>[
//                                 Text("${forecast?[index].time!.split(" ")[1]}"),
//                                 Image.network("https:${forecast?[index].condition?.icon}"),
//                                 Text("${forecast?[index].tempC}°C")
//                           ],
//
//                          ),
//                         );}
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//     );
//   }
// }

class TenDayForecast extends StatelessWidget {
  const TenDayForecast({Key? key, required this.snapshot}) : super(key: key);
  final WeatherForecastModel snapshot;

  @override
  Widget build(BuildContext context) {
    var forecastday = snapshot?.forecast?.forecastday;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration:
              BoxDecoration(color: Colors.grey.shade200.withOpacity(0.1)),
          height: 400,
          width: MediaQuery.of(context).size.width - 20,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    Text(
                      " 3 DAY FORECAST",
                      style: TextStyle(color: Colors.white.withOpacity(0.5)),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: forecastday?.length,
                    itemBuilder: (contect, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Stack(
                                    alignment: AlignmentDirectional.centerStart,
                                    children: <Widget>[
                                      Text(
                                        "${forecastday?[index]?.date != null ? DateFormat('EEEE').format(DateTime.parse(forecastday![index].date!)) : ''} "
                                            .substring(0, 3),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 80.0),
                                        child: Text(
                                            "${forecastday?[index].day?.avgtempC?.toStringAsFixed(0)}°",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 140,
                                        ),
                                        child: Image.network(
                                            "https:${forecastday?[index].day?.condition?.icon}"),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 220),
                                        child: Text(
                                          "${forecastday![0].day!.maxtempC!.toStringAsFixed(0)}°",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 290),
                                        child: Text(
                                          "${forecastday![0].day!.mintempC!.toStringAsFixed(0)}°",
                                          style: TextStyle(
                                              color:
                                                  Colors.grey.withOpacity(0.9),
                                              fontSize: 20),
                                        ),
                                      )
                                    ]),
                              ],
                            ),
                            Divider(thickness: 1),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorPicker extends StatefulWidget {
  final double width;
  final double UV;
  final List<Color> colors;
  ColorPicker(this.width, this.UV, this.colors);
  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Center(
              child: Container(
            child: Stack(children: <Widget>[
              Container(
                width: widget.width,
                height: 8,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey.shade600),
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(colors: widget.colors),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 3.5),
                  child: CustomPaint(
                    painter: _SliderIndicatorPainter((160 / 11) * widget.UV),
                  ))
            ]),
          )),
        ),
      ],
    );
  }
}

class _SliderIndicatorPainter extends CustomPainter {
  final double position;
  _SliderIndicatorPainter(this.position);
  @override
  void paint(Canvas canvas, Size size) {
    double radius = 8;
    canvas.drawCircle(
        Offset(position, size.height / 2), 4, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(_SliderIndicatorPainter old) {
    return true;
  }
}

class Grids extends StatefulWidget {
  final WeatherForecastModel snapshot;
  const Grids({Key? key, required this.snapshot, context}) : super(key: key);

  @override
  State<Grids> createState() => _GridsState();
}

class _GridsState extends State<Grids> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(crossAxisCount: 2,
                  children: <Widget>[
                UVrangeWidget(widget.snapshot, context),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: humidity(widget.snapshot),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

Widget UVrangeWidget(WeatherForecastModel snapshot, BuildContext context) {
  final UVValue = snapshot.current!.uv;
  final List<Color> colors = [
    Color.fromARGB(255, 61, 209, 85),
    Color.fromARGB(255, 113, 210, 65),
    Color.fromARGB(255, 189, 212, 30),
    Color.fromARGB(255, 255, 207, 15),
    Color.fromARGB(255, 255, 193, 6),
    Color.fromARGB(255, 254, 178, 1),
    Color.fromARGB(255, 255, 150, 12),
    Color.fromARGB(255, 255, 150, 12),
    Color.fromARGB(255, 255, 87, 70),
    Color.fromARGB(255, 250, 57, 99),
    Color.fromARGB(255, 237, 63, 134),
    Color.fromARGB(255, 225, 71, 165),
    Color.fromARGB(255, 210, 80, 203),
    Color.fromARGB(255, 196, 87, 234),
  ];
  return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
              decoration: new BoxDecoration(
                  color: Colors.grey.shade200.withOpacity(0.1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.sunny,
                          color: Colors.white.withOpacity(0.5),
                          size: 17,
                        ),
                        Text(" UV INDEX",
                            style:
                                TextStyle(color: Colors.white.withOpacity(0.5)))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 120.0),
                    child: Text(
                      "${UVValue?.toStringAsFixed(0)}",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 70, top: 5),
                    child: UvDescription(UVValue!),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8),
                      child: ColorPicker(300, UVValue!, colors),
                    ),
                  ),
                ],
              ))));
}

Widget UvDescription(double UV) {
  if (UV <= 2) {
    return Text(
      "Low",
      style: TextStyle(fontSize: 20),
    );
  } else if (UV >= 3 || UV <= 5) {
    return Text("Moderate", style: TextStyle(fontSize: 20));
  } else if (UV >= 6 || UV <= 7) {
    return Text("High", style: TextStyle(fontSize: 20));
  } else if (UV >= 8 || UV <= 10) {
    return Text("Very high", style: TextStyle(fontSize: 20));
  } else {
    return Text("Extreme", style: TextStyle(fontSize: 20));
  }
}

Widget humidity(WeatherForecastModel snapshot) {
  var humidity = snapshot.current!.humidity;
  var temp = snapshot.current!.tempC;
  var dewPoint = temp! - ((100 - humidity!) / 5);
  return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
              decoration: new BoxDecoration(
                  color: Colors.grey.shade200.withOpacity(0.1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.droplet,
                          size: 17,
                          color: Colors.white.withOpacity(0.5),
                        ),
                        Text(" HUMIDITY",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 80),
                    child: Text(
                      "${humidity}%",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 8),
                    child: Text("The dew point is ${dewPoint.toStringAsFixed(0)} right now"),
                  )
                ],
              ))));
}

Widget airQuality(WeatherForecastModel snapshot) {
  final airQuality = snapshot.current!.airQuality!.co;
  final List<Color> colors = [

    Color.fromARGB(255, 29, 149, 251),
    Color.fromARGB(255,31,149,249),
    Color.fromARGB(255,51,153,234),
    Color.fromARGB(255,91,168,193),
    Color.fromARGB(255, 180, 165, 203),
    Color.fromARGB(255, 213,215,70),
    Color.fromARGB(255, 226, 219, 62),
    Color.fromARGB(255,255,224,30),
    Color.fromARGB(255, 254, 201, 24),
    Color.fromARGB(255, 255, 170, 14),
    Color.fromARGB(255, 254, 122, 18),
    Color.fromARGB(255, 253, 90, 32),
    Color.fromARGB(255, 250, 57, 56),
    Color.fromARGB(255, 245, 13, 78),
    Color.fromARGB(255, 179, 20, 57),
    Color.fromARGB(255, 126, 29, 43),
    Color.fromARGB(255, 127, 22, 43),
    Color.fromARGB(255, 131, 17, 47),
    Color.fromARGB(255, 116, 31, 31),
  ];

  return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
              decoration: new BoxDecoration(
                  color: Colors.grey.shade200.withOpacity(0.1)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.wind_power_rounded, color:Colors.white.withOpacity(0.5) ),
                          Text("AIR QUALITY",style: TextStyle(
                              color: Colors.white.withOpacity(0.5)))
                        ]
                      ),
                    ),
                    Text("${airQuality!.toStringAsFixed(0)}",style: TextStyle(fontSize: 20)),
                    SizedBox(height: 10, ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: ColorPicker(300, 12, colors),
                    ),

                  ]))));
}
