import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';

class OrderComplete extends StatefulWidget {
  const OrderComplete({super.key});

  @override
  State<OrderComplete> createState() => _OrderCompleteState();
}

class _OrderCompleteState extends State<OrderComplete> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          Text(
            "Order Completed",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          40.kh,
          Center(
            child: Column(
              children: [
                Icon(Icons.shopping_cart_checkout_sharp, size: 150),
                20.kh,
                Text(
                  "Thank you for your purchase.You can view your order in ‘My Orders’ section.",
                  style: TextStyle(fontSize: 16),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
