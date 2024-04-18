//textWidgets
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app_codsoft_task3/Services/firebase_auth_service.dart';

Text showBigText({required String text, Color? color}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: 20,
        color: color ?? Colors.orange.shade700,
        fontWeight: FontWeight.bold),
  );
}

// medium text
Text showmediumText({required String text, Color? color}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: 15,
        color: color ?? Colors.black,
        fontWeight: FontWeight.normal),
  );
}

// spaces and heights

SizedBox showBigSpace() {
  return const SizedBox(
    height: 25,
  );
}

SizedBox showmediumSpace() {
  return const SizedBox(
    height: 20,
  );
}

SizedBox showmedium2Space() {
  return const SizedBox(
    height: 15,
  );
}

SizedBox showSmallSpace() {
  return const SizedBox(
    height: 10,
  );
}

SizedBox showSmallSpace2() {
  return const SizedBox(
    height: 8,
  );
}

// TextForm Fileds
showTextFormFieldContainer({
  required BuildContext context,
  required TextEditingController controller,
  required TextInputType textInputType,
  required String hintText,
  required IconData prefixIcon,
  required String? Function(String?) validator,
  IconData? suffixIcon,
  bool? obsecureText,
}) {
  return TextFormField(
    keyboardType: textInputType,
    controller: controller,
    validator: validator,
    obscureText: obsecureText ?? false,
    decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10))),
  );
}

// container for button

Widget showButtonContainer({
  required String text,
  required Function() onContainerTap,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: onContainerTap,
    child: Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 40,
      ),
      decoration: BoxDecoration(
        color: Colors.orange.shade700,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 20,
          )
        ],
      ),
    ),
  );
}

// TextButton for Auth
TextButton showTextButton({
  required Function() function,
  required String text1,
  required String text2,
}) {
  return TextButton(
    onPressed: function,
    child: Row(
      children: [
        showmediumText(text: text1),
        const SizedBox(
          width: 5,
        ),
        Text(
          text2,
          style: TextStyle(
            color: Colors.orange.shade700,
          ),
        )
      ],
    ),
  );
}

// alertDialog
showAlertDialog(
  BuildContext context,
  WidgetRef ref,
  String userName,
  String email,
) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(),
          title: const Center(
            child: Text(
              "My Profile",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          content: ListView(
            shrinkWrap: true,
            children: [
              Text(
                userName,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
              ),
              showmediumSpace(),
              Text(
                email,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
              ),
              showSmallSpace(),
              GestureDetector(
                onTap: () {
                  ref.read(firebaseAuthServiceProvider).signOutUser(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 30,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade700,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Icon(
                        Icons.logout_outlined,
                        color: Colors.white,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
