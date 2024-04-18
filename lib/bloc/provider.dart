import 'package:foodie/model/food_Items.dart';

class CartProvider {
  List<FoodItems> foodItems = [];
  List<FoodItems> addToList(FoodItems foodItem) {
    foodItems.add(foodItem);
    return foodItems;
  }

  List<FoodItems> removeFromList(FoodItems foodItem) {
    foodItems.remove(foodItem);
    return foodItems;
  }
}
