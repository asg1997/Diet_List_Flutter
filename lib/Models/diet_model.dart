
class Diet {
  String name;
  String description;
  String diet;
  List<Product> productList;
  List<Menu> menu;

  Diet(this.name, this.description, this.diet, this.menu, this.productList);
}

class Product {
  String name;
  String status;

  Product(this.name, this.status);
}

class Menu {
  String mealType;
  List<Dish> dishes;

  Menu(this.mealType, this.dishes);
}

class Dish {
  String name;
  String imageLink;
  Recipe recipe;

  Dish(this.name, this.imageLink, this.recipe);
}

class Recipe {
  List<Ingredient> ingredients;
  String process;

  Recipe(this.ingredients, this.process);
}

class Ingredient {
  String name;
  String amount;

  Ingredient(this.name, this.amount);
}
