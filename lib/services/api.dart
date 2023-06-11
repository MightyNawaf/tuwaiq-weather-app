import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_api/models/city_info.dart';
import 'package:weather_api/models/city_location.dart';

class ApiService {
  static const String key = 'f14a44dd41ae4002bbd141822230706';
  static const String apiCurrent = 'current.json';
  static const String apiSearch = 'search.json';
  Future<CityInfo> getCityInfo(double? lat, double? lon) async {
    String apiBaseUrl = 'https://api.weatherapi.com/v1/$apiCurrent?key=$key&q=';

    final uri = Uri.parse('$apiBaseUrl$lat,$lon');
    final request = await http.get(uri);
    final jsonBody = jsonDecode(request.body);
    final cityInfo = CityInfo.fromJson(jsonBody);
    return cityInfo;
  }

  Future<List<CityLocation>> getCities(String cityName) async {
    String apiBaseUrl = 'https://api.weatherapi.com/v1/$apiSearch?key=$key&q=';

    final uri = Uri.parse(apiBaseUrl + cityName);
    final request = await http.get(uri);
    final jsonBody = jsonDecode(request.body);
    List<CityLocation> cities = [];

    for (var city in jsonBody) {
      cities.add(CityLocation.fromJson(city));
    }
    return cities;
  }
}
