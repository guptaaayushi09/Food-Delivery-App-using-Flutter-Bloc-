import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:foodie/bloc/provider.dart';

import 'package:foodie/model/food_Items.dart';

import 'package:rxdart/rxdart.dart';

class CartListBloc extends BlocBase {
  CartListBloc();

  var _listController = BehaviorSubject<List<FoodItems>>.seeded([]);

//provider class
  CartProvider provider = CartProvider();

//output
  Stream<List<FoodItems>> get listStream => _listController.stream;

//input
  Sink<List<FoodItems>> get listSink => _listController.sink;

  addToList(FoodItems foodItem) {
    listSink.add(provider.addToList(foodItem));
  }

  removeFromList(FoodItems foodItem) {
    listSink.add(provider.removeFromList(foodItem));
  }

//dispose will be called automatically by closing its streams
  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}
