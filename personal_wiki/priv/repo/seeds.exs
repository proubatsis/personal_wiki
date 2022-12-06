# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PersonalWiki.Repo.insert!(%PersonalWiki.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

PersonalWiki.Repo.delete_all PersonalWiki.Kitchen.Recipe
PersonalWiki.Repo.delete_all PersonalWiki.Kitchen.Ingredient


# Create cake recipe
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Recipe{name: "Cake"}

# Create cake ingredients
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Ingredient{name: "Flour", plural_name: "Flour"}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Ingredient{name: "Sugar", plural_name: "Sugar"}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Ingredient{name: "Egg", plural_name: "Eggs"}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Ingredient{name: "Milk", plural_name: "Milk"}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Ingredient{name: "Butter", plural_name: "Butter"}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Ingredient{name: "Salt", plural_name: "Salt"}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Ingredient{name: "Baking powder", plural_name: "Baking powder"}

# Create cake recipe_ingredients
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.RecipeIngredient{
  recipe_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Recipe, name: "Cake").id,
  ingredient_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Ingredient, name: "Flour").id,
  amount: 1.0,
  measurement_unit: :cup,
}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.RecipeIngredient{
  recipe_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Recipe, name: "Cake").id,
  ingredient_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Ingredient, name: "Sugar").id,
  amount: 0.5,
  measurement_unit: :cup,
}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.RecipeIngredient{
  recipe_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Recipe, name: "Cake").id,
  ingredient_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Ingredient, name: "Egg").id,
  amount: 2.0,
  measurement_unit: :unit,
}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.RecipeIngredient{
  recipe_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Recipe, name: "Cake").id,
  ingredient_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Ingredient, name: "Milk").id,
  amount: 0.5,
  measurement_unit: :cup,
}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.RecipeIngredient{
  recipe_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Recipe, name: "Cake").id,
  ingredient_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Ingredient, name: "Butter").id,
  amount: 0.5,
  measurement_unit: :cup,
}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.RecipeIngredient{
  recipe_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Recipe, name: "Cake").id,
  ingredient_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Ingredient, name: "Salt").id,
  amount: 0.5,
  measurement_unit: :tsp,
}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.RecipeIngredient{
  recipe_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Recipe, name: "Cake").id,
  ingredient_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Ingredient, name: "Baking powder").id,
  amount: 1.0,
  measurement_unit: :tsp,
}

# Create burger recipe
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Recipe{name: "Burger"}

# Create burger ingredients
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Ingredient{name: "Bun", plural_name: "Buns"}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Ingredient{name: "Beef", plural_name: "Beef"}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Ingredient{name: "Onion", plural_name: "Onions"}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Ingredient{name: "Ketchup", plural_name: "Ketchup"}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Ingredient{name: "Mustard", plural_name: "Mustard"}

# Create burger recipe_ingredients
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.RecipeIngredient{
  recipe_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Recipe, name: "Burger").id,
  ingredient_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Ingredient, name: "Bun").id,
  amount: 2.0,
  measurement_unit: :unit,
}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.RecipeIngredient{
  recipe_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Recipe, name: "Burger").id,
  ingredient_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Ingredient, name: "Beef").id,
  amount: 454.0,
  measurement_unit: :g,
}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.RecipeIngredient{
  recipe_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Recipe, name: "Burger").id,
  ingredient_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Ingredient, name: "Onion").id,
  amount: 1.0,
  measurement_unit: :unit,
}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.RecipeIngredient{
  recipe_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Recipe, name: "Burger").id,
  ingredient_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Ingredient, name: "Ketchup").id,
  amount: 1.0,
  measurement_unit: :tsp,
}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.RecipeIngredient{
  recipe_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Recipe, name: "Burger").id,
  ingredient_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Ingredient, name: "Mustard").id,
  amount: 1.0,
  measurement_unit: :tsp,
}

# Create pizza recipe
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Recipe{name: "Pizza"}

# Create pizza ingredients
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Ingredient{name: "Water", plural_name: "Water"}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Ingredient{name: "Yeast", plural_name: "Yeast"}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Ingredient{name: "Olive oil", plural_name: "Olive oil"}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Ingredient{name: "Tomato sauce", plural_name: "Tomato sauce"}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Ingredient{name: "Mozzarella", plural_name: "Mozzarella"}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.Ingredient{name: "Pepperoni", plural_name: "Pepperoni"}

# Create pizza recipe_ingredients
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.RecipeIngredient{
  recipe_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Recipe, name: "Pizza").id,
  ingredient_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Ingredient, name: "Flour").id,
  amount: 2.0,
  measurement_unit: :cup,
}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.RecipeIngredient{
  recipe_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Recipe, name: "Pizza").id,
  ingredient_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Ingredient, name: "Water").id,
  amount: 0.5,
  measurement_unit: :cup,
}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.RecipeIngredient{
  recipe_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Recipe, name: "Pizza").id,
  ingredient_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Ingredient, name: "Salt").id,
  amount: 1.0,
  measurement_unit: :tsp
}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.RecipeIngredient{
  recipe_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Recipe, name: "Pizza").id,
  ingredient_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Ingredient, name: "Yeast").id,
  amount: 0.5,
  measurement_unit: :tsp
}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.RecipeIngredient{
  recipe_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Recipe, name: "Pizza").id,
  ingredient_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Ingredient, name: "Olive oil").id,
  amount: 1.0,
  measurement_unit: :tsp,
}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.RecipeIngredient{
  recipe_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Recipe, name: "Pizza").id,
  ingredient_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Ingredient, name: "Tomato sauce").id,
  amount: 1.0,
  measurement_unit: :cup,
}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.RecipeIngredient{
  recipe_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Recipe, name: "Pizza").id,
  ingredient_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Ingredient, name: "Mozzarella").id,
  amount: 1.0,
  measurement_unit: :cup,
}
PersonalWiki.Repo.insert! %PersonalWiki.Kitchen.RecipeIngredient{
  recipe_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Recipe, name: "Pizza").id,
  ingredient_id: PersonalWiki.Repo.get_by(PersonalWiki.Kitchen.Ingredient, name: "Pepperoni").id,
  amount: 1.0,
  measurement_unit: :cup,
}
