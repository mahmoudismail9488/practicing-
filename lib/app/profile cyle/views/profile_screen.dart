import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:new_app/app/auth%20cycle/views/sign_in_screen.dart';
import 'package:new_app/app/profile%20cyle/widget/update_password.dart';
import 'package:new_app/widgets/next_button.dart';
import 'package:new_app/styles/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

final ImagePicker picker = ImagePicker();

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  File? personImage;
  bool readOnlyState = true;

  void userData() async {
    final prefs = await SharedPreferences.getInstance();
    final savedImage = prefs.getString("image");
    if (savedImage != null) {
      setState(() {
        personImage = File(savedImage);
      });
    }
    final name = prefs.getString("name");
    if (name != null) {
      setState(() {
        nameController.text = name;
      });
    }
    final phone = prefs.getString("phone");
    if (phone != null) {
      setState(() {
        phoneController.text = phone;
      });
    }
  }

  @override
  void initState() {
    userData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  if (personImage == null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/imgs/person.png",
                        width: 60,
                        height: 60,
                      ),
                    ),
                  if (personImage != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage: FileImage(personImage!),
                          radius: 60,
                        ),
                      ),
                    ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: lightLabelTextColor,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          final res = await picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          final prefs = await SharedPreferences.getInstance();
                          if (res != null) {
                            setState(() {
                              personImage = File(res.path);
                            });
                            prefs.setString("image", res.path);
                          }
                        },
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          color: Theme.of(context).primaryColor,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                nameController.text,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                // name text field
                Text("Name", style: Theme.of(context).textTheme.labelMedium),
                TextFormField(
                  validator: (value) {
                    if (value != null && value.isNotEmpty && value.length > 5) {
                      return null;
                    }
                    return "You Must Enter your Name with more than 5 chars";
                  },
                  maxLines: 1,
                  textCapitalization: TextCapitalization.words,
                  enableSuggestions: false,
                  keyboardType: TextInputType.text,
                  cursorWidth: 2,
                  autofocus: true,
                  readOnly: readOnlyState,
                  cursorColor: Theme.of(context).primaryColor,
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  style: Theme.of(context).textTheme.labelMedium,
                  decoration: InputDecoration()
                      .applyDefaults(Theme.of(context).inputDecorationTheme)
                      .copyWith(
                        hint: Text("Enter Your Name"),
                        prefixIcon: Icon(
                          Icons.person_outlined,
                          color: lightFormLabelColor,
                        ),
                        suffixIcon: readOnlyState
                            ? IconButton(
                                icon: Icon(Icons.edit_outlined),
                                onPressed: () {
                                  setState(() {
                                    readOnlyState = false;
                                  });
                                },
                              )
                            : null,
                      ),
                ),

                // phone number field
                Text(
                  "Phone Number",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                IgnorePointer(
                  child: TextFormField(
                    readOnly: true,
                    maxLines: 1,
                    textCapitalization: TextCapitalization.none,
                    enableSuggestions: false,
                    keyboardType: TextInputType.phone,
                    cursorWidth: 2,
                    cursorColor: Theme.of(context).primaryColor,
                    controller: phoneController,
                    textInputAction: TextInputAction.next,
                    style: Theme.of(context).textTheme.labelMedium,
                    decoration: InputDecoration()
                        .applyDefaults(Theme.of(context).inputDecorationTheme)
                        .copyWith(
                          hint: Text("+02  0xx xxx xxxx"),
                          prefixIcon: Icon(
                            Icons.call_outlined,
                            color: lightFormLabelColor,
                          ),
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 4,
                  children: [
                    Icon(Icons.lock_outline, color: lightFormLabelColor),
                    Text(
                      "Password Update",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: UpdatePassword(),
                          backgroundColor: Theme.of(
                            context,
                          ).scaffoldBackgroundColor,
                        );
                      },
                    );
                  },
                  color: lightFormLabelColor,
                ),
              ],
            ),
          ),

          if (!readOnlyState)
            Container(
              width: double.infinity,
              child: NextButton(
                nextFunction: () async {
                  final prefs = await SharedPreferences.getInstance();
                  setState(() {
                    readOnlyState = true;
                    prefs.setString("name", nameController.text);
                  });
                },
                text: "Save Changes",
              ),
            ),
          Container(
            padding: EdgeInsets.only(top: 48),
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1, color: Colors.red),

                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.remove("signed");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => SignInScreen()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout_outlined, color: Colors.red),
                  Text(
                    "Logout",
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(color: Colors.red),
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
