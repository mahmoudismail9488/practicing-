import 'package:flutter/material.dart';
import 'package:new_app/helpers/navigation_provider.dart';
import 'package:new_app/widgets/navigation_bar.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: context.watch<NavigationProvider>().title == "Dashboard"
          ? null
          : AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                context.watch<NavigationProvider>().title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
      body: context.watch<NavigationProvider>().screen,
      bottomNavigationBar: CustomNavigationBar(
        title: context.watch<NavigationProvider>().title,
        page: context.watch<NavigationProvider>().screen,
        currentPage: (newTitle, newPage) {
          setState(() {
            context.read<NavigationProvider>().updateNav(newTitle, newPage);
          });
        },
      ),
    );
  }
}
