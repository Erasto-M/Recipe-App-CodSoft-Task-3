import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:recipe_app_codsoft_task3/Providers/providers.dart';
import 'package:recipe_app_codsoft_task3/Services/firebase_auth_service.dart';
import 'package:recipe_app_codsoft_task3/Ui/Authenctication/login_screen.dart';
import 'package:recipe_app_codsoft_task3/Widgets/common_widgets.dart';

class CreateAccountScreen extends ConsumerWidget {
  CreateAccountScreen({super.key});
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // controllers
    final emailController = ref.watch(emailProvider);
    final fullNameController = ref.watch(fullNameProvider);
    final passwordController = ref.watch(passwordProvider);
    final confirmPasswordController = ref.watch(confirmPasswordProvider);
    // loading
    final isLoading = ref.watch(loadingSpinnerProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 15),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/LogoImage1.png",
                  height: 150,
                  width: 300,
                  color: Colors.black,
                ),
                Center(
                  child: Text(
                    "Tasty Table Recipes",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange.shade700,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                showmediumText(text: "Your Ultimate MasterChef"),
                showBigText(
                  text: "Create Account",
                  color: Colors.black,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      showSmallSpace(),
                      showTextFormFieldContainer(
                          context: context,
                          controller: fullNameController,
                          textInputType: TextInputType.text,
                          hintText: "FullName",
                          prefixIcon: Icons.person,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'FullName Field cannot be empty';
                            }
                            return null;
                          }),
                      showSmallSpace2(),
                      showTextFormFieldContainer(
                          context: context,
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          hintText: "Email",
                          prefixIcon: Icons.email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email Field cannot be empty';
                            } else if (!value.contains("@gmail.com")) {
                              return "Please Enter a Valid Email";
                            }
                            return null;
                          }),
                      showSmallSpace2(),
                      showTextFormFieldContainer(
                          context: context,
                          controller: passwordController,
                          textInputType: TextInputType.visiblePassword,
                          hintText: "Password",
                          prefixIcon: Icons.lock,
                          obsecureText: true,
                          suffixIcon: Icons.visibility_off,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password Field cannot be empty';
                            } else if (value.length < 6) {
                              return "Passwords should be atleast 6 characters";
                            }
                            return null;
                          }),
                      showSmallSpace2(),
                      showTextFormFieldContainer(
                          context: context,
                          controller: confirmPasswordController,
                          textInputType: TextInputType.visiblePassword,
                          hintText: "Confirm Password",
                          obsecureText: true,
                          prefixIcon: Icons.lock,
                          suffixIcon: Icons.visibility_off,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please confirm Password';
                            } else if (value != passwordController.text) {
                              return "Passwords Mismatch";
                            }
                            return null;
                          }),
                      showBigSpace(),
                      isLoading
                          ? SpinKitSpinningLines(
                              color: Colors.orange.shade700,
                              size: 70,
                            )
                          : showButtonContainer(
                              text: "Create Account",
                              onContainerTap: () async {
                                if (formkey.currentState!.validate()) {
                                  ref
                                      .read(loadingSpinnerProvider.notifier)
                                      .state = true;
                                  await ref
                                      .watch(firebaseAuthServiceProvider)
                                      .createUserWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          context: context,
                                          fullName: fullNameController.text);
                                }
                                ref.read(emailProvider.notifier).state.clear();
                                ref
                                    .read(fullNameProvider.notifier)
                                    .state
                                    .clear();
                                ref
                                    .read(passwordProvider.notifier)
                                    .state
                                    .clear();
                                ref
                                    .read(confirmPasswordProvider.notifier)
                                    .state
                                    .clear();
                                ref
                                    .read(loadingSpinnerProvider.notifier)
                                    .state = false;
                              },
                              context: context,
                            )
                    ],
                  ),
                ),
                showSmallSpace(),
                showTextButton(
                  function: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  text1: "Already have an Acount ?",
                  text2: "Login",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
