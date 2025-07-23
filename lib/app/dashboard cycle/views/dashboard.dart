import 'package:flutter/material.dart';
import 'package:new_app/app/dashboard%20cycle/models/chart_data.dart';
import 'package:new_app/app/dashboard%20cycle/widget/numbers_card.dart';
import 'package:new_app/app/dashboard%20cycle/widget/rawmart_pie_chart.dart';
import 'package:new_app/app/orders%20cycle/views/orders.dart';
import 'package:new_app/app/qoutation%20cycle/views/qoutation.dart';
import 'package:new_app/helpers/navigation_provider.dart';
import 'package:new_app/styles/colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? username = "Vendor";
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
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
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
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  spacing: 8,
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
                                    action: () {
                                      context
                                          .read<NavigationProvider>()
                                          .updateNav("Qoutation", Qoutation());
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: NumbersCard(
                                    title: "Priced Quotations",
                                    subTitle: "Ready for client review",
                                    number: "1",
                                    numberColor: numberColorGreen,
                                    action: () {
                                      context
                                          .read<NavigationProvider>()
                                          .updateNav("Qoutation", Qoutation());
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              spacing: 8,
                              children: [
                                Expanded(
                                  child: NumbersCard(
                                    title: "Pending Quotations",
                                    subTitle: "Awaiting pricing",
                                    number: "11",
                                    numberColor: numberColorRed,
                                    action: () {
                                      context
                                          .read<NavigationProvider>()
                                          .updateNav("Qoutation", Qoutation());
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: NumbersCard(
                                    title: "Orders",
                                    subTitle: "Converted from quotations",
                                    number: "12",
                                    numberColor: numberColorBlue,
                                    action: () {
                                      context
                                          .read<NavigationProvider>()
                                          .updateNav("Orders", Orders());
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: NumbersCard(
                                    title: "Quotation convertion rate",
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
                                    title: "Total revenue",
                                    subTitle: "overall earnings",
                                    number: "\$ 75000",
                                    numberColor: Theme.of(context).primaryColor,
                                    icon: Icon(
                                      Icons.attach_money_rounded,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: NumbersCard(
                                    title: "average order value",
                                    subTitle: "per order",
                                    number: "\$ 1250",
                                    numberColor: Theme.of(context).primaryColor,
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
                    Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              spacing: 8,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Order Status Distribution",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 150,
                                      child: RawmartPieChart(),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: 8,
                                      children: dashboardData
                                          .map(
                                            (ele) => Container(
                                              width: 150,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "${ele.title} (${ele.percent}%)",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium!
                                                            .copyWith(
                                                              fontSize: 12,
                                                            ),
                                                      ),
                                                      Text(ele.number),
                                                    ],
                                                  ),
                                                  LinearProgressIndicator(
                                                    value: ele.percent / 100,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          5.87,
                                                        ),
                                                    minHeight: 6,
                                                    color: ele.color,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
