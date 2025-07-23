import 'package:flutter/material.dart';
import 'package:new_app/app/qoutation%20cycle/widget/qoutation_card.dart';

class Qoutation extends StatelessWidget {
  const Qoutation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [QoutationCard()]),
    );
  }
}
