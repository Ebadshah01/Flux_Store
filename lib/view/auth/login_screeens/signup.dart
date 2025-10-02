import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/themecolor/themecolor.dart';
import 'package:fluxstore/view/auth/login_screeens/signin.dart';
import 'package:fluxstore/view/bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:fluxstore/molecules/widgets/custom_textfield.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _pass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: context.screenHeight * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Already have  account?", style: TextStyle(fontSize: 16)),
            5.kw,

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signin()),
                    );
                  },
                  child: Text("Log In", style: TextStyle(fontSize: 16)),
                ),
                Container(height: 2, width: 55, color: blackthemecolor),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: whitethemecolor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: context.screenHeight * 0.06),

                Text(
                  "Create\nyour account",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                20.kh, // 20.kh,
                CustomTextField(
                  context: context,
                  hint: "Enter Your Name",
                  icon: Icons.person,
                ),
                10.kh,
                CustomTextField(
                  context: context,
                  hint: "Emial Address",
                  icon: Icons.email,
                ),
                10.kh,
                CustomTextField(
                  context: context,
                  hint: "Password",
                  icon: Icons.lock,
                  isPassword: true,
                  obscure: _pass,
                  onToggle: () {
                    setState(() {
                      _pass = !_pass;
                    });
                  },
                ),
                10.kh,
                CustomTextField(
                  context: context,
                  hint: "Confirm Password",
                  icon: Icons.lock,
                  isPassword: true,
                  obscure: _pass,
                  onToggle: () {
                    setState(() {
                      _pass = !_pass;
                    });
                  },
                ),
                20.kh,

                Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavbar(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            color: themeprimarycolor,
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: whitethemecolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      20.kh,
                      Text(
                        "or sign up with",
                        style: TextStyle(
                          fontSize: 16,
                          color: greythemecolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      20.kh,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          customIconButton(
                            context: context,
                            icon: Icons.apple,
                            color: blackthemecolor,
                          ),
                          customIconButton(
                            context: context,
                            icon: Icons.g_mobiledata,
                            color: redthemecolor,
                          ),
                          customIconButton(
                            context: context,
                            icon: Icons.facebook_outlined,
                            color: bluethemecolor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget customIconButton({
  required BuildContext context,
  required IconData icon,
  required Color color,
}) {
  return Container(
    height: 40,
    width: 40,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      //border: Border.all(),
      color: whitethemecolor,
      boxShadow: [
        BoxShadow(
          spreadRadius: 1,
          blurRadius: 10,
          offset: Offset(1, 1),
          // ignore: deprecated_member_use
          color: blackthemecolor.withOpacity(0.2),
        ),
      ],
    ),
    child: Icon(icon, size: 30, color: color),
  );
}
