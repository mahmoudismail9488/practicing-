import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/app/qoutation%20cycle/models/items_model.dart';

class EditCard extends StatefulWidget {
  const EditCard({super.key, required this.item});
  final ItemsModel item;

  @override
  State<EditCard> createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            "Edit Item",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontFamily: GoogleFonts.roboto.toString(),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Row(
          spacing: 48,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.copyWith(fontSize: 14),
                  ),
                  Text(
                    widget.item.name,
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall!.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Quantity",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(fontSize: 14),
                ),
                Text(
                  "${widget.item.quantity}",
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        Row(
          spacing: 8,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Brand Name",
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.copyWith(fontSize: 14),
                  ),
                  Text(
                    widget.item.brandName,
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall!.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Size",
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.copyWith(fontSize: 14),
                  ),
                  Text(
                    widget.item.size,
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall!.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Unit",
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.copyWith(fontSize: 14),
                  ),
                  Text(
                    "",
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall!.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text("Description", style: Theme.of(context).textTheme.labelMedium),
        TextField(),
        Text("Selling Price", style: Theme.of(context).textTheme.labelMedium),
        TextField(controller: priceController),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 4,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "cancel",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
