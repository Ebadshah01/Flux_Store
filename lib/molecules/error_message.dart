
import 'package:flutter/material.dart';
import 'package:fluxstore/themecolor/themecolor.dart';

// ignore: non_constant_identifier_names
ErrorMessage(context, String errorMessage, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        errorMessage,
        style: const TextStyle(
          fontWeight: FontWeight.bold,color: whitethemecolor
        ),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 3),
    ),
  );
}
