import 'package:flutter/material.dart';

class NavigationItem extends StatefulWidget {
  const NavigationItem({
    super.key,
    required this.icon,
    required this.title,
    required this.action,
    required this.selected,
  });
  final IconData icon;
  final String title;
  final Function action;
  final bool selected;
  @override
  State<NavigationItem> createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.action();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(130),
          borderRadius: BorderRadius.circular(widget.selected ? 23 : 30),
        ),
        padding: EdgeInsets.all(8),
        child: Row(
          spacing: 4,
          children: [
            Icon(widget.icon, color: Theme.of(context).scaffoldBackgroundColor),
            if (widget.selected)
              Text(
                widget.title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
