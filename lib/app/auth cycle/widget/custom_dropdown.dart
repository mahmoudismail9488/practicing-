import 'package:flutter/material.dart';
import 'package:new_app/app/auth%20cycle/models/vendor_categories.dart';
import 'package:new_app/styles/colors.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.hint,
    required this.choices,
    required this.multiSelect,
    required this.callBack,
  });
  final String hint;
  final List choices;
  final bool multiSelect;
  final void Function(List<VendorBrands> selected) callBack;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  List<VendorBrands> selected = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.hint),
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: lightLabelTextColor,
              ),
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        backgroundColor: Theme.of(
                          context,
                        ).scaffoldBackgroundColor,
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              widget.callBack(selected);
                              Navigator.of(context).pop();
                            },
                            child: Text("Done"),
                          ),
                        ],
                        title: Text(
                          "Choose Your categories",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        content: StatefulBuilder(
                          builder: (context, setDialogState) {
                            return Container(
                              constraints: BoxConstraints(maxHeight: 180),
                              width: double.infinity,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: widget.choices.map((ele) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          selected.contains(ele)
                                              ? selected.remove(ele)
                                              : selected.add(ele);
                                        });
                                        setDialogState(
                                          () {},
                                        ); // Rebuild dialog content
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              ele.title,
                                              style: TextStyle(
                                                color: Theme.of(
                                                  context,
                                                ).primaryColor,
                                              ),
                                            ),
                                          ),
                                          Checkbox(
                                            activeColor: Theme.of(
                                              context,
                                            ).primaryColor,
                                            checkColor: Theme.of(
                                              context,
                                            ).scaffoldBackgroundColor,
                                            key: ValueKey(ele.id),
                                            value: selected.contains(ele),
                                            onChanged: (value) {
                                              setState(() {
                                                selected.contains(ele)
                                                    ? selected.remove(ele)
                                                    : selected.add(ele);
                                              });
                                              setDialogState(() {});
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                child: Icon(Icons.arrow_forward_ios_rounded, size: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
