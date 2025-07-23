import 'package:flutter/widgets.dart';
import 'package:new_app/app/dashboard%20cycle/views/dashboard.dart';

class NavigationProvider extends ChangeNotifier {
  NavigationProvider({
    this.title = "Dashboard",
    this.screen = const Dashboard(),
  });
  String title;
  Widget screen;

  void updateNav(String newTitle, Widget newScreen) async {
    title = newTitle;
    screen = newScreen;
    notifyListeners();
  }
}
