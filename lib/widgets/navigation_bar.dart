import 'package:flutter/material.dart';
import 'package:new_app/app/dashboard%20cycle/views/dashboard.dart';
import 'package:new_app/app/orders%20cycle/views/orders.dart';
import 'package:new_app/app/profile%20cyle/views/profile_screen.dart';
import 'package:new_app/app/qoutation%20cycle/views/qoutation.dart';
import 'package:new_app/widgets/navigation_item.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    super.key,
    required this.title,
    required this.page,
    required this.currentPage,
  });
  final String title;
  final Widget page;
  final void Function(String pageName, Widget pageWidget) currentPage;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  String selectedNav = "Dashboard";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).primaryColor,
        ),
        padding: EdgeInsets.all(8),
        child: Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // dashboard item
            NavigationItem(
              icon: Icons.analytics_rounded,
              title: "Dashboard",
              selected: selectedNav == "Dashboard",
              action: () {
                setState(() {
                  selectedNav = "Dashboard";
                });
                widget.currentPage("Dashboard", Dashboard());
              },
            ),
            // qoutation item
            NavigationItem(
              icon: Icons.receipt,
              title: "Qoutation",
              selected: selectedNav == "Qoutation",
              action: () {
                setState(() {
                  selectedNav = "Qoutation";
                });
                widget.currentPage("Qoutation", Qoutation());
              },
            ),
            // orders Item
            NavigationItem(
              icon: Icons.shopping_cart,
              title: "Orders",
              selected: selectedNav == "Orders",
              action: () {
                setState(() {
                  selectedNav = "Orders";
                });
                widget.currentPage("Orders", Orders());
              },
            ),

            // profile item
            NavigationItem(
              icon: Icons.person,
              title: "Profile",
              selected: selectedNav == "Profile",
              action: () {
                setState(() {
                  selectedNav = "Profile";
                });
                widget.currentPage("Profile", ProfileScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
