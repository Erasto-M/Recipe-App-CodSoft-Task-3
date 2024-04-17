// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app_codsoft_task3/Models/recipe_model.dart';

class RecipeDetails extends ConsumerWidget {
  const RecipeDetails({super.key, required this.recipe});
  final RecipeModel recipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.grey[200]),
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //custom appbar row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // menu container
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(Icons.arrow_back_outlined),
                      ),
                    ),
                    // Recipe Texts
                    const Row(
                      children: [
                        Icon(
                          Icons.restaurant,
                          color: Colors.orange,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Details",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: const Icon(
                        Icons.more_vert,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // Recipe Image
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.4,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://www.shutterstock.com/shutterstock/photos/1918473575/display_1500/stock-photo-ugali-served-with-fish-kales-and-kachumbari-sukumawiki-garnished-tomatoes-samaki-fried-sukuma-1918473575.jpg"),
                          fit: BoxFit.cover),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ]),
                ),
                // Name and Category Row
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      recipe.title,
                      style: TextStyle(
                        color: Colors.orange.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      recipe.category,
                      style: TextStyle(
                        color: Colors.orange.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // ingredients Row
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Ingredients",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  flex: 1,
                  child: ListView.builder(
                      itemCount: recipe.ingredients.length,
                      itemBuilder: (context, index) {
                        Ingredient ingredient = recipe.ingredients[index];
                        int ingredientIndex = index + 1;
                        return Text(
                            '$ingredientIndex. ${ingredient.name} - ${ingredient.quantity}');
                      }),
                ),

                const Text(
                  "Instructions",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: recipe.instructions.length,
                      itemBuilder: (context, index) {
                        int instructionIndex = index + 1;
                        return Text(
                            '$instructionIndex. ${recipe.instructions[index]}');
                      }),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      decoration: BoxDecoration(
                          color: Colors.orange.shade700,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.white,
                                blurRadius: 5,
                                offset: Offset(0, 3))
                          ]),
                      child: const Row(
                        children: [
                          Text(
                            "Add to Favorite",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Spacer(),
                          Icon(
                            Icons.favorite,
                            color: Colors.white,
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
