import 'package:flutter/material.dart';
import 'package:new_app/styles/colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hint,
    required this.type,
    required this.capitalization,
    this.password,
    required this.validateTextField,
  });

  final TextEditingController controller;
  final Icon icon;
  final String hint;
  final bool? password;
  final TextCapitalization capitalization;
  final TextInputType type;
  final Function validateTextField;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obsecureState = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: lightLabelTextColor, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: TextFormField(
          validator: (value) {
            final result = widget.validateTextField(value!);
            if (result != null) {
              return result;
            }
            return null;
          },
          obscureText: widget.password != null ? obsecureState : false,
          maxLines: 1,
          textCapitalization: widget.capitalization,
          enableSuggestions: false,
          keyboardType: widget.type,
          cursorWidth: 2,
          cursorColor: Theme.of(context).primaryColor,
          controller: widget.controller,
          decoration: InputDecoration(
            suffixIcon: widget.password != null
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obsecureState = !obsecureState;
                      });
                    },
                    icon: Icon(
                      obsecureState
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                    ),
                  )
                : null,
            border: InputBorder.none,
            hint: Text(widget.hint),
            icon: widget.icon,
            iconColor: lightLabelTextColor,
          ),
        ),
      ),
    );
  }
}
