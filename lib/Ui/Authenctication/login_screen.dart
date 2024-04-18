import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:recipe_app_codsoft_task3/Providers/providers.dart';
import 'package:recipe_app_codsoft_task3/Services/firebase_auth_service.dart';
import 'package:recipe_app_codsoft_task3/Ui/Authenctication/create_account_screen.dart';
import 'package:recipe_app_codsoft_task3/Widgets/common_widgets.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = ref.watch(emailProvider);
    final passwordController = ref.watch(passwordProvider);
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
                  text: "Welcome Back",
                  color: Colors.black,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      showSmallSpace(),
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
                      showBigSpace(),
                      isLoading
                          ? SpinKitSpinningLines(
                              color: Colors.orange.shade700,
                              size: 70,
                            )
                          : showButtonContainer(
                              text: "Login",
                              onContainerTap: () async {
                                if (formkey.currentState!.validate()) {
                                  ref
                                      .read(loadingSpinnerProvider.notifier)
                                      .state = true;
                                  await ref
                                      .watch(firebaseAuthServiceProvider)
                                      .signInUserWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          context: context);
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
                        builder: (context) => CreateAccountScreen(),
                      ),
                    );
                  },
                  text1: "Don\'t have an Acount ?",
                  text2: "Register",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
