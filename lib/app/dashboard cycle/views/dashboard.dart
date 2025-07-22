import 'package:flutter/material.dart';
import 'package:new_app/app/dashboard%20cycle/widget/numbers_card.dart';
import 'package:new_app/styles/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? username;
  void userData() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString("name");
    if (name != null) {
      setState(() {
        username = name;
      });
    }
  }

  @override
  void initState() {
    userData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // appbar container
          Container(
            padding: EdgeInsets.symmetric(vertical: 48, horizontal: 16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome, Back",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Hello, $username",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.notifications_active_outlined,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ],
              ),
            ),
          ),

          // column of dashboard data screen
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 16,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        spacing: 8,
                        children: [
                          Row(
                            spacing: 8,
                            children: [
                              Expanded(
                                child: NumbersCard(
                                  title: "Total Quotations",
                                  subTitle: "Received from clients",
                                  number: "50",
                                  numberColor: Theme.of(context).primaryColor,
                                ),
                              ),
                              Expanded(
                                child: NumbersCard(
                                  title: "Total Quotations",
                                  subTitle: "Ready for client review",
                                  number: "1",
                                  numberColor: numberColorGreen,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 8,
                            children: [
                              Expanded(
                                child: NumbersCard(
                                  title: "Pending Quotations ",
                                  subTitle: "Awaiting pricing",
                                  number: "11",
                                  numberColor: numberColorRed,
                                ),
                              ),
                              Expanded(
                                child: NumbersCard(
                                  title: "Orders",
                                  subTitle: "Converted from quotations",
                                  number: "12",
                                  numberColor: numberColorBlue,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: NumbersCard(
                                  title: "Quotation conersation rate",
                                  subTitle: "quotation to orders",
                                  number: "40.0%",
                                  numberColor: Theme.of(context).primaryColor,
                                  expanded: true,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 8,
                            children: [
                              Expanded(
                                child: NumbersCard(
                                  title: "Pending Quotations ",
                                  subTitle: "Awaiting pricing",
                                  number: "11",
                                  numberColor: numberColorRed,
                                  icon: Icon(
                                    Icons.attach_money_rounded,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: NumbersCard(
                                  title: "Orders",
                                  subTitle: "Converted from quotations",
                                  number: "12",
                                  numberColor: numberColorBlue,
                                  icon: Icon(
                                    Icons.attach_money_rounded,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(child: Column(children: [])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
