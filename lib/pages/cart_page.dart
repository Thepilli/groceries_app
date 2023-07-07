import 'package:flutter/material.dart';
import 'package:grocery_store_app/constants/colors.dart';
import 'package:grocery_store_app/constants/sizes.dart';
import 'package:grocery_store_app/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('My Cart')),
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(jPadding8),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(jBorderRadius)),
                          child: ListTile(
                            leading: Image.asset(
                              value.cartItems[index][2],
                              height: 40,
                            ),
                            title: Text(value.cartItems[index][0]),
                            subtitle: Text('\$${value.cartItems[index][1]}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.cancel),
                              onPressed: () {
                                Provider.of<CartModel>(context, listen: false).removeItemFromCart(index);
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(color: jPrimaryLightColor, borderRadius: BorderRadius.circular(jBorderRadius)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'Total Price',
                                style: TextStyle(color: jLinkLightColor),
                              ),
                              Text('\$${value.calculateTotal()}', style: const TextStyle(color: jLinkLightColor))
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border.all(color: jLinkLightColor), borderRadius: BorderRadius.circular(jBorderRadius)),
                            child: const Row(
                              children: [
                                Text(
                                  'Pay Now',
                                  style: TextStyle(color: jLinkLightColor),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: jLinkLightColor,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
