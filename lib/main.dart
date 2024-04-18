import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:foodie/bloc/cartListBloc.dart';
import 'package:foodie/model/food_Items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc(
          (i) => CartListBloc(),
        ),
      ],
      dependencies: [],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Food App",
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              FirstHalf(),
              const SizedBox(height: 45),
              for (var foodItem in fooditemList.fooditemlist)
                ItemContainer(fooditem: foodItem),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemContainer extends StatelessWidget {
  final FoodItems fooditem;
  ItemContainer({required this.fooditem});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Items(
        hotel: fooditem.hotel,
        itemName: fooditem.title,
        itemPrice: fooditem.price,
        imageUrl: fooditem.imgUrl,
        leftAligned: fooditem.id % 2 == 0 ? true : false,
      ),
    );
  }
}

class Items extends StatelessWidget {
  final String hotel;
  final String itemName;
  final double itemPrice;
  final String imageUrl;
  final bool leftAligned;
  Items({
    required this.hotel,
    required this.itemName,
    required this.itemPrice,
    required this.imageUrl,
    required this.leftAligned,
  });

  @override
  Widget build(BuildContext context) {
    double containerPadding = 45;
    double containerBorderRadius = 10;

    return Column(children: <Widget>[
      Container(
          padding: EdgeInsets.only(
              left: leftAligned ? 0 : containerPadding,
              right: leftAligned ? containerPadding : 0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: leftAligned
                        ? Radius.circular(0)
                        : Radius.circular(containerBorderRadius),
                    right: leftAligned
                        ? Radius.circular(containerPadding)
                        : Radius.circular(0),
                  ),
                  child: Image.network(imageUrl, fit: BoxFit.fill),
                ),
              )
            ],
          )),
    ]);
  }
}

class FirstHalf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(35, 25, 0, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          SizedBox(height: 30),
          title(),
          SizedBox(height: 30),
          searchBar(),
          SizedBox(height: 30),
          categories(),
        ],
      ),
    );
  }
}

Widget categories() {
  return Container(
    height: 185,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        CategoryItemList(
          categoryName: "Burgers",
          categoryIcons: Icons.bug_report,
          availability: 12,
          selected: false,
        ),
        CategoryItemList(
          categoryName: "Burgers",
          categoryIcons: Icons.bug_report,
          availability: 12,
          selected: false,
        ),
        CategoryItemList(
          categoryName: "Burgers",
          categoryIcons: Icons.bug_report,
          availability: 12,
          selected: false,
        ),
        CategoryItemList(
          categoryName: "Burgers",
          categoryIcons: Icons.bug_report,
          availability: 12,
          selected: false,
        )
      ],
    ),
  );
}

Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Icon(
        Icons.search,
        color: Colors.black45,
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search.........",
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            hintStyle: TextStyle(color: Colors.black87),
          ),
        ),
      ),
    ],
  );
}

Widget title() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(height: 30),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "Food",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "Delivery",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w200),
          ),
        ],
      )
    ],
  );
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 30),
              child: Text("0"),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.yellow[800],
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryItemList extends StatelessWidget {
  final String categoryName;
  final IconData categoryIcons;
  final int availability;
  final bool selected;
  CategoryItemList(
      {required this.categoryName,
      required this.categoryIcons,
      required this.availability,
      required this.selected});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: selected ? Colors.yellow : Colors.white,
        border: Border.all(
            color: selected ? Colors.transparent : Colors.grey, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(25, 0),
            blurRadius: 15,
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  width: 15,
                  color: selected ? Colors.transparent : Colors.grey),
            ),
            child: Icon(
              categoryIcons as IconData,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(height: 30),
          Text(
            categoryName,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            width: 1.5,
            color: Colors.black,
            height: 15,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          ),
          Text(
            availability.toString(),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
