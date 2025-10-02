import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/themecolor/themecolor.dart';
import 'package:fluxstore/view/auth/login_screeens/signin.dart';
import 'package:fluxstore/molecules/widgets/custom_textfield.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _pass = true;

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
                "Create new password",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: context.screenHeight * 0.03),
              Text(
                "Your new password must be different from previously used password",
                style: TextStyle(fontSize: 15),
                maxLines: 2,
              ),
              SizedBox(height: context.screenHeight * 0.1),
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
              SizedBox(height: context.screenHeight * 0.03),
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
              SizedBox(height: context.screenHeight * 0.1),
              Center(
                child: GestureDetector(
                  onTap: () {
                    _showBottomSheet(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: themeprimarycolor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(
                        "Confirm",
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
            ],
          ),
        ),
      ),
    );
  }

  /// Show Bottom Sheet Function
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: whitethemecolor,
      builder: (_) {
        return Container(
          padding: EdgeInsets.all(20),
          height: context.screenHeight * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: context.screenHeight * 0.1,
                width: context.screenWidth * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6P24PaSSS8XAdY-ERio3fvNlL5mmiv5njlw&s",
                    ),
                  ),
                ),
              ),
              Text(
                "Password Changed!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text("Your password has been updated successfully."),
              SizedBox(height: 30),
              _bottomSheetButton(
                context: context,
                text: "Done",
                icon: Icons.check,
                filled: true,
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Signin()),
                    (route) => false,
                  ); // Close bottom sheet
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Custom Reusable Bottom Sheet Button Widget
Widget _bottomSheetButton({
  required String text,
  required IconData icon,
  required bool filled,
  required VoidCallback onTap,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: context.screenHeight * 0.06,
      width: context.screenHeight * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: filled ? themeprimarycolor : null,
        border: filled ? null : Border.all(color: themeprimarycolor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: filled ? whitethemecolor : themeprimarycolor,
            size: 20,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: filled ? whitethemecolor : themeprimarycolor,
              fontWeight: filled ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    ),
  );
}
