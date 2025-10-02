import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/on_boarding_screen/on_boarding_screen.dart';
import 'package:fluxstore/themecolor/themecolor.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Untitled.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Welcome to GemStore!",
              style: TextStyle(
                fontSize: 22,
                color: whitethemecolor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              " The home for a fashionista",
              style: TextStyle(
                fontSize: 18,
                color: whitethemecolor,
                // fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: context.screenHeight * 0.05),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => OnBoarding()),
                  (route) => false,
                );
              },
              child: Container(
                // height: context.screenHeight * 0.06,
                //  width: context.screenWidth * 0.3,
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: greythemecolor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: whitethemecolor, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 20,
                      color: whitethemecolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: context.screenHeight * 0.15),
          ],
        ),
      ),
    );
  }
}
