import 'package:flutter/material.dart';
import '../helper/weather_helper.dart';

class HomeProvider extends ChangeNotifier {

  List cityData = [];

  String cityName = "Surat";

  HomeProvider() {
    searchCity();
    notifyListeners();
  }

  searchCity() async {
    cityData = await WeatherHelper.weatherHelper.getWeather(cityName: cityName) as List;
    notifyListeners();
  }

  notify() {
    notifyListeners();
  }
}
