import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/themecolor/themecolor.dart';
import 'package:fluxstore/view/auth/forgot_screens/password_screen.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(fontSize: 22, color: themeprimarycolor),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(28),
    border: Border.all(color: greythemecolor, width: 2),
  ),
);
final focusedPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(fontSize: 22, color: themeprimarycolor),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(28),
    border: Border.all(color: blackthemecolor, width: 2),
  ),
);
final submittedPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(fontSize: 22, color: themeprimarycolor),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(28),
    border: Border.all(color: themeprimarycolor,width: 2),
  ),
);

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      backgroundColor: whitethemecolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: context.screenHeight * 0.06),
              Text(
                "Verification Code",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: context.screenHeight * 0.03),
              Text(
                "Please enter the verification code we sent to your email address",
                style: TextStyle(fontSize: 15),
                maxLines: 3,
              ),
              SizedBox(height: context.screenHeight * 0.1),
              Center(
                child: Pinput(
                  defaultPinTheme: defaultPinTheme,
                  length: 4,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  onCompleted:
                      (value) => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PasswordScreen(),
                          ),
                        ),
                      },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
