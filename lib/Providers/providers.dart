// ignore_for_file: public_member_api_docs, sort_constructors_first
//models and data list providers
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:recipe_app_codsoft_task3/Models/recipe_model.dart';
import 'package:recipe_app_codsoft_task3/Models/recipes_data_list.dart';

//recipedata provider
final recipesDataProvider =
    StateNotifierProvider<RecipesNotifier, List<RecipeModel>>((ref) {
  return RecipesNotifier();
});
// search TextEditing controller
final searchControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

class RecipesNotifier extends StateNotifier<List<RecipeModel>> {
  RecipesNotifier() : super(RecipeData.recipe);
  // method for searching recipes
  void searchRecipes(String query) {
    final allRecipes = List<RecipeModel>.from(state);
    if (query.isEmpty) {
      state = allRecipes;
    } else {
      state = allRecipes
          .where(
            (recipe) => recipe.title.toLowerCase().contains(
                  query.toLowerCase(),
                ),
          )
          .toList();
    }
  }

  void resetRecipes() {
    state = List<RecipeModel>.from(RecipeData.recipe);
  }
}

// search query provider
final searchQueryProvider = Provider<String>((ref) {
  final controller = ref.watch(searchControllerProvider);
  return controller.text;
});
// provider to handle the search functionality
final searchRecipesProvider = Provider.autoDispose((ref) {
  final recipes = ref.watch(recipesDataProvider.notifier);
  final query = ref.watch(searchQueryProvider);
  recipes.searchRecipes(query);
  return true;
});

// TextEditing Controllersproviders
final fullNameProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});
final emailProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});
final passwordProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});
final confirmPasswordProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

// formkey provider
final formKeyProvider = StateProvider<GlobalKey>((ref) {
  return GlobalKey<FormState>();
});

// Loading spinner providel
final loadingSpinnerProvider = StateProvider<bool>((ref) {
  return false;
});

// call alert dialog provider
final callAlertDialogProvider = StateProvider<bool>((ref) {
  return false;
});

/// state Nottifier for current user
class CurrentUserNotifier extends StateNotifier<Currentuser?> {
  CurrentUserNotifier() : super(null);
  Future fetchCurrentUserDetails() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        String currentUserId = currentUser.uid;
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection("Users")
            .where("Uid", isEqualTo: currentUserId)
            .get();
        querySnapshot.docs.forEach((doc) {
          Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;
          state = Currentuser(
              userName: userData['FullName'], userEmail: userData["Email"]);
        });
      }
    } catch (e) {
      Text(e.toString());
    }
  }
}

class Currentuser {
  String userName;
  String userEmail;
  Currentuser({
    required this.userName,
    required this.userEmail,
  });
}

// current user notifier provider
final currentUserProvider = StateNotifierProvider((ref) {
  return CurrentUserNotifier();
});
