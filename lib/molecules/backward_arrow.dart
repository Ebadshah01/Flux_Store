import 'package:flutter/material.dart';
import 'package:fluxstore/themecolor/themecolor.dart';

class BackwardArrow extends StatefulWidget {
  const BackwardArrow({super.key});

  @override
  State<BackwardArrow> createState() => _BackwardArrowState();
}

class _BackwardArrowState extends State<BackwardArrow> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.all(8.0),
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
                    blurRadius: 2,
                    offset: Offset(1, 1),
                    // ignore: deprecated_member_use
                    color: blackthemecolor.withOpacity(0.1),
                  ),
                ],
              ),
              child: Icon(Icons.arrow_back_ios_new,size: 20,),
            ),
          ),
        );
  }
}