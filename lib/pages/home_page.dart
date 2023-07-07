import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_store_app/components/grocery_item_tile.dart';
import 'package:grocery_store_app/constants/colors.dart';
import 'package:grocery_store_app/constants/sizes.dart';
import 'package:grocery_store_app/model/cart_model.dart';
import 'package:grocery_store_app/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const CartPage();
            },
          )),
          child: const Icon(Icons.shopping_basket),
        ),
        backgroundColor: jScafoldLightColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: jDefaultSize),
            // Good morning
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: jPadding25),
              child: Text(
                'Good Morning!',
                style: GoogleFonts.comfortaa(
                  textStyle: const TextStyle(color: jPrimaryLightColor, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: jDefaultSize),
            // Lets order some items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: jPadding25),
              child: Text(
                'Let\'s order fresh items for you',
                style: GoogleFonts.comfortaa(
                  textStyle: const TextStyle(color: jPrimaryLightColor, fontSize: 40),
                ),
              ),
            ),
            const SizedBox(height: jDefaultSize),

            // divvider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: jPadding25),
              child: Divider(
                color: jPrimaryLightColor,
                thickness: 2,
              ),
            ),
            const SizedBox(height: jDefaultSize),

            // Fresh Items
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: jPadding25),
              child: Text(
                'Fresh Items',
                style: TextStyle(fontSize: 16, color: jPrimaryLightColor),
              ),
            ),
            // Grid viwe of items
            ///[itemPicture, itemName, itemPrice, color]
            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.shopItems.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: .8),
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                        itemImage: value.shopItems[index][2],
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        color: value.shopItems[index][3],
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false).addItemToCart(index);
                        },
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
