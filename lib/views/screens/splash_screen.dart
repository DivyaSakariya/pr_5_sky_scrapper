import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularProgressIndicator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Weather App",
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
              SizedBox(width: 20),
              SizedBox(
                height: 85,
                width: 65,
                child: Image(
                  image: AssetImage("assets/gif/rain_sun.gif"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
