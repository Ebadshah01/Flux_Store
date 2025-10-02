import 'package:flutter/material.dart';
import 'package:fluxstore/view/screens/home_screen/sub_screen/feature_screen_detail.dart/feature_sub/checkout_content/location_model.dart';
import 'package:fluxstore/themecolor/themecolor.dart';
import 'package:fluxstore/view/bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:fluxstore/view/screens/home_screen/sub_screen/feature_screen_detail.dart/feature_sub/order_complete.dart';
import 'package:fluxstore/view/screens/home_screen/sub_screen/feature_screen_detail.dart/feature_sub/payment_method.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      setState(() {
        _currentPage++;
      });
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavbar()),(route)=>false
      );
    }
  }

  Widget _buildIndicator(int index) {
    final icon = switch (index) {
      0 => Icons.location_on_outlined,
      1 => Icons.payment_outlined,
      2 => Icons.check_circle_outline,
      _ => Icons.circle,
    };
    return Icon(
      icon,
      color: _currentPage >= index ? Colors.black : Colors.grey,
      size: 35,
    );
  }

  @override
  Widget build(BuildContext context) {
    final onboardingPages = [
      const Center(child: LocationContent()),
      const Center(child: PaymentMethod()),
      const Center(child: OrderComplete()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("CheckOut"),
        centerTitle: true,
        backgroundColor: whitethemecolor,
        surfaceTintColor: whitethemecolor,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIndicator(0),
              const Text(".  .   .   .    .  ", style: TextStyle(fontSize: 25)),
              _buildIndicator(1),
              const Text(".  .   .    .   .  ", style: TextStyle(fontSize: 25)),
              _buildIndicator(2),
            ],
          ),
          const SizedBox(height: 40),
          Expanded(child: onboardingPages[_currentPage]),
        ],
      ),
     bottomNavigationBar: Padding(
  padding: const EdgeInsets.all(16.0),
  child: GestureDetector(
    onTap: _nextPage, // 👈 same function call
    child: Container(
      height: 50,
      decoration: BoxDecoration(
        color: themeprimarycolor, // 👈 apna theme color rakh lo
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          _currentPage < 2 ? 'Continue to Payment' : 'Continue Shopping',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ),
),

    );
  }
}
