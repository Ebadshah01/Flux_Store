import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/molecules/backward_arrow.dart';
import 'package:fluxstore/themecolor/themecolor.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitethemecolor,
      appBar: AppBar(
        backgroundColor: whitethemecolor,
        surfaceTintColor: whitethemecolor,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: (BackwardArrow()),
        ),
        title: Text(
          "Notification",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                width: double.infinity,
        
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whitethemecolor,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      offset: Offset(1, 1),
                      blurRadius: 5,
                      // ignore: deprecated_member_use
                      color: blackthemecolor.withOpacity(0.1),
                    ),
                  ],
                ),
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good morning! Get 20% Voucher",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        10.kh,
                        Text(
                          "Summer sale up to 20% off. Limited voucher. Get now!! 😜",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              10.kh,
              Container(
                width: double.infinity,
        
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whitethemecolor,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      offset: Offset(1, 1),
                      blurRadius: 5,
                      // ignore: deprecated_member_use
                      color: blackthemecolor.withOpacity(0.1),
                    ),
                  ],
                ),
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Special offer just for you",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        10.kh,
                        Text(
                          "New Autumn Collection 30% off",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              10.kh,
              Container(
                width: double.infinity,
        
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whitethemecolor,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      offset: Offset(1, 1),
                      blurRadius: 5,
                      // ignore: deprecated_member_use
                      color: blackthemecolor.withOpacity(0.1),
                    ),
                  ],
                ),
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Holiday sale 50%",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        10.kh,
                        Text(
                          "Tap here to get 50% voucher.",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
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

Widget customNotificationIcon({required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NotificationScreen()),
      );
    },
    child: Icon(Icons.notifications),
  );
}
