class WeatherModel {
  final Map coord;
  final List weather;
  final String base;
  final Map main;
  final int visibility;
  final Map wind;
  final Map clouds;
  final int? dt;
  final Map sys;
  final int timezone;
  final int id;
  final String name;
  final int? cod;

  WeatherModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherModel.fromJson({required Map data}) {
    return WeatherModel(
      coord: data['coord'],
      weather: data['weather'],
      base: data['base'],
      main: data['main'],
      visibility: data['visibility'],
      wind: data['wind'],
      clouds: data['clouds'],
      dt: data['dt'],
      sys: data['sys'],
      timezone: data['timezone'],
      id: data['id'],
      name: data['name'],
      cod: data['cod'],
    );
  }
}
