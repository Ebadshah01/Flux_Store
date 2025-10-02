import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluxstore/view/screens/welcome_screen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen(),
      
        ),
        (route)=>false
      );
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image(image: AssetImage("assets/ChatGPT Image Aug 8, 2025, 01_51_56 AM.png"),fit: BoxFit.cover,),
      ),
    );
  }
}