import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.nextFunction});
  final Function nextFunction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style,
      onPressed: () {
        nextFunction();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
        child: Text(
          "Next",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
