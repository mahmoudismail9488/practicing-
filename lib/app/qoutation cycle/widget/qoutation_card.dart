import 'package:flutter/material.dart';
import 'package:new_app/app/qoutation%20cycle/models/qoutation_model.dart';
import 'package:new_app/app/qoutation%20cycle/views/qoutation_details.dart';
import 'package:new_app/helpers/date_time_formatting.dart';
import 'package:new_app/styles/colors.dart';

class QoutationCard extends StatelessWidget {
  const QoutationCard({super.key, required this.qoutation});
  final QoutationModel qoutation;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Color(0xffCBD2D6)),
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        qoutation.id,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: statusColors[qoutation.status]!.withAlpha(70),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.0,
                            horizontal: 8,
                          ),
                          child: Text(
                            qoutation.status,
                            style: Theme.of(context).textTheme.labelMedium!
                                .copyWith(
                                  fontSize: 12,
                                  color: statusColors[qoutation.status],
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Category",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            qoutation.category,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "City",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            qoutation.city,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Container(
                            constraints: BoxConstraints(maxWidth: 150),
                            child: Text(
                              covertToReadableDateandTime(qoutation.date),
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => QoutationDetails(qoutation: qoutation),
                  ),
                );
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(4),
                ),
                backgroundColor: Color(0xffF4F6F7),
              ),
              child: Text(
                "Click to price",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 12,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
