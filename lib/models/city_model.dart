class CityModel {
  CityModel({
    required this.location,
    required this.current,
  });
  late final Location location;
  late final Current current;
  
  CityModel.fromJson(Map<String, dynamic> json){
    location = Location.fromJson(json['location']);
    current = Current.fromJson(json['current']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['location'] = location.toJson();
    data['current'] = current.toJson();
    return data;
  }

  updateWeather() {}
}

class Location {
  Location({
    required this.region,
    required this.localtime,
  });
  late final String region;
  late final String localtime;
  
  Location.fromJson(Map<String, dynamic> json){
    region = json['region'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['region'] = region;
    data['localtime'] = localtime;
    return data;
  }
}

class Current {
  Current({
    required this.tempC,
    required this.windKph,
    required this.humidity,
    required this.feelslikeC,
  });
  late final double tempC;
  late final double windKph;
  late final int humidity;
  late final double feelslikeC;
  
  Current.fromJson(Map<String, dynamic> json){
    tempC = json['temp_c'];
    windKph = json['wind_kph'];
    humidity = json['humidity'];
    feelslikeC = json['feelslike_c'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['temp_c'] = tempC;
    data['wind_kph'] = windKph;
    data['humidity'] = humidity;
    data['feelslike_c'] = feelslikeC;
    return data;
  }
}