import 'package:flutter/material.dart';
import 'package:new_app/app/auth%20cycle/widget/auth_appbar.dart';
import 'package:new_app/styles/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthAppbar(
            title: "Create Account",
            subTitle: "Get Started with Rawmart",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                spacing: 8,
                children: [
                  Text("Name", style: Theme.of(context).textTheme.labelMedium),
                  TextFormField(
                    maxLines: 1,
                    textCapitalization: TextCapitalization.words,
                    enableSuggestions: false,
                    cursorWidth: 2,
                    cursorColor: Theme.of(context).primaryColor,
                    controller: nameController,
                    decoration: InputDecoration(
                      hint: Text("Enter Your Name"),
                      icon: Icon(Icons.person_outlined),
                      iconColor: lightLabelTextColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
