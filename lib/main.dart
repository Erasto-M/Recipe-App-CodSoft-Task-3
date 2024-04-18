import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app_codsoft_task3/Ui/Authenctication/create_account_screen.dart';
import 'package:recipe_app_codsoft_task3/Ui/Authenctication/login_screen.dart';
import 'package:recipe_app_codsoft_task3/Ui/RecipesScreen.dart';
import 'package:recipe_app_codsoft_task3/Ui/recipe_details_screen.dart';
import 'package:recipe_app_codsoft_task3/Ui/splash_screen.dart';
import 'package:recipe_app_codsoft_task3/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: RecipeApp()));
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
