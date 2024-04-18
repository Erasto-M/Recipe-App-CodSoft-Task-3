import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app_codsoft_task3/Models/recipe_model.dart';
import 'package:recipe_app_codsoft_task3/Providers/providers.dart';
import 'package:recipe_app_codsoft_task3/Services/firebase_auth_service.dart';
import 'package:recipe_app_codsoft_task3/Ui/recipe_details_screen.dart';
import 'package:recipe_app_codsoft_task3/Widgets/common_widgets.dart';

class RecipeScreen extends ConsumerWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = ref.watch(searchControllerProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.grey[200]),
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // menu row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // menu container
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(Icons.menu),
                  ),
                  // Recipe Texts
                  Row(
                    children: [
                      Icon(
                        Icons.restaurant,
                        color: Colors.orange.shade700,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "Tasty Table",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      ref
                          .read(firebaseAuthServiceProvider)
                          .signOutUser(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: const Icon(
                        Icons.logout_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              // search button row
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // search container
                  Expanded(
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 1),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.search),
                          Expanded(
                              child: TextFormField(
                            onChanged: (value) {
                              handleSearch(ref, value);
                              if (value.isEmpty) {
                                ref
                                    .read(recipesDataProvider.notifier)
                                    .resetRecipes();
                              }
                            },
                            controller: searchController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                hintText: "Search Recipe ...",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                )),
                          )),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.send,
                              color: Colors.orange.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(
                        Icons.filter_list,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // Breafast Recipes
              const Text(
                "Available Recipes",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              // Grid view
              Expanded(child: showAvailableRecipes()),
            ],
          ),
        ),
      ),
    );
  }

  // GridView. builder method to show the recipes available
  showAvailableRecipes() {
    return Consumer(builder: (context, ref, child) {
      final recipesList = ref.watch(recipesDataProvider);
      final filteredRecipes =
          filterRecipes(recipesList, ref.watch(searchQueryProvider));
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: filteredRecipes.length,
          itemBuilder: (context, index) {
            RecipeModel recipes = filteredRecipes[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RecipeDetails(
                          recipe: recipes,
                        )));
              },
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 3.2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              offset: Offset(0, 3))
                        ]),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 130,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage(recipes.imageUrl),
                                fit: BoxFit.cover),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 4,
                                  offset: Offset(0, 3))
                            ]),
                      )),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade700.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        recipes.title,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        recipes.category,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
    });
  }

  void handleSearch(WidgetRef ref, String value) {
    ref.read(recipesDataProvider.notifier).searchRecipes(value);
  }

  List<RecipeModel> filterRecipes(List<RecipeModel> recipes, String query) {
    if (query.isEmpty) {
      return recipes;
    } else {
      return recipes
          .where((recipe) =>
              recipe.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
