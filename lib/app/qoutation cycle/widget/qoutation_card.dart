import 'package:flutter/material.dart';
import 'package:new_app/styles/colors.dart';

class QoutationCard extends StatelessWidget {
  const QoutationCard({super.key});

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
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                spacing: 4,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("#123456"),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.amber,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Status",
                            style: Theme.of(
                              context,
                            ).textTheme.labelMedium!.copyWith(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date",
                        style: Theme.of(
                          context,
                        ).textTheme.labelMedium!.copyWith(fontSize: 10),
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
              onPressed: () {},
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
