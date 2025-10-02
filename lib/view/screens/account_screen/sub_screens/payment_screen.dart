import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/molecules/backward_arrow.dart';
import 'package:fluxstore/molecules/custom_title_row/custom_title_row.dart';
import 'package:fluxstore/themecolor/themecolor.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitethemecolor,
      appBar: AppBar(
        backgroundColor: whitethemecolor,
        surfaceTintColor: whitethemecolor,
        leading: BackwardArrow(),
        title: Text(
          "Payment",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomTitleRow(
              title: "Choose Your Card",
              actionText: "Add New+",
              actionColor: redthemecolor,
            ),
          ),
          20.kh,
          SizedBox(
            height: 170,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  height: 150,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOYNrx1XknR9XY9KayG0HUmy8cUW2V8xevWg&s",
                      ),
                    ),
                    // DecorationImage(

                    //  // image: AssetImage("assets/Frame 33246.png"),
                    // //  fit: BoxFit.cover,
                    // ),
                  ),
                ),
                Container(
                  height: 150,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Group 33129.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: 300,
                  decoration: BoxDecoration(
                    image:
                   
                    DecorationImage(

                      image: AssetImage("assets/Frame 33246.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.kh,
                Text("OR Check out with"),
                20.kh,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(5, (index) {
                      List<String> images = [
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQp90k2dUI4xCE8pBY7RJVAH7EPGd3QUWkJng&s",
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlUAN0kXswy5XH6LYftvSoSBHnxZkOFi4YlA&s ",
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAu3LQtVLcr-XDVWzzSw3i-V0_fbzmBChhpA&s",
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUcGaPY7AFLDkIQM5ftCfLraA6vpyLxAMq4Q&s",
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVgdUVu-X4d1lp5CeWGUEIjHcq74wqYEYeDw&s",
                      ];

                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 1,
                                offset: Offset(1, 1),
                                blurRadius: 5,
                                // ignore: deprecated_member_use
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),

          //  PaymentMethod()
        ],
      ),
    );
  }
}
