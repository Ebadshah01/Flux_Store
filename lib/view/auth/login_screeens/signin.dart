import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/provider/signin_provider.dart'; // 👈 provider import
import 'package:fluxstore/themecolor/themecolor.dart';
import 'package:fluxstore/view/auth/forgot_screens/forgot_screen.dart';
import 'package:fluxstore/view/auth/login_screeens/signup.dart';
import 'package:fluxstore/view/bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:fluxstore/molecules/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool _pass = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //  bool signIn = false; // ❌ ab provider handle karega (commented)

  @override
  void initState() {
    super.initState();

    // 👇 yeh listeners text field ke changes ko provider tak bhejte hain
    emailController.addListener(() {
      context.read<SigninProvider>().updateEmail(emailController.text);
    });
    passwordController.addListener(() {
      context.read<SigninProvider>().updatePassword(passwordController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final signinProvider = context.watch<SigninProvider>(); // 👈 sahi tarika

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: context.screenHeight * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Don’t have an account?", style: TextStyle(fontSize: 16)),
            5.kw,

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                  child: Text("Sign Up", style: TextStyle(fontSize: 16)),
                ),
                Container(height: 2, width: 60, color: blackthemecolor),
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
              children: [
                SizedBox(height: context.screenHeight * 0.1),

                Text(
                  "log into\nyour account",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                20.kh,
                CustomTextField(
                  context: context,
                  textFieldController: emailController,
                  hint: "Emial Address",
                  icon: Icons.email,
                ),
                10.kh,
                CustomTextField(
                  context: context,
                  hint: "Password",
                  icon: Icons.lock,
                  isPassword: true,
                  textFieldController: passwordController,

                  obscure: _pass,
                  onToggle: () {
                    setState(() {
                      _pass = !_pass;
                    });
                  },
                ),
                10.kh,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                20.kh,
                Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // if (signIn) { ❌ purana condition
                          if (signinProvider.canSignIn) {
                            // 👈 naya condition
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNavbar(),
                              ),
                            );
                          } else {
                            // ignore: avoid_print
                            print("Fields are empty"); // 👈 better message
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            // color: signIn ? themeprimarycolor : greythemecolor, ❌
                            color:
                                signinProvider.canSignIn
                                    ? themeprimarycolor
                                    : greythemecolor, // 👈 ab provider handle karega
                            borderRadius: BorderRadius.circular(20),
                          ),

                          //height: context.screenHeight*0.04,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Center(
                              child: Text(
                                // signIn ? "Sign In" : "Sign In", ❌ dono same thay
                                "Sign In", // 👈 simple rakha
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
