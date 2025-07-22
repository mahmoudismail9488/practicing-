import 'package:flutter/material.dart';
import 'package:new_app/styles/theme_manager.dart';
import 'package:new_app/app/auth%20cycle/views/splash_screen.dart';
import 'package:new_app/widgets/main_page.dart';

bool signed = true;
void main() {
  runApp(
    MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: signed ? MainPage() : SplashScreen(),
    ),
  );
}
