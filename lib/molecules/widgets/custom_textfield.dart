import 'package:flutter/material.dart';
import 'package:fluxstore/themecolor/themecolor.dart';

class CustomTextField extends StatelessWidget {
  final BuildContext context;
  final String hint;
  final IconData? icon; // Nullable icon
  final bool isPassword;
  final bool obscure;
  final VoidCallback? onToggle;

  final TextEditingController? textFieldController;

  const CustomTextField({
    super.key,
    required this.context,
    required this.hint,
    this.icon, // optional icon
    this.isPassword = false,
    this.obscure = true,
    this.onToggle,
    this.textFieldController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextField(
        obscureText: isPassword ? obscure : false,

        controller: textFieldController,
        decoration: InputDecoration(
          prefixIcon: icon != null ? Icon(icon, color: greythemecolor) : null,
          suffixIcon:
              isPassword
                  ? GestureDetector(
                    onTap: onToggle,
                    child: Icon(
                      obscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,
                      color: greythemecolor,
                    ),
                  )
                  : null,
          hintText: hint,
          hintStyle: TextStyle(color: greythemecolor, fontSize: 16),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: greythemecolor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: blackthemecolor, width: 2),
          ),
        ),
      ),
    );
  }
}
