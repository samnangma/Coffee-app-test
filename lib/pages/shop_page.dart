import 'package:firstproject/components/coffee_tile.dart';
import 'package:firstproject/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add coffee to cart
  void addToCart(Coffee coffee){


    // add to cart
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    // let user know it add been successfully added
    showDialog(context: context, builder: (context) => const AlertDialog(
      title: Text("Successfully add to cart"),
    ),);

  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder: (context, value, child) =>
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("How would you like your coffee ? ",
                  style: TextStyle(fontSize: 20),),
                const SizedBox(height: 25),

                // list of coffee to buy
                Expanded(
                  child: ListView.builder(
                      itemCount: value.coffeeShop.length, // add the itemCount parameter
                      itemBuilder: (context, index) {

                  // get individual coffee
                    Coffee eachCoffee = value.coffeeShop[index];
                  // return the title for this coffee
                  return CoffeeTile(coffee: eachCoffee,
                    onPressed: () => addToCart(eachCoffee) ,
                    icon: Icon(Icons.delete),);
                }),
                ),

              ],
            ),
          ),

        ),
    );
  }

}
