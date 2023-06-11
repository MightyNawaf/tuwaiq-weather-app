import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_api/data.dart';
import 'package:weather_api/models/city_info.dart';
import 'package:weather_api/screens/home_screen.dart';

class CityCard extends StatelessWidget {
  const CityCard({super.key, required this.info});

  final CityInfo info;

  @override
  Widget build(BuildContext context) {
    // Color c;

    Color? colro = Colors.white;

    String? image_weather =
        "data:image/jpeg;base64,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";

    switch (info.current!.condition?.text) {
      case "Clear":
        image_weather =
            "https://images.pexels.com/photos/912364/pexels-photo-912364.jpeg?cs=srgb&dl=pexels-brett-sayles-912364.jpg&fm=jpg";
        colro = Colors.blue[50];
        break;

      case "Sunny":
        image_weather =
            "https://media.istockphoto.com/id/950900006/photo/beautiful-blue-sky-and-shining-sun.jpg?s=612x612&w=0&k=20&c=cPMvIHgqVY7cm0DjP3FioZRHZy-qTg7SZrpfEld03vg=";
        colro = Colors.yellow[50];
        break;

      case "Partly cloudy":
        image_weather =
            "https://media.istockphoto.com/id/598222542/photo/sky-background.jpg?s=612x612&w=0&k=20&c=WBAiCExAztT4SzWh4hIgmQwTG7VMJ5o9oObXHszmm8A=";
        colro = Colors.blueGrey;
        break;

      case "Overcast":
        image_weather =
            "https://www.rochesterfirst.com/wp-content/uploads/sites/66/2021/04/sky-1107579_1920.jpg";
        colro = Colors.black;
        break;

      default:
        image_weather =
            "data:image/jpeg;base64,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";
        colro = Colors.grey;
        break;
    }
    return Scaffold(
      backgroundColor: colro,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: 450,
                height: 500,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black)],
                  image: DecorationImage(
                    image: NetworkImage(image_weather),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),

                //  padding: const EdgeInsets.all(8),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${info.location?.name}',
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          "${info.current?.condition?.icon}",
                          scale: 0.5,
                        ),
                        Column(
                          children: [
                            Text(
                              '${info.current?.tempC}',
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateTime.parse('${info.location?.localtime}:00')
                                  .getTimeFrom,
                              //style: textStyle,
                            ),
                            Text(
                              '${info.current?.condition?.text}',
                              //   style: textStyle,
                            )
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Icon(
                                  //   Icons.map_outlined,
                                  //   size: 30,
                                  // ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("country"),
                                      Text("${info.location?.country}")
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Icon(
                                  //   Icons.map_outlined,
                                  //   size: 30,
                                  // ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("tempC"),
                                      Text("${info.current?.tempC}")
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Icon(
                                  //   Icons.map_outlined,
                                  //   size: 30,
                                  // ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("feelslikeC"),
                                      Text("${info.current?.feelslikeC}")
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                //  mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Icon(
                                  //   Icons.map_outlined,
                                  //   size: 30,
                                  // ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("country"),
                                      Text("${info.location?.country}")
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Row(
                                //  mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Icon(
                                  //   Icons.map_outlined,
                                  //   size: 30,
                                  // ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("tempC"),
                                      Text("${info.current?.tempC}")
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Icon(
                                  //   Icons.map_outlined,
                                  //   size: 30,
                                  // ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("feelslikeC"),
                                      Text("${info.current?.feelslikeC}")
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension WDateTimeToString on DateTime {
  String get getTimeFrom => DateFormat('kk:mm').format(this);
}
