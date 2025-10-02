import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/model/account_models/address_model.dart';
import 'package:fluxstore/molecules/backward_arrow.dart';
import 'package:fluxstore/themecolor/themecolor.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitethemecolor,
      appBar: AppBar(
        backgroundColor: whitethemecolor,
        surfaceTintColor: whitethemecolor,
        leading: BackwardArrow(),
        title: Text(
          "Delivery Address",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            20.kh,
            _addressModelItems(
              context: context,
              currentIndex: currentIndex,
              onCategoryTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),

            50.kh,
            Flexible(
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: themeprimarycolor,
                ),
                child: Center(
                  child: Text(
                    "Add new Address",
                    style: TextStyle(fontSize: 16, color: whitethemecolor),
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

Widget _addressModelItems({
  required BuildContext context,
  required int currentIndex,
  required Function(int) onCategoryTap,
}) {
  return ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    primary: false,
    itemCount: addresslist.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: whitethemecolor,
            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                offset: Offset(1, 1),
                blurRadius: 2,
                // ignore: deprecated_member_use
                color: blackthemecolor.withOpacity(0.1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        onCategoryTap(index);
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: themeprimarycolor),
                          color:
                              currentIndex == index
                                  ? themeprimarycolor
                                  : whitethemecolor,
                        ),
                      ),
                      //  CircleAvatar(
                      //   radius: 16,
                      //   backgroundColor:
                      //       currentIndex == index
                      //           ? themeprimarycolor
                      //           // ignore: deprecated_member_use
                      //           : greythemecolor.withOpacity(0.2),
                      // ),
                    ),
                    10.kw,
                    Icon(
                      addresslist[index].icon,
                      size: 50,
                      color: greythemecolor,
                    ),
                    10.kw,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Send to",
                          style: TextStyle(fontSize: 16, color: greythemecolor),
                        ),
                        Text(
                          addresslist[index].title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      "Edit",
                      style: TextStyle(
                        fontSize: 16,
                        color: redthemecolor,
                        decoration: TextDecoration.underline,
                        decorationColor: redthemecolor,
                        decorationThickness: 2,
                      ),
                    ),
                  ],
                ),
                10.kh,
                Text(
                  "SBI Building, street 3, Software Park",
                  style: TextStyle(fontSize: 16, color: greythemecolor),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
