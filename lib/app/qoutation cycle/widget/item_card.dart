import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/app/qoutation%20cycle/models/items_model.dart';
import 'package:new_app/app/qoutation%20cycle/widget/edit_card.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({super.key, required this.item});
  final ItemsModel item;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  ItemsModel? itemData;
  @override
  void initState() {
    itemData = widget.item;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  itemData!.name,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Brand Name: ${itemData!.brandName}",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontFamily: GoogleFonts.poppins.toString(),
                  ),
                ),
                Text(
                  "Quantity: ${itemData!.quantity}",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontFamily: GoogleFonts.poppins.toString(),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        backgroundColor: Theme.of(
                          context,
                        ).scaffoldBackgroundColor,
                        content: EditCard(item: itemData!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8),
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.edit_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  "${itemData!.price.toString()} EGP",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
