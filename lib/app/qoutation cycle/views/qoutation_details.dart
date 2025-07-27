import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/app/qoutation%20cycle/models/qoutation_model.dart';
import 'package:new_app/app/qoutation%20cycle/widget/item_card.dart';
import 'package:new_app/helpers/date_time_formatting.dart';

class QoutationDetails extends StatefulWidget {
  const QoutationDetails({super.key, required this.qoutation});
  final QoutationModel qoutation;

  @override
  State<QoutationDetails> createState() => _QoutationDetailsState();
}

class _QoutationDetailsState extends State<QoutationDetails> {
  QoutationModel? qoutationData;

  @override
  void initState() {
    qoutationData = widget.qoutation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Qoutation Details")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    spacing: 8,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Qoutation Id: ${qoutationData!.id}",
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "User",
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(fontSize: 14),
                                ),
                                Text(
                                  "Username",
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Mobile",
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(fontSize: 14),
                                ),
                                Text(
                                  "01020634063",
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "City",
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(fontSize: 14),
                                ),
                                Text(
                                  qoutationData!.city,
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Street",
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(fontSize: 14),
                                ),
                                Text(
                                  qoutationData!.street,
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Category",
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(fontSize: 14),
                                ),
                                Text(
                                  qoutationData!.category,
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Payment Method",
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(fontSize: 14),
                                ),
                                Text(
                                  qoutationData!.paymentMethod,
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date",
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(fontSize: 14),
                                ),
                                Text(
                                  covertToReadableDateandTime(
                                    qoutationData!.date,
                                  ),
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Shipping Cost",
                                  style: Theme.of(context).textTheme.titleSmall!
                                      .copyWith(fontSize: 14),
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(4),

                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    "${qoutationData!.shipping}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ExpansionTile(
                iconColor: Theme.of(context).primaryColor,

                shape: RoundedRectangleBorder(side: BorderSide.none),
                title: Text(
                  "Quotation items",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: qoutationData!.items
                    .map((ele) => ItemCard(item: ele))
                    .toList(),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          "Quotation summary",
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                fontFamily: GoogleFonts.roboto.toString(),
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Number of items",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            "${qoutationData!.items.length}",
                            style: Theme.of(context).textTheme.labelLarge!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shipping Cost",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            "${qoutationData!.shipping}",
                            style: Theme.of(context).textTheme.labelLarge!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sub-Total",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            "${qoutationData!.items.length * 1000 + qoutationData!.shipping}",
                            style: Theme.of(context).textTheme.labelLarge!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Discount",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Container(
                            width: 60,
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              textAlign: TextAlign.center,
                              "60",
                              style: Theme.of(context).textTheme.labelLarge!
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: Theme.of(
                              context,
                            ).textTheme.titleLarge!.copyWith(fontSize: 14),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "4320 SAR",
                            style: Theme.of(context).textTheme.labelMedium!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Save",
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(
                                color: Theme.of(
                                  context,
                                ).scaffoldBackgroundColor,
                                fontSize: 14,
                              ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "Submit",
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
