import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/themecolor/themecolor.dart';
import 'package:fluxstore/view/auth/forgot_screens/verification_screen.dart';
import 'package:fluxstore/molecules/widgets/custom_textfield.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitethemecolor,
      appBar: AppBar(
        backgroundColor: whitethemecolor,
        surfaceTintColor: whitethemecolor,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whitethemecolor,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 1,
                    offset: Offset(1, 1),
                    blurRadius: 2,
                    // ignore: deprecated_member_use
                    color: blackthemecolor.withOpacity(0.1),
                  ),
                ],
              ),
              child: Icon(Icons.arrow_back_ios_new, size: 20),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.screenHeight * 0.06),
              Text(
                "Forgot Password",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: context.screenHeight * 0.03),
              Text(
                "Enter email associated with your account and we’ll send and email with intructions to reset your password",
                style: TextStyle(fontSize: 15),
                maxLines: 3,
              ),
              SizedBox(height: context.screenHeight * 0.1),
        
              CustomTextField(
                context: context,
                hint: "Enter Your Email here",
                icon: Icons.mail,
              ),
              SizedBox(height: context.screenHeight * 0.1),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerificationScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: context.screenHeight * 0.06,
                    width: context.screenWidth * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: themeprimarycolor,
                    ),
                    child: Center(
                      child: Text(
                        "Send Code",
                        style: TextStyle(
                          fontSize: 15,
                          color: whitethemecolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
