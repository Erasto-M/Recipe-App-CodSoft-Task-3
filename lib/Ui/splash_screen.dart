import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:recipe_app_codsoft_task3/Ui/Authenctication/login_screen.dart';
import 'package:recipe_app_codsoft_task3/Ui/RecipesScreen.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    });
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome To Tasty Table ",
              style: TextStyle(
                  color: Colors.orange.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const Text(
              "  your  MasterChef Recipes  ",
              style: const TextStyle(color: Colors.black, fontSize: 17),
            ),
            AnimatedScale(
              scale: 1,
              duration: const Duration(seconds: 4),
              curve: Curves.easeInOut,
              child: Center(
                child: Image.asset(
                  "assets/images/LogoImage1.png",
                  height: 270,
                  width: 270,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SpinKitSpinningLines(
              color: Colors.orange.shade700,
              size: 70,
            )
          ],
        ),
      ),
    );
  }
}
