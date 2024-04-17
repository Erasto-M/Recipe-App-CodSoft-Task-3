//models and data list providers
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app_codsoft_task3/Models/recipe_model.dart';
import 'package:recipe_app_codsoft_task3/Models/recipes_data_list.dart';

final recipesDataProvider = Provider((ref) {
  return RecipeData.recipe;
});
