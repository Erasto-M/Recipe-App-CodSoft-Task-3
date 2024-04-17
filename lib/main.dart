import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app_codsoft_task3/Ui/RecipesScreen.dart';
import 'package:recipe_app_codsoft_task3/Ui/recipe_details_screen.dart';

void main() {
  runApp(const ProviderScope(child: RecipeApp()));
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RecipeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
