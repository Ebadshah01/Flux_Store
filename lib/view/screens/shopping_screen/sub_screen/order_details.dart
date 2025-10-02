import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/model/shopping_models/order_model.dart';
import 'package:fluxstore/molecules/backward_arrow.dart';
import 'package:fluxstore/molecules/custom_title_row/custom_title_row.dart';
import 'package:fluxstore/themecolor/themecolor.dart';
import 'package:fluxstore/view/bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:fluxstore/view/screens/shopping_screen/sub_screen/rating_screen.dart';

class OrderDetails extends StatefulWidget {
  final OrderModel orderList;
  const OrderDetails({super.key, required this.orderList});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitethemecolor,
      appBar: AppBar(
        backgroundColor: whitethemecolor,
        surfaceTintColor: whitethemecolor,
        leading: BackwardArrow(),
        title: Text(
          widget.orderList.orderNO,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            10.kh,
            Container(
              constraints: const BoxConstraints(minHeight: 80),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: themeprimarycolor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Your Order is ${widget.orderList.status}", // 👈 dynamic
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: whitethemecolor,
                            ),
                          ),
                          if (widget.orderList.status == "Delivered")
                            Text(
                              "Rate product to get 5 points for collect.",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: whitethemecolor,
                              ),
                            ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
            10.kh,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: whitethemecolor,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    offset: Offset(1, 1),
                    blurRadius: 5,
                    // ignore: deprecated_member_use
                    color: blackthemecolor.withOpacity(0.2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    CustomTitleRow(
                      title: "Order Number",
                      titleColor: greythemecolor,
                      titleSize: 14,
                      actionText: widget.orderList.orderNO,
                      actionColor: blackthemecolor,
                      actionSize: 14,
                    ),
                    Divider(),
                    10.kh,
                    CustomTitleRow(
                      title: "Tracking Number",
                      titleColor: greythemecolor,
                      titleSize: 14,
                      actionText: widget.orderList.trackingNO,
                      actionColor: blackthemecolor,
                      actionSize: 14,
                    ),
                    Divider(),
                    10.kh,
                    CustomTitleRow(
                      title: "Delivery Addres",
                      titleColor: greythemecolor,
                      titleSize: 14,
                      actionText: "SBI Building, Software Park",
                      actionColor: blackthemecolor,
                      actionSize: 14,
                    ),
                  ],
                ),
              ),
            ),
            30.kh,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => BottomNavbar()),
                      (route) => false,
                    );
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNavbar()),
                        (route) => false,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: greythemecolor),
                        color: whitethemecolor,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          child: Text(
                            "Return Home",
                            style: TextStyle(
                              fontSize: 14,
                              color: greythemecolor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RatingScreen()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: themeprimarycolor),
                      color: themeprimarycolor,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        child: Text(
                          "Rate",
                          style: TextStyle(
                            fontSize: 14,
                            color: whitethemecolor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
