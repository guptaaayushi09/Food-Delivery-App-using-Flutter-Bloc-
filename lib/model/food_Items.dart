import 'package:flutter/foundation.dart';

FoodItemList fooditemList = FoodItemList(fooditemlist: [
  FoodItems(
    id: 2,
    title: "Kick Ass Burgers",
    hotel: "Dudleys",
    price: 11.99,
    imgUrl:
        "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png",
  ),
  FoodItems(
    id: 3,
    title: "Supreme Pizza Burger",
    hotel: "Golf Course",
    price: 8.49,
    imgUrl: "https://static.food2fork.com/burger53be.jpg",
  ),
  FoodItems(
    id: 4,
    title: "Chilly Cheeze Burger",
    hotel: "Las Vegas Hotel",
    price: 14.49,
    imgUrl: "https://static.food2fork.com/36725137eb.jpg",
  ),
  FoodItems(
    id: 5,
    title: "Beach BBQ Burger",
    hotel: "Las Vegas Hotel",
    price: 14.49,
    imgUrl: "https://static.food2fork.com/turkeyburger300x200ff84052e.jpg",
  ),
  FoodItems(
    id: 6,
    title: "Beach BBQ Burger",
    hotel: "Las Vegas Hotel",
    price: 14.49,
    imgUrl:
        "https://cdn.pixabay.com/photo/2018/03/04/20/08/burger-3199088__340.jpg",
  ),
]);

class FoodItemList {
  List<FoodItems> fooditemlist;
  FoodItemList({required this.fooditemlist});
}

class FoodItems {
  int quantity;
  double price;
  int id;
  String title;
  String imgUrl;
  String hotel;
  FoodItems({
    required this.id,
    required this.price,
    required this.title,
    required this.imgUrl,
    required this.hotel,
    this.quantity = 1,
  });

  void incrementQuantity() {
    this.quantity = quantity + 1;
  }

  void decreamentQuantity() {
    this.quantity = quantity - 1;
  }
}
