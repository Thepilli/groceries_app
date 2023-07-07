import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
//list of items on sale
  final List _shopItems = [
    ['Avocado', '4.00', 'assets/images/avocado.png', Colors.green],
    ['Banana', '2.00', 'assets/images/banana.png', Colors.yellow],
    ['Chicken', '4.00', 'assets/images/chicken.png', Colors.brown],
    ['Water', '4.00', 'assets/images/water.png', Colors.blue],
    ['Avocado', '4.00', 'assets/images/avocado.png', Colors.green],
    ['Banana', '2.00', 'assets/images/banana.png', Colors.yellow],
    ['Chicken', '4.00', 'assets/images/chicken.png', Colors.brown],
    ['Water', '4.00', 'assets/images/water.png', Colors.blue],
    ['Avocado', '4.00', 'assets/images/avocado.png', Colors.green],
    ['Banana', '2.00', 'assets/images/banana.png', Colors.yellow],
    ['Chicken', '4.00', 'assets/images/chicken.png', Colors.brown],
    ['Water', '4.00', 'assets/images/water.png', Colors.blue],
    ['Avocado', '4.00', 'assets/images/avocado.png', Colors.green],
    ['Banana', '2.00', 'assets/images/banana.png', Colors.yellow],
    ['Chicken', '4.00', 'assets/images/chicken.png', Colors.brown],
    ['Water', '4.00', 'assets/images/water.png', Colors.blue],
    ['Avocado', '4.00', 'assets/images/avocado.png', Colors.green],
    ['Banana', '2.00', 'assets/images/banana.png', Colors.yellow],
    ['Chicken', '4.00', 'assets/images/chicken.png', Colors.brown],
    ['Water', '4.00', 'assets/images/water.png', Colors.blue],
    ['Avocado', '4.00', 'assets/images/avocado.png', Colors.green],
    ['Banana', '2.00', 'assets/images/banana.png', Colors.yellow],
    ['Chicken', '4.00', 'assets/images/chicken.png', Colors.brown],
    ['Water', '4.00', 'assets/images/water.png', Colors.blue],
    ['Avocado', '4.00', 'assets/images/avocado.png', Colors.green],
    ['Banana', '2.00', 'assets/images/banana.png', Colors.yellow],
    ['Chicken', '4.00', 'assets/images/chicken.png', Colors.brown],
    ['Water', '4.00', 'assets/images/water.png', Colors.blue],
    ['Avocado', '4.00', 'assets/images/avocado.png', Colors.green],
    ['Banana', '2.00', 'assets/images/banana.png', Colors.yellow],
    ['Chicken', '4.00', 'assets/images/chicken.png', Colors.brown],
    ['Water', '4.00', 'assets/images/water.png', Colors.blue],
  ];

//list of cart item
  final List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;
//adding an item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

//removing an item from car
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

//calculating the total price
  String calculateTotal() {
    /// string because the function should return a string
    double totalPrice = 0;

    /// preparing an empty double variable
    for (var i = 0; i < _cartItems.length; i++) {
      /// looping through the list
      totalPrice += double.parse(_cartItems[i][1]);

      /// [1] because the price is at 1 index, double.parse
    }
    return totalPrice.toStringAsFixed(2);
  }
}
