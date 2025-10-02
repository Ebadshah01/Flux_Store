import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/molecules/custom_title_row/custom_title_row.dart';
import 'package:fluxstore/themecolor/themecolor.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  bool isChecked = false;
  int selectedIndex = -1; // -1 means nothing selected

  @override
  Widget build(BuildContext context) {
    // Labels aur Icons
    List<String> labels = ["Cash", "Card", "Other"];
    List<IconData> icons = [Icons.money, Icons.credit_card, Icons.more_horiz];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Step 2",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            20.kh,
            const Text(
              "Payment",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            20.kh,

            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: List.generate(3, (index) {
                bool isSelected = selectedIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    height: 70,
                    width: 90,
                    decoration: BoxDecoration(
                      color: isSelected ? themeprimarycolor : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icons[index],
                          size: 30,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                        SizedBox(height: 8),
                        Text(
                          labels[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            10.kh,
            CustomTitleRow(
              title: "Choose Your Card",
              actionText: "Add New+",
              actionColor: redthemecolor,
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
            Text("OR Check out with"),
            10.kh,
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
            20.kh,
            CustomTitleRow(
              title: "Product Price",
              titleSize: 18,
              actionSize: 18,
              titleColor: greythemecolor,
              actionText: "\$110",
              actionColor: blackthemecolor,
            ),
            Divider(color: greythemecolor,),
            10.kh,

            CustomTitleRow(
              titleSize: 18,
              actionSize: 18,
              title: "Shipping",
              titleColor: greythemecolor,
              actionText: "Freeship",
              actionColor: blackthemecolor,
            ),
            Divider(color: greythemecolor,),
            10.kh,
            CustomTitleRow(
              titleSize: 18,
              actionSize: 18,
              title: "Subtotal",
              actionText: "\$110",
              actionColor: blackthemecolor,
            ),
            20.kh,
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                  activeColor: greenthemecolor,
                  checkColor: whitethemecolor,
                ),
                10.kw,
                Text(
                  "I agree to Terms and conditions",
                  style: TextStyle(
                    fontSize: 16,
                    color: greythemecolor,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
