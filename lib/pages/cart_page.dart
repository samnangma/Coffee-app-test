import 'package:firstproject/components/coffee_tile.dart';
import 'package:firstproject/models/coffee.dart';
import 'package:firstproject/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee){
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder: (Context, value , child) =>SafeArea(child: Padding(
      padding:  const EdgeInsets.all(25.0),
      child: Column(
        children: [
          // heading
          Text('Your cart',
              style: TextStyle(fontSize: 20)),

          // list of cart
          Expanded(child: ListView.builder(
              itemCount: value.userCart.length,
              itemBuilder: (context, index) {
            // get individual coffee
            Coffee eachCoffee = value.userCart[index];

            // return coffee title 
              return CoffeeTile(coffee: eachCoffee, onPressed: () => removeFromCart(eachCoffee), icon: Icon(Icons.delete),);
          }),
          ),
          // pay button
          Container(
            child: Text('Pay Now ',
            style: TextStyle(color: Colors.white)),
            decoration: BoxDecoration(color: Colors.brown ),
          )
        ],
      ),
    ),
    ),
    );
  }
}
