import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/molecules/backward_arrow.dart';
import 'package:fluxstore/themecolor/themecolor.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int selectedStars = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whitethemecolor,
        surfaceTintColor: whitethemecolor,
        leading: BackwardArrow(),
        title: Text(
          "Share your feedback",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: whitethemecolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            10.kh,
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) {
                  int starIndex = index + 1;
                  bool isSelected = selectedStars >= starIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedStars = starIndex;
                      });
                    },
                    child: Icon(
                      Icons.star,
                      size: 35,
                      color: isSelected ? blackthemecolor : greythemecolor,
                    ),
                  );
                }),
              ),
            ),
            20.kh,
            Container(
              decoration: BoxDecoration(
                color: whitethemecolor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 1,
                    offset: Offset(1, 1),
                    blurRadius: 15,
                    // ignore: deprecated_member_use
                    color: blackthemecolor.withOpacity(0.1),
                  ),
                ],
              ),
              child: TextField(
                maxLines: 7,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  border: InputBorder.none,
                  hintText:
                      "Would you like to write anything about this product? ",
                  hintStyle: TextStyle(color: greythemecolor),
                ),
              ),
            ),
            20.kh,
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: whitethemecolor,
                    border: Border.all(color: greythemecolor),
                  ),
                  child: Icon(
                    Icons.photo_camera_back_outlined,
                    color: greythemecolor,
                  ),
                ),
                10.kw,
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: whitethemecolor,
                    border: Border.all(color: greythemecolor),
                  ),
                  child: Icon(Icons.camera_alt_outlined, color: greythemecolor),
                ),
              ],
            ),
            40.kh,
            Container(
              height: 40,
              constraints: BoxConstraints(maxWidth: 150),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: themeprimarycolor,
              ),
              child: Center(
                child: Text(
                  "Send FeedBack",
                  style: TextStyle(
                    fontSize: 16,
                    color: whitethemecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
