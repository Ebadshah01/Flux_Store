import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/molecules/backward_arrow.dart';
import 'package:fluxstore/themecolor/themecolor.dart';
import 'package:fluxstore/view/screens/home_screen/home_screen.dart';

class AutumCollection extends StatefulWidget {
  const AutumCollection({super.key});

  @override
  State<AutumCollection> createState() => _AutumCollectionState();
}

class _AutumCollectionState extends State<AutumCollection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitethemecolor,
      body: Stack(
        children: [
          
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Mask Group.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
         
          Positioned(
            left: 10,
            top: 20,
            child: BackwardArrow()),
           Positioned(
            right: 20,
            top: 40,
            child:  Text(
               "Autumn\nCollection\n2022",
               style: TextStyle(
                 fontSize: 22,
                 fontWeight: FontWeight.bold,
                 color: whitethemecolor,
               ),
             ),),
          
          Padding(
            padding: const EdgeInsets.only(top: 230),
            child: Stack(
  children: [
    // 👇 Ye tumhara main white container
    Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: whitethemecolor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  20.kh,
                  customContainer(
                    imglink: "assets/image 78 (1).png",
                    context: context,
                    width: 160,
                  ),
                 // 10.kh,
                  customContainer(
                    imglink: "assets/image 94.png",
                    context: context,
                    width: 160,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  customContainer(
                    imglink: "assets/image 78.png",
                    context: context,
                    width: 160,
                  ),
                //b  10.kh,
                  customContainer(
                    imglink: "assets/image 95.png",
                    context: context,
                    width: 160,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),

    // 👇 Ye tumhara chhota wala container bilkul bottom-left me
    Positioned(
      bottom: 10,
      right: 0,
      // 👈 is se koi padding ka effect nahi hoga
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          color: themeprimarycolor,
        ),
        child: Center(child: Text("View All",style: TextStyle(fontSize: 16,color: whitethemecolor),)),
      ),
    ),
  ],
)
       ),
        ],
      ),
    );
  }
}
