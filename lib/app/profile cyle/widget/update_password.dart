import 'package:flutter/material.dart';
import 'package:new_app/styles/colors.dart';
import 'package:new_app/widgets/message.dart';
import 'package:new_app/widgets/next_button.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final formKey = GlobalKey<FormState>();
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool oldObsecureState = true;
  bool newObsecureState = true;
  bool confirmObsecureState = true;

  void updatePass() {
    final formState = formKey.currentState!.validate();

    if (formState) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Message(
            text: "The password has been changed successfully",
            image: Image.asset("assets/imgs/suc.png"),
            callBack: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          // old password
          Text("Old Password", style: Theme.of(context).textTheme.labelMedium),
          TextFormField(
            cursorColor: Theme.of(context).primaryColor,
            controller: oldPassController,
            style: Theme.of(context).textTheme.labelMedium,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration()
                .applyDefaults(Theme.of(context).inputDecorationTheme)
                .copyWith(
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: lightFormLabelColor,
                  ),
                  hint: Text("Enter your password"),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        oldObsecureState = !oldObsecureState;
                      });
                    },
                    icon: Icon(
                      oldObsecureState
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                      color: smallTitleColor,
                    ),
                  ),
                ),
            keyboardType: TextInputType.none,
            textCapitalization: TextCapitalization.none,
            validator: (value) {
              if (value != null && value.isNotEmpty && value.length > 8) {
                return null;
              }
              return "You Must Enter your Password with more than 8 chars";
            },
            obscureText: oldObsecureState,
          ),
          // new password
          Text("New Password", style: Theme.of(context).textTheme.labelMedium),
          TextFormField(
            cursorColor: Theme.of(context).primaryColor,
            controller: newPassController,
            style: Theme.of(context).textTheme.labelMedium,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration()
                .applyDefaults(Theme.of(context).inputDecorationTheme)
                .copyWith(
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: lightFormLabelColor,
                  ),
                  hint: Text("Enter New password"),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        newObsecureState = !newObsecureState;
                      });
                    },
                    icon: Icon(
                      newObsecureState
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                      color: smallTitleColor,
                    ),
                  ),
                ),
            keyboardType: TextInputType.none,
            textCapitalization: TextCapitalization.none,
            validator: (value) {
              if (value != null && value.isNotEmpty && value.length > 8) {
                return null;
              }
              return "You Must Enter your Password with more than 8 chars";
            },
            obscureText: newObsecureState,
          ),
          // confirm password
          Text(
            "Confirm Password",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          TextFormField(
            cursorColor: Theme.of(context).primaryColor,
            controller: confirmPassController,
            style: Theme.of(context).textTheme.labelMedium,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration()
                .applyDefaults(Theme.of(context).inputDecorationTheme)
                .copyWith(
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: lightFormLabelColor,
                  ),
                  hint: Text("Confirm password"),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        confirmObsecureState = !confirmObsecureState;
                      });
                    },
                    icon: Icon(
                      confirmObsecureState
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                      color: smallTitleColor,
                    ),
                  ),
                ),
            keyboardType: TextInputType.none,
            textCapitalization: TextCapitalization.none,
            validator: (value) {
              if (value == newPassController.text) {
                return null;
              }
              return "You Must Enter your Password with more than 8 chars";
            },
            obscureText: confirmObsecureState,
          ),

          Container(
            padding: EdgeInsets.only(top: 24),
            width: double.infinity,
            child: NextButton(
              nextFunction: () {
                updatePass();
              },
              text: "Update Password",
            ),
          ),
        ],
      ),
    );
  }
}
