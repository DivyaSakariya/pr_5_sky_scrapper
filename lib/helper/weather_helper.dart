import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherHelper {
  WeatherHelper._();

  static final WeatherHelper weatherHelper = WeatherHelper._();

  Future<WeatherModel?>getWeather({String cityName = 'Surat'}) async {
    String api =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=eb42031611601a1401c1e7423f7ce112";

    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      WeatherModel allData = WeatherModel.fromJson(data: data);
      return allData;
    }
    return null;
  }
}
