import 'package:flutter/material.dart';
import 'package:pr_5_sky_scrapper/provider/home_provider.dart';
import 'package:pr_5_sky_scrapper/provider/theme_provider.dart';
import 'package:pr_5_sky_scrapper/views/screens/home_page.dart';
import 'package:provider/provider.dart';

import 'helper/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: Provider.of<ThemeProvider>(context).isDark
          ? ThemeMode.dark
          : ThemeMode.light,
      home: const HomePage(),
    );
  }
}
