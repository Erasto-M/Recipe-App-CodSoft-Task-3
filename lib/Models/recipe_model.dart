// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class RecipeModel {
  final String id;
  final String title;
  final String category;
  final List<Ingredient> ingredients;
  final List<String> instructions;
  final String imageUrl;
  const RecipeModel({
    required this.id,
    required this.title,
    required this.category,
    required this.ingredients,
    required this.instructions,
    required this.imageUrl,
  });

  RecipeModel copyWith({
    String? id,
    String? title,
    String? category,
    List<Ingredient>? ingredients,
    List<String>? instructions,
    String? imageUrl,
  }) {
    return RecipeModel(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'category': category,
      'ingredients': ingredients.map((x) {
        return x.toMap();
      }).toList(growable: false),
      'instructions': instructions,
      'imageUrl': imageUrl,
    };
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      id: (map["id"] ?? '') as String,
      title: (map["title"] ?? '') as String,
      category: (map["category"] ?? '') as String,
      ingredients: List<Ingredient>.from(
        ((map['ingredients'] ?? const <Ingredient>[]) as List)
            .map<Ingredient>((x) {
          return Ingredient.fromMap(
              (x ?? Map<String, dynamic>.from({})) as Map<String, dynamic>);
        }),
      ),
      instructions: List<String>.from(
        ((map['instructions'] ?? const <String>[]) as List<String>),
      ),
      imageUrl: (map["imageUrl"] ?? '') as String,
    );
  }
}

// ingredients class
class Ingredient {
  final String name;
  final String quantity;
  Ingredient({
    required this.name,
    required this.quantity,
  });
  // copywith method
  Ingredient copyWith(
    String? name,
    String? quantity,
  ) {
    return Ingredient(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
    );
  }

  // toMap Method
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "quantity": quantity,
    };
  }

  // from map method
  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
        name: (map["name"] ?? '') as String,
        quantity: (map["quantity"] ?? '') as String);
  }
}
