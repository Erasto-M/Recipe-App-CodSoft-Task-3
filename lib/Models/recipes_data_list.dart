import 'package:recipe_app_codsoft_task3/Models/recipe_model.dart';

class RecipeData {
  static final List<RecipeModel> recipe = [
    // recipes for breakfast
    // recipe 1
    RecipeModel(
        id: '1',
        title: "Pancakes",
        category: "BreakFast",
        ingredients: [
          Ingredient(name: "Flour", quantity: "1 cup"),
          Ingredient(name: "Milk", quantity: "1 cup"),
          Ingredient(name: "Egg", quantity: "1"),
          Ingredient(name: "Sugar", quantity: "2 tsp"),
          Ingredient(name: "Baking Powder", quantity: "2 tsp"),
        ],
        instructions: [
          "In a bowl , mix flour , sugar and baking powder.",
          "Add Milk and egg to the mixture and whisk until smooth.",
          "Heat a lightly oiled pan over medium heat.",
          "Pour the batter onto the pan and cook until bubbles form on the surface.",
          "Flip and cook until golden brown on both sides.",
          "Serve hot with maple syrup or toppings of your choice ",
        ],
        imageUrl: 'assets/images/pancake1.png'),
    //recipe 2
    RecipeModel(
        id: '2',
        title: "Scrambled Eggs",
        category: "BreakFast",
        ingredients: [
          Ingredient(name: "Eggs", quantity: "2"),
          Ingredient(name: "Milk", quantity: "2 tbsp"),
          Ingredient(name: "Butter", quantity: "1 tbsp"),
          Ingredient(name: "Salt", quantity: "1/4 tsp"),
          Ingredient(name: "Pepper", quantity: "1/4 tsp"),
        ],
        instructions: [
          "crack the eggs into a bowl , add milk , salt and pepper.",
          "Whisk until well combined.",
          "Melt butter in a pan over medium heat.",
          "Pour in the egg mixture and cook , stirring occasionally , until desired consistency is reached.",
          "Serve hot",
        ],
        imageUrl: 'assets/images/scrambled_eggs.png'),
    // recipe 3
    RecipeModel(
        id: '3',
        title: "Avocado Toast",
        category: "BreakFast",
        ingredients: [
          Ingredient(name: "Avocado", quantity: "1 ripe"),
          Ingredient(name: "Bread", quantity: "2 slices"),
          Ingredient(name: "Salt", quantity: "to taste"),
          Ingredient(name: "Black pepper", quantity: "to taste"),
          Ingredient(name: "Lemon juice", quantity: "1 tsp"),
          Ingredient(name: "Red pepper flakes", quantity: "optional"),
        ],
        instructions: [
          "Toast the bread slices until golden brown.",
          "Mash the avocado in a bowl and add lemon juice , salt and black pepper.",
          "Spread the avocado mixture on the toast slices.",
          "Sprinkle with red pepper flakes if desired.",
          "Serve immediately.",
        ],
        imageUrl: 'assets/images/avocadoToast.png'),
    // recipe 4
    RecipeModel(
        id: '4',
        title: "French Toast",
        category: "BreakFast",
        ingredients: [
          Ingredient(name: "Bread", quantity: "4 slices"),
          Ingredient(name: "Eggs", quantity: "2"),
          Ingredient(name: "Milk", quantity: "1/4 cup"),
          Ingredient(name: "Vanilla extract", quantity: "1/2 tsp"),
          Ingredient(name: "Cinnamon", quantity: "1/2 tsp"),
          Ingredient(name: "Butter", quantity: "for frying"),
        ],
        instructions: [
          'In a shallow dish, whisk together eggs, milk, vanilla extract, and cinnamon.',
          'Dip each slice of bread into the egg mixture, allowing it to soak for a few seconds on each side.',
          'Melt butter in a pan over medium heat.',
          'Fry the soaked bread slices until golden brown on both sides.',
          'Serve hot with maple syrup or toppings of your choice.',
        ],
        imageUrl: 'assets/images/frenchToast.png'),
    // recipe 5
    RecipeModel(
        id: '5',
        title: "Banana Bread",
        category: "BreakFast",
        ingredients: [
          Ingredient(name: 'Ripe bananas', quantity: '3'),
          Ingredient(name: 'Flour', quantity: '1 1/2 cups'),
          Ingredient(name: 'Sugar', quantity: '1/2 cup'),
          Ingredient(name: 'Egg', quantity: '1'),
          Ingredient(name: 'Butter', quantity: '1/3 cup'),
          Ingredient(name: 'Baking soda', quantity: '1 tsp'),
          Ingredient(name: 'Vanilla extract', quantity: '1 tsp'),
        ],
        instructions: [
          'Preheat oven to 350°F (175°C). Grease and flour a loaf pan.',
          'In a mixing bowl, mash bananas with a fork.',
          'Add sugar, egg, melted butter, and vanilla extract. Mix well.',
          'Add flour and baking soda. Stir until just combined.',
          'Pour batter into the prepared loaf pan.',
          'Bake for 50-60 minutes, or until a toothpick inserted into the center comes out clean.',
          'Allow to cool before slicing.',
        ],
        imageUrl: 'assets/images/bananaBread.png'),
    // recipe 6
    RecipeModel(
        id: "6",
        title: "Omelette",
        category: "Breakfast",
        ingredients: [
          Ingredient(name: 'Eggs', quantity: '3'),
          Ingredient(name: 'Milk', quantity: '2 tbsp'),
          Ingredient(name: 'Butter', quantity: '1 tbsp'),
          Ingredient(name: 'Salt', quantity: '1/4 tsp'),
          Ingredient(name: 'Pepper', quantity: '1/4 tsp'),
          Ingredient(
              name: 'Fillings of your choice',
              quantity: 'e.g., cheese, vegetables, ham'),
        ],
        instructions: [
          'Crack the eggs into a bowl, add milk, salt, and pepper. Whisk until well combined.',
          'Melt butter in a non-stick skillet over medium heat.',
          'Pour the egg mixture into the skillet. Allow it to set slightly.',
          'Add desired fillings on one half of the omelette.',
          'Fold the other half of the omelette over the fillings.',
          'Cook for a few more minutes until the omelette is cooked through.',
          'Serve hot.',
        ],
        imageUrl: 'assets/images/omellete.png'),
    // Recipe 7
    RecipeModel(
        id: '7',
        title: "Fruit Salad",
        category: "BreakFast",
        ingredients: [
          Ingredient(name: 'Strawberries', quantity: '1 cup, sliced'),
          Ingredient(name: 'Blueberries', quantity: '1 cup'),
          Ingredient(name: 'Banana', quantity: '1, sliced'),
          Ingredient(name: 'Apple', quantity: '1, diced'),
          Ingredient(name: 'Honey', quantity: '2 tbsp'),
          Ingredient(name: 'Lemon juice', quantity: '1 tbsp'),
          Ingredient(name: 'Mint leaves', quantity: 'for garnish'),
        ],
        instructions: [
          "In a large bowl, combine sliced strawberries, blueberries, sliced banana, and diced apple.",
          "Drizzle honey and lemon juice over the fruit.",
          "Gently toss until the fruit is evenly coated with the honey-lemon mixture.",
          "Garnish with fresh mint leaves.",
          "Serve immediately or chill in the refrigerator until ready to serve.",
        ],
        imageUrl: 'assets/images/fruitSalad.png'),
    // recipe 8
    RecipeModel(
        id: '8',
        title: "Smoothie Bowl",
        category: "BreakFast",
        ingredients: [
          Ingredient(name: 'Frozen mixed berries', quantity: '1 cup'),
          Ingredient(name: 'Banana', quantity: '1, sliced'),
          Ingredient(name: 'Greek yogurt', quantity: '1/2 cup'),
          Ingredient(name: 'Spinach', quantity: '1 cup'),
          Ingredient(name: 'Almond milk', quantity: '1/2 cup'),
          Ingredient(name: 'Granola', quantity: 'for topping'),
          Ingredient(name: 'Sliced fruit', quantity: 'for topping'),
          Ingredient(name: 'Chia seeds', quantity: 'for topping'),
        ],
        instructions: [
          'In a blender, combine frozen mixed berries, sliced banana, Greek yogurt, spinach, and almond milk.',
          'Blend until smooth and creamy.',
          'Pour the smoothie into a bowl.',
          'Top with granola, sliced fruit, and chia seeds.',
          'Serve immediately and enjoy!',
        ],
        imageUrl: 'assets/images/smothieBowl.png'),
    // recipe 9
    RecipeModel(
        id: '9',
        title: "Breakfast Burrito",
        category: "BreakFast",
        ingredients: [
          Ingredient(name: 'Tortillas', quantity: '4 large'),
          Ingredient(name: 'Eggs', quantity: '6, beaten'),
          Ingredient(name: 'Bell pepper', quantity: '1, diced'),
          Ingredient(name: 'Onion', quantity: '1, diced'),
          Ingredient(
              name: 'Black beans', quantity: '1 cup, drained and rinsed'),
          Ingredient(name: 'Shredded cheese', quantity: '1 cup'),
          Ingredient(name: 'Salt and pepper', quantity: 'to taste'),
          Ingredient(name: 'Avocado', quantity: '1, sliced (optional)'),
          Ingredient(name: 'Salsa', quantity: 'for serving (optional)'),
          Ingredient(name: 'Sour cream', quantity: 'for serving (optional)'),
        ],
        instructions: [
          'In a large skillet, heat some oil over medium heat.',
          'Add diced bell pepper and onion to the skillet. Cook until softened, about 5 minutes.',
          'Pour beaten eggs into the skillet. Season with salt and pepper. Cook, stirring occasionally, until scrambled and cooked through.',
          'Warm the tortillas in a separate skillet or microwave.',
          'Assemble the burritos by spooning some scrambled eggs onto each tortilla.',
          'Top with black beans and shredded cheese.',
          'Optionally, add sliced avocado, salsa, and sour cream.',
          'Fold the sides of the tortillas over the filling and roll up tightly.',
          'Serve immediately, or wrap in foil for a portable breakfast. Enjoy your breakfast burritos!',
        ],
        imageUrl: 'assets/images/BreakfastBurrito.png'),

    // recipes for lunch
    // recipe 10
    RecipeModel(
        id: "10",
        title: "Chicken caesar Salad",
        category: "Lunch",
        ingredients: [
          Ingredient(name: 'Chicken breast', quantity: '2, grilled and sliced'),
          Ingredient(name: 'Romaine lettuce', quantity: '1 head, chopped'),
          Ingredient(name: 'Croutons', quantity: '1 cup'),
          Ingredient(name: 'Parmesan cheese', quantity: '1/2 cup, grated'),
          Ingredient(name: 'Caesar dressing', quantity: '1/4 cup'),
          Ingredient(name: 'Lemon juice', quantity: '1 tbsp'),
          Ingredient(name: 'Salt and pepper', quantity: 'to taste'),
        ],
        instructions: [
          'In a large bowl, combine chopped romaine lettuce, grilled and sliced chicken breast, croutons, and grated Parmesan cheese.',
          'Drizzle Caesar dressing and lemon juice over the salad.',
          'Season with salt and pepper to taste.',
          'Toss until well combined.',
          'Serve immediately.',
        ],
        imageUrl: "assets/images/chickenCaesarSalad.png"),
    // recipe 11
    RecipeModel(
        id: "11",
        title: "Caprese sandwich",
        category: "Lunch",
        ingredients: [
          Ingredient(name: 'Ciabatta bread', quantity: '2 loaves, sliced'),
          Ingredient(name: 'Tomato', quantity: '2, sliced'),
          Ingredient(name: 'Fresh mozzarella cheese', quantity: '8 oz, sliced'),
          Ingredient(name: 'Fresh basil leaves', quantity: '1 cup'),
          Ingredient(name: 'Balsamic glaze', quantity: '2 tbsp'),
          Ingredient(name: 'Olive oil', quantity: '2 tbsp'),
          Ingredient(name: 'Salt and pepper', quantity: 'to taste'),
        ],
        instructions: [
          'Brush olive oil on the sliced ciabatta bread.',
          'Layer tomato slices, mozzarella cheese slices, and fresh basil leaves on one slice of bread.',
          'Drizzle with balsamic glaze and season with salt and pepper.',
          'Top with the other slice of bread.',
          'Grill the sandwich until the bread is toasted and the cheese is melted.',
          'Slice and serve hot.',
        ],
        imageUrl: "assets/images/capresesandwich.png"),
    // recipe 12
    RecipeModel(
        id: "12",
        title: "Vegetable Stir-Fry",
        category: "Lunch",
        ingredients: [
          Ingredient(
              name: 'Mixed vegetables',
              quantity:
                  '4 cups, sliced (e.g., bell peppers, broccoli, carrots)'),
          Ingredient(name: 'Firm tofu', quantity: '1 block, cubed'),
          Ingredient(name: 'Soy sauce', quantity: '1/4 cup'),
          Ingredient(name: 'Sesame oil', quantity: '2 tbsp'),
          Ingredient(name: 'Garlic', quantity: '2 cloves, minced'),
          Ingredient(name: 'Ginger', quantity: '1 tsp, grated'),
          Ingredient(name: 'Rice', quantity: '2 cups, cooked'),
          Ingredient(name: 'Green onions', quantity: 'for garnish'),
          Ingredient(name: 'Sesame seeds', quantity: 'for garnish'),
        ],
        instructions: [
          'In a large skillet or wok, heat sesame oil over medium heat.',
          'Add minced garlic and grated ginger. Stir-fry until fragrant.',
          'Add cubed tofu and cook until lightly browned.',
          'Add sliced mixed vegetables to the skillet. Stir-fry until tender-crisp.',
          'Pour soy sauce over the vegetables and tofu. Stir to combine.',
          'Serve over cooked rice.',
          'Garnish with chopped green onions and sesame seeds.',
          'Serve hot and enjoy!',
        ],
        imageUrl: "assets/images/vegetableStirfry.png"),
    // recipe 13
    RecipeModel(
        id: "13",
        title: "Greek Salad",
        category: "Lunch",
        ingredients: [
          Ingredient(name: 'Cucumber', quantity: '1, diced'),
          Ingredient(name: 'Tomato', quantity: '2, diced'),
          Ingredient(name: 'Red onion', quantity: '1/2, thinly sliced'),
          Ingredient(name: 'Kalamata olives', quantity: '1/4 cup'),
          Ingredient(name: 'Feta cheese', quantity: '1/2 cup, crumbled'),
          Ingredient(name: 'Olive oil', quantity: '2 tbsp'),
          Ingredient(name: 'Red wine vinegar', quantity: '1 tbsp'),
          Ingredient(name: 'Dried oregano', quantity: '1 tsp'),
          Ingredient(name: 'Salt and pepper', quantity: 'to taste'),
        ],
        instructions: [
          'In a large bowl, combine diced cucumber, diced tomato, thinly sliced red onion, Kalamata olives, and crumbled feta cheese.',
          'In a small bowl, whisk together olive oil, red wine vinegar, dried oregano, salt, and pepper.',
          'Drizzle the dressing over the salad and toss until well coated.',
          'Serve immediately or refrigerate until ready to serve.',
        ],
        imageUrl: "assets/images/greekSalad.png"),
    // recipe 14
    RecipeModel(
        id: "14",
        title: "Mushroom Risotto",
        category: "Lunch",
        ingredients: [
          Ingredient(name: 'Arborio rice', quantity: '1 cup'),
          Ingredient(name: 'Vegetable broth', quantity: '4 cups'),
          Ingredient(name: 'Mushrooms', quantity: '8 oz, sliced'),
          Ingredient(name: 'Onion', quantity: '1, finely chopped'),
          Ingredient(name: 'Garlic', quantity: '2 cloves, minced'),
          Ingredient(name: 'White wine', quantity: '1/2 cup'),
          Ingredient(name: 'Parmesan cheese', quantity: '1/2 cup, grated'),
          Ingredient(name: 'Butter', quantity: '2 tbsp'),
          Ingredient(name: 'Olive oil', quantity: '2 tbsp'),
          Ingredient(name: 'Salt and pepper', quantity: 'to taste'),
          Ingredient(name: 'Fresh parsley', quantity: 'for garnish'),
        ],
        instructions: [
          'In a saucepan, heat vegetable broth over medium heat. Keep warm.',
          'In a large skillet, heat olive oil and butter over medium heat.',
          'Add chopped onion and minced garlic. Cook until softened.',
          'Add sliced mushrooms to the skillet. Cook until browned.',
          'Stir in Arborio rice and cook until translucent, about 2 minutes.',
          'Pour in white wine and cook until absorbed, stirring constantly.',
          'Add a ladleful of warm vegetable broth to the skillet. Cook, stirring frequently, until absorbed.',
          'Continue adding broth, one ladleful at a time, until the rice is creamy and tender, about 20-25 minutes.',
          'Stir in grated Parmesan cheese. Season with salt and pepper to taste.',
          'Garnish with chopped fresh parsley.',
          'Serve hot and enjoy!',
        ],
        imageUrl: "assets/images/MushroomRisotto.png"),
  ];
}
