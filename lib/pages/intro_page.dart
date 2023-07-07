import 'package:flutter/material.dart';
import 'package:grocery_store_app/constants/colors.dart';
import 'package:grocery_store_app/constants/sizes.dart';
import 'package:grocery_store_app/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: jScafoldLightColor,
        body: Column(
          children: [
            // intro Image
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Image.asset('assets/images/intro.png'),
            ),
            //Weldome text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: jPadding40, vertical: jPadding25),
              child: Text(
                'We deliver groceries at your doorstep',
                style: TextStyle(fontSize: 40, color: jPrimaryLightColor),
                textAlign: TextAlign.center,
              ),
            ),
            // welcome label
            const Padding(
              padding: EdgeInsets.all(jPadding25),
              child: Text(
                'Fresh items everyday',
                style: TextStyle(fontSize: 16, color: jPrimaryLightColor),
              ),
            ),
            // Get started button
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  )),
              child: Container(
                padding: const EdgeInsets.all(jPadding25),
                decoration: BoxDecoration(color: jPrimaryLightColor, borderRadius: BorderRadius.circular(jBorderRadius)),
                child: const Text(
                  'Get started!',
                  style: TextStyle(color: jLinkLightColor, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
