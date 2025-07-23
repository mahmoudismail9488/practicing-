import 'package:flutter/material.dart';
import 'package:new_app/app/qoutation%20cycle/models/qoutation_model.dart';
import 'package:new_app/app/qoutation%20cycle/widget/qoutation_card.dart';

class Qoutation extends StatefulWidget {
  const Qoutation({super.key});

  @override
  State<Qoutation> createState() => _QoutationState();
}

class _QoutationState extends State<Qoutation> {
  String qoutationFiltersState = "All";
  TextEditingController searchController = TextEditingController();
  List<QoutationModel>? listOfQoutaions;
  void filterQoutes() {
    setState(() {
      if (qoutationFiltersState != "All") {
        listOfQoutaions = qoutations.where((ele) {
          return ele.status == qoutationFiltersState;
        }).toList();
      } else {
        listOfQoutaions = qoutations;
      }
      if (searchController.text.isNotEmpty) {
        print(searchController.text);
        listOfQoutaions = listOfQoutaions!.where((ele) {
          return ele.id.contains(searchController.text) ||
              ele.category.toLowerCase().contains(
                searchController.text.toLowerCase(),
              ) ||
              ele.city.toLowerCase().contains(
                searchController.text.toLowerCase(),
              );
        }).toList();
      }
    });
  }

  @override
  void initState() {
    filterQoutes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filterQoutes();
              },
              decoration: InputDecoration()
                  .applyDefaults(Theme.of(context).inputDecorationTheme)
                  .copyWith(
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    hint: Text("Search by id, category, city"),
                  ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Card(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 16,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          qoutationFiltersState = "All";
                        });
                        filterQoutes();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: qoutationFiltersState == "All"
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).scaffoldBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(24),
                        ),
                      ),
                      child: Text(
                        "All",
                        style: TextStyle(
                          color: qoutationFiltersState != "All"
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          qoutationFiltersState = "Priced";
                        });
                        filterQoutes();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: qoutationFiltersState == "Priced"
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).scaffoldBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(24),
                        ),
                      ),
                      child: Text(
                        "Priced",
                        style: TextStyle(
                          color: qoutationFiltersState != "Priced"
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          qoutationFiltersState = "Ordered";
                        });
                        filterQoutes();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: qoutationFiltersState == "Ordered"
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).scaffoldBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(24),
                        ),
                      ),
                      child: Text(
                        "Ordered",
                        style: TextStyle(
                          color: qoutationFiltersState != "Ordered"
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          qoutationFiltersState = "Expired";
                        });
                        filterQoutes();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: qoutationFiltersState == "Expired"
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).scaffoldBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(24),
                        ),
                      ),
                      child: Text(
                        "Expired",
                        style: TextStyle(
                          color: qoutationFiltersState != "Expired"
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: listOfQoutaions!.map((ele) {
                  return QoutationCard(
                    id: ele.id,
                    username: ele.username,
                    city: ele.city,
                    category: ele.category,
                    date: ele.date,
                    status: ele.status,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
