import 'package:flutter/material.dart';
import 'package:new_app/styles/theme_manager.dart';
import 'package:new_app/app/auth%20cycle/views/splash_screen.dart';
import 'package:new_app/widgets/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Important to initialize bindings
  final prefs = await SharedPreferences.getInstance();
  final signed = prefs.getBool("signed");
  runApp(
    MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: signed != null ? MainPage() : SplashScreen(),
    ),
  );
}
