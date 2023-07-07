import 'package:flutter/material.dart';
import 'package:grocery_store_app/constants/sizes.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemImage;
  final String itemName;
  final String itemPrice;
  final color;
  final void Function()? onPressed;

  const GroceryItemTile(
      {super.key, required this.itemImage, required this.itemName, required this.itemPrice, required this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: color[100], borderRadius: BorderRadius.circular(jBorderRadius)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                itemImage,
                height: 100,
              ),
            ),
            Text(itemName),
            MaterialButton(
              elevation: 5,
              onPressed: onPressed,
              color: color[800],
              child: Text(
                '\$$itemPrice',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
