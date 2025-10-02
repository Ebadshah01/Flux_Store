import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/model/cart_model/cart_model.dart';
import 'package:fluxstore/molecules/backward_arrow.dart';
import 'package:fluxstore/molecules/custom_title_row/custom_title_row.dart';
import 'package:fluxstore/themecolor/themecolor.dart';
import 'package:fluxstore/view/screens/home_screen/sub_screen/feature_screen_detail.dart/feature_sub/check_out.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Initialize a list of booleans to track checkbox states for each cart item
  final List<bool> _isCheckedList = List.generate(
    cartModellist.length,
    (index) => false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            color: whitethemecolor,
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(1, 1),
                // ignore: deprecated_member_use
                color: blackthemecolor.withOpacity(0.3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                10.kh,
                CustomTitleRow(
                  title: "Product Price",
                  titleSize: 18,
                  actionSize: 18,
                  titleColor: greythemecolor,
                  actionText: "\$110",
                  actionColor: blackthemecolor,
                ),
                Divider(),
                10.kh,

                CustomTitleRow(
                  titleSize: 18,
                  actionSize: 18,
                  title: "Shipping",
                  titleColor: greythemecolor,
                  actionText: "Freeship",
                  actionColor: blackthemecolor,
                ),
                Divider(),
                10.kh,
                CustomTitleRow(
                  titleSize: 18,
                  actionSize: 18,
                  title: "Subtotal",
                  actionText: "\$110",
                  actionColor: blackthemecolor,
                ),
                20.kh,
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>CheckOutScreen()));
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: themeprimarycolor,
                    ),
                    child: Center(
                      child: Text(
                        "Proceed to checkout",
                        style: TextStyle(
                          fontSize: 18,
                          color: whitethemecolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: whitethemecolor,
      appBar: AppBar(
        backgroundColor: whitethemecolor,
        surfaceTintColor: whitethemecolor,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: BackwardArrow(),
        ),
        title: Text(
          "Your Cart",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(children: [cartContainerModel(context: context)]),
      ),
    );
  }

  // Updated widget to handle checkboxes for each item
  Widget cartContainerModel({required BuildContext context}) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: cartModellist.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Container(
            constraints: BoxConstraints(minHeight: 100),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
            child: Row(
              children: [
                Container(
                  constraints: BoxConstraints(minHeight: 80),
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: AssetImage(cartModellist[index].imglink),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                10.kw,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartModellist[index].text,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cartModellist[index].price,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      5.kh,
                      Row(
                        children: [
                          Text(
                            "Size",
                            style: TextStyle(
                              fontSize: 12,
                              color: greythemecolor,
                            ),
                          ),
                          5.kw,
                          Text(
                            cartModellist[index].size,
                            style: TextStyle(
                              fontSize: 12,
                              color: greythemecolor,
                            ),
                          ),
                          5.kw,
                          Container(
                            height: 15,
                            width: 2,
                            color: greythemecolor,
                          ),
                          5.kw,
                          Text(
                            "Color",
                            style: TextStyle(
                              fontSize: 12,
                              color: greythemecolor,
                            ),
                          ),
                          5.kw,
                          Text(
                            cartModellist[index].color,
                            style: TextStyle(
                              fontSize: 12,
                              color: greythemecolor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Checkbox(
                      activeColor: greenthemecolor,
                      checkColor: whitethemecolor,
                      value:
                          _isCheckedList[index], // Use the list to check/uncheck the item
                      onChanged: (newValue) {
                        setState(() {
                          _isCheckedList[index] =
                              newValue!; // Update the state for the clicked checkbox
                        });
                      },
                    ),
                    Container(
                      height: 20,
                      width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: greythemecolor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "-  1  +",
                          style: TextStyle(
                            color: greythemecolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                5.kw,
              ],
            ),
          ),
        );
      },
    );
  }
}


// class _CartScreenState extends State<CartScreen> {
 
//   // Initialize a list of booleans to track checkbox states for each cart item
//   List<bool> _isCheckedList = List.generate(cartModellist.length, (index) => false);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(top: 5),
//         child: Container(
//           height: 250,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: whitethemecolor,
//             boxShadow: [
//               BoxShadow(
//                 spreadRadius: 1,
//                 blurRadius: 5,
//                 offset: Offset(1, 1),
//                 // ignore: deprecated_member_use
//                 color: blackthemecolor.withOpacity(0.3),
//               ),
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: whitethemecolor,
//       appBar: AppBar(
//         backgroundColor: whitethemecolor,
//         surfaceTintColor: whitethemecolor,
//         leading: Padding(
//           padding: const EdgeInsets.all(4.0),
//           child: BackwardArrow(),
//         ),
//         title: Text(
//           "Your Cart",
//           style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: ListView(children: [cartContainerModel(context: context)]),
//       ),
//     );
//   }
// }


// //  Widget cartContainerModel({required BuildContext context
// //  ,}) {
// //   return ListView.builder(
// //     shrinkWrap: true,
// //     primary: false,
// //     itemCount: cartModellist.length,
// //     itemBuilder: (context, index) {
// //       return Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
// //         child: Container(
// //           constraints: BoxConstraints(minHeight: 80),

// //           width: double.infinity,
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(10),
// //             color: whitethemecolor,
// //             boxShadow: [
// //               BoxShadow(
// //                 spreadRadius: 1,
// //                 blurRadius: 2,
// //                 offset: Offset(1, 1),
// //                 // ignore: deprecated_member_use
// //                 color: blackthemecolor.withOpacity(0.1),
// //               ),
// //             ],
// //           ),
// //           child: Row(
// //             children: [
// //               Container(
// //                 constraints: BoxConstraints(minHeight: 80),
// //                 width: 80,
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.only(
// //                     topLeft: Radius.circular(10),
// //                     bottomLeft: Radius.circular(10),
// //                   ),
// //                   image: DecorationImage(
// //                     image: AssetImage(cartModellist[index].imglink),
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //               ),
// //               10.kw,
// //               Expanded(
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       cartModellist[index].text,
// //                       style: TextStyle(
// //                         fontSize: 14,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     Text(
// //                       cartModellist[index].price,
// //                       style: TextStyle(
// //                         fontSize: 14,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     5.kh,
// //                     Row(
// //                       children: [
// //                         Text(
// //                           "Size",
// //                           style: TextStyle(fontSize: 12, color: greythemecolor),
// //                         ),
// //                         5.kw,
// //                         Text(
// //                           cartModellist[index].size,
// //                           style: TextStyle(fontSize: 12, color: greythemecolor),
// //                         ),
// //                         5.kw,
// //                         Container(height: 15, width: 2, color: greythemecolor),
// //                         5.kw,
// //                         Text(
// //                           "Color",
// //                           style: TextStyle(fontSize: 12, color: greythemecolor),
// //                         ),
// //                         5.kw,
// //                         Text(
// //                           cartModellist[index].color,
// //                           style: TextStyle(fontSize: 12, color: greythemecolor),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),

// //               Column(
// //                 crossAxisAlignment: CrossAxisAlignment.end,
// //                 children: [
// //                    Checkbox(
// //                       activeColor: Colors.pink,
// //                       checkColor: Colors.white,
// //                       value: _isCheck,
// //                       onChanged: (newValue) {
// //                         setState(() {
// //                           _isCheck = newValue!;
// //                         });
// //                       }),
// //                   Container(
// //                     height: 20,
// //                     width: 60,
// //                     decoration: BoxDecoration(
// //                       border: Border.all(color: greythemecolor),
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                     child: Center(
// //                       child: Text(
// //                         "-  1  +",
// //                         style: TextStyle(
// //                           color: greythemecolor,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                     ),
// //                     //Row(
// //                     //   children: [

// //                     //   ],
// //                     // ),
// //                   ),
// //                 ],
// //               ),
// //               5.kw,
// //             ],
// //           ),
// //         ),
// //       );
// //     },
// //   );
// // }
