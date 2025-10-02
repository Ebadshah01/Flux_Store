import 'package:flutter/material.dart';
import 'package:fluxstore/view/screens/home_screen/sub_screen/autum_collection.dart';

class CustomTitleRow extends StatelessWidget {
  final String title; // Left side text
  final String actionText; // Right side text (optional)
  final double titleSize; // Title ka font size
  final double actionSize; // Action text ka font size
  final Color titleColor; // Title ka color
  final Color actionColor; // Action text ka color

  const CustomTitleRow({
    super.key,
    required this.title,
    this.actionText = "",
    this.titleSize = 20,
    this.actionSize = 16,
    this.titleColor = Colors.black,
    this.actionColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: titleSize,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
        ),
        if (actionText.isNotEmpty)
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                (MaterialPageRoute(builder: (context) => AutumCollection())),
              );
            },
            child: Text(
              actionText,
              style: TextStyle(fontSize: actionSize, color: actionColor),
            ),
          ),
      ],
    );
  }
}

// CustomTitleRow(
//   title: "Featured Products",
//   actionText: "See All",
//   titleSize: 22,
//   actionSize: 14,
//   titleColor: Colors.black,
//   actionColor: Colors.blue,
// ),
