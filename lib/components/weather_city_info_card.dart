import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_api/models/city_info.dart';

class WeatherCityInfoCard extends StatelessWidget {
  const WeatherCityInfoCard({super.key, required this.info});

  final CityInfo info;

  @override
  Widget build(BuildContext context) {
    final conditions = info.current?.condition?.text;
    String image = "";
    switch (conditions) {
      case 'Clear':
        {
          image =
              "https://images.pexels.com/photos/281260/pexels-photo-281260.jpeg?cs=srgb&dl=pexels-francesco-ungaro-281260.jpg&fm=jpg";
        }
        break;

      case 'Partly cloudy':
        {
          image =
              "https://img.freepik.com/free-photo/clouds-twilight-times_74190-1266.jpg?w=1380&t=st=1686424256~exp=1686424856~hmac=9589be9da9af3238346a277ba5a1d88a53e8abdd70a739237fac6c350975b7b6";
        }
        break;

      case 'Overcast':
        {
          image =
              "https://images.unsplash.com/photo-1525920980995-f8a382bf42c5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80";
        }
        break;

      case 'Cloudy':
        {
          image =
              "https://images.unsplash.com/photo-1612297728955-a0ad12a75df9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80";
        }
        break;

      case 'Rain':
        {
          image =
              "https://images.unsplash.com/photo-1603321544554-f416a9a11fcf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80";
        }
        break;

      case 'Snow':
        {
          image =
              "https://images.unsplash.com/photo-1583325958573-3c89e40551ad?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1471&q=80";
        }
        break;

      case 'Stormy':
        {
          image =
              "https://images.unsplash.com/photo-1600377927594-ceae8f8981a6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80";
        }
        break;

      case 'Tornadoes':
        {
          image =
              "https://images.unsplash.com/photo-1527482937786-6608f6e14c15?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80";
        }
        break;

      case 'Thunderstorms':
        {
          image =
              "https://images.unsplash.com/photo-1472145246862-b24cf25c4a36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1471&q=80";
        }
        break;

      case 'Fog':
        {
          image =
              "https://images.unsplash.com/photo-1491824989090-cc2d0b57eb0d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1718&q=80";
        }
        break;

      case 'Hurricanes':
        {
          image =
              "https://img.freepik.com/free-photo/dramatic-thunderstorm-rural-mountain-landscape-dusk-generated-by-ai_188544-10844.jpg?w=1380&t=st=1686425280~exp=1686425880~hmac=583dcc0824323678a637f6e03b07770dc68b805c2a897c062062a0b694568e3a";
        }
        break;

      case 'Sunny':
        {
          image =
              "https://images.unsplash.com/photo-1622278647429-71bc97e904e8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80";
        }
        break;
    }
    final textStyle = TextStyle(
        color: Colors.grey.shade700, fontWeight: FontWeight.w500, fontSize: 16);
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            // color: Colors.blue,
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          ),
          height: 120,
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${info.location?.name}',
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateTime.parse('${info.location?.localtime}:00')
                            .getTimeFrom,
                        style: textStyle,
                      ),
                    ],
                  ),
                  Text(
                    '${info.current?.condition?.text}',
                    style: textStyle,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${info.current?.tempC}°',
                    style: const TextStyle(fontSize: 40),
                  ),
                  Text(
                    'Feels like: ${info.current?.feelslikeC}',
                    style: textStyle.copyWith(color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}

extension WDateTimeToString on DateTime {
  String get getTimeFrom => DateFormat('kk:mm').format(this);
}


