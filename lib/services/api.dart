import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_api/models/city_model.dart';

class ApiService {
  static const String apiBaseUrl =
      'https://api.weatherapi.com/v1/current.json?key=bfbec9f69f8e4d15a81164944230706&q=';
  Future<CityModel> getCityInfo(String cityName) async {
    final uri = Uri.parse(apiBaseUrl + cityName);
    final request = await http.get(uri);
    final jsonBody = jsonDecode(request.body);
    final cityInfo = CityModel.fromJson(jsonBody);
    return cityInfo;
  }
}
