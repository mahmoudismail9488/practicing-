import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({
    super.key,
    required this.text,
    required this.image,
    this.callBack,
  });
  final String text;
  final Image image;
  final Function? callBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          if (callBack != null)
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  callBack!();
                },
                child: Text("Done"),
              ),
            ),
        ],
      ),
    );
  }
}
