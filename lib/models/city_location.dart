class CityLocation {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;

  CityLocation({this.name, this.region, this.country, this.lat, this.lon});

  CityLocation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['region'] = region;
    data['country'] = country;
    data['lat'] = lat;
    data['lon'] = lon;
    return data;
  }
}
