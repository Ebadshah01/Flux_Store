import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/themecolor/themecolor.dart';

class ShippingModel {
  final String address;
  final String days;
  final String price;

  ShippingModel({
    required this.address,
    required this.days,
    required this.price,
  });
}

final List<ShippingModel> shippingModellist = [
  ShippingModel(
    address: "Delivery to home",
    days: "Delivery from 6 to 10 business days",
    price: "Free",
  ),
  ShippingModel(
    address: "Delivery to home",
    days: "Delivery from 4 to 6 business days",
    price: "\$ 9.90",
  ),
  ShippingModel(
    address: "Fast Delivery",
    days: "Delivery from 1 to 3 business days",
    price: "\$ 9.90",
  ),
];

class ShippingCategory extends StatefulWidget {
  const ShippingCategory({super.key});

  @override
  State<ShippingCategory> createState() => _ShippingCategoryState();
}

class _ShippingCategoryState extends State<ShippingCategory> {
  int selectedIndex = -1; // -1 means nothing selected

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      primary: false,
      itemCount: shippingModellist.length,
      itemBuilder: (context, index) {
        bool isSelected = selectedIndex == index;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: greythemecolor),
            10.kh,
            InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: isSelected ? greythemecolor : greenthemecolor,
                        ),
                        color: isSelected ? Colors.green : Colors.white,
                      ),
                    ),
                    10.kw,
                    Text(
                      shippingModellist[index].price,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    10.kw,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shippingModellist[index].address,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: greythemecolor,
                          ),
                        ),
                        10.kh,
                        Text(
                          shippingModellist[index].days,
                          style: TextStyle(fontSize: 16, color: greythemecolor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
