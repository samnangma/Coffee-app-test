import 'package:firstproject/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier{
  // coffee for sale list
  final List<Coffee> _shop = [
    // black coffee
    Coffee(name: "iced americano ", price: '3.10 ', imagePath: "lib/images/coffee.png"),
    // latte
    Coffee(name: "iced latte ", price: '3.30 ', imagePath: "lib/images/coffee1.png"),
    // espresso
    Coffee(name: "iced espresso ", price: '3.40 ', imagePath: "lib/images/coffee2.png"),
    // iced coffee
    Coffee(name: "iced latte ", price: '3.50 ', imagePath: "lib/images/coffee3.png",),
  ];
  // user cart
  List<Coffee> _userCart = [];
  // get coffee list

  List<Coffee> get coffeeShop => _shop;

  // get user cart
  List<Coffee> get userCart => _userCart;

  // add user cart
  void addItemToCart(Coffee coffee){
    _userCart.add(coffee);
    notifyListeners();

  }

  // remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }


}