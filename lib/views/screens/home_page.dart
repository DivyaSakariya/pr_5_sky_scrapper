import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helper/weather_helper.dart';
import '../../models/weather_model.dart';
import '../../provider/home_provider.dart';
import '../../provider/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    dynamic themePro = Provider.of<ThemeProvider>(context);

    List days = [
      '',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    List months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'June',
      'July',
      'Aug',
      'Sup',
      'Oct',
      'Nov',
      'Dec',
    ];

    TextEditingController textController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.orange,
      body: SingleChildScrollView(
        child: Consumer<HomeProvider>(builder: (context, provider, _) {
          return FutureBuilder(
            future: WeatherHelper.weatherHelper
                .getWeather(cityName: provider.cityName),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                WeatherModel? weatherModel = snapShot.data;
                return Stack(
                  children: [
                    SizedBox(
                      height: h,
                      width: w,
                      child: Image.asset(
                        themePro.isDark
                            ? 'assets/gif/night.gif'
                            : 'assets/gif/day.gif',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 45, right: 8, left: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Weather",
                                    style: TextStyle(fontSize: 28),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      themePro.isDark = !themePro.isDark;
                                    },
                                    icon: themePro.isDark
                                        ? const Icon(
                                            Icons.light_mode,
                                            size: 34,
                                          )
                                        : const Icon(
                                            Icons.dark_mode_rounded,
                                            size: 34,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            TextField(
                              controller: textController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                hintText: "Enter City",
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    provider.cityName = textController.text;
                                    provider.notify();
                                  },
                                  icon: const Icon(Icons.search),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: h * 0.04,
                            ),
                            Text(
                              weatherModel!.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ),
                            ),
                            SizedBox(
                              height: h * 0.001,
                            ),
                            Text(
                              weatherModel.weather[0]['main'],
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: h * 0.01),
                            Text(
                              "${weatherModel.main['temp'].toInt() - 273}°C",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 95,
                              ),
                            ),
                            SizedBox(height: h * 0.001),
                            Text(
                              "${days[DateTime.now().weekday]},${DateTime.now().day} ${months[DateTime.now().month]}",
                              style: const TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/img/wind.png',
                                          width: 52,
                                        ),
                                        SizedBox(height: h * 0.01),
                                        Text(
                                          "${weatherModel.wind['speed'].toStringAsFixed(1)} km/h",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: h * 0.01),
                                        const Text(
                                          "Wind",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const Icon(
                                          Icons.water_drop,
                                          size: 28,
                                        ),
                                        SizedBox(height: h * 0.01),
                                        Text(
                                          "${weatherModel.main['humidity']}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: h * 0.02),
                                        const Text(
                                          "Humidity",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/gif/weather_sky.gif',
                                          width: 32,
                                        ),
                                        SizedBox(height: h * 0.01),
                                        Text(
                                          "${weatherModel.main['pressure'].toStringAsFixed(1)} km/h",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: h * 0.01),
                                        const Text(
                                          "Pressure",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: h * 0.02),
                            Text(
                              "Visibility : ${weatherModel.visibility}m",
                              style: const TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(height: h * 0.02),
                            const Divider(),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "${weatherModel.coord['lon']}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: h * 0.01),
                                      const Text(
                                        "Longitude",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: h * 0.01),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "${weatherModel.coord['lat']}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: h * 0.01),
                                      const Text(
                                        "Latitude",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: h * 0.01),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else if (snapShot.hasError) {
                return Text(" Error :- ${snapShot.hasError}");
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        }),
      ),
    );
  }
}
