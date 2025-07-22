import 'package:flutter/material.dart';
import 'package:new_app/app/dashboard%20cycle/views/dashboard.dart';
import 'package:new_app/widgets/navigation_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String title = "Dashboard";
  Widget currentPage = Dashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      ),
      body: currentPage,
      bottomNavigationBar: CustomNavigationBar(
        title: title,
        page: currentPage,
        currentPage: (newTitle, newPage) {
          setState(() {
            title = newTitle;
            currentPage = newPage;
          });
        },
      ),
    );
  }
}
