import 'package:flutter/material.dart';
import 'package:new_app/styles/colors.dart';

class NumbersCard extends StatelessWidget {
  const NumbersCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.number,
    required this.numberColor,
    this.expanded,
    this.icon,
  });
  final String title;
  final String subTitle;
  final String number;
  final Color numberColor;
  final Icon? icon;
  final bool? expanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(
              255,
              138,
              138,
              138,
            ).withValues(alpha: 0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(color: smallTitleColor, width: 0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        if (icon != null)
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xff209F84).withAlpha(100),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            width: 24,
                            height: 24,
                            child: icon!,
                          ),
                      ],
                    ),
                    Text(
                      subTitle,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 10),
                    ),
                  ],
                ),
                if (expanded == true)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      number,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: numberColor,
                      ),
                    ),
                  ),
              ],
            ),
            if (expanded == null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  number,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: numberColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
