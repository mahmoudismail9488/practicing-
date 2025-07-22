import 'package:flutter/material.dart';

class BrandsChips extends StatelessWidget {
  const BrandsChips({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12),
        ),
      ),
    );
  }
}
