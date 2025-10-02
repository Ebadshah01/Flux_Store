import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/model/checkout_model/shipping_model/shipping_model.dart';
import 'package:fluxstore/molecules/widgets/custom_textfield.dart';
import 'package:fluxstore/themecolor/themecolor.dart';

class LocationContent extends StatefulWidget {
  const LocationContent({super.key});

  @override
  State<LocationContent> createState() => _LocationContentState();
}

class _LocationContentState extends State<LocationContent> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Step 1",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            20.kh,
            const Text(
              "Shipping",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            CustomTextField(context: context, hint: "First Name *"),
            20.kh,
            CustomTextField(context: context, hint: "Country *"),
            20.kh,
            CustomTextField(context: context, hint: "Street Name *"),
            20.kh,
            CustomTextField(context: context, hint: "City *"),
            20.kh,
            CustomTextField(context: context, hint: "Sate/Province *"),
            20.kh,
            CustomTextField(context: context, hint: "Zip Code *"),
            20.kh,
            CustomTextField(context: context, hint: "Phone Number *"),
            20.kh,
            Text(
              "Shipping Method",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            // RadioListTile(value: value, groupValue: groupValue, onChanged: onChanged)
            ShippingCategory(),
            20.kh,
            Text(
              "Coupon Code",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),10.kh,
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Have a code? type it here...",
                          hintStyle: TextStyle(color: greythemecolor),
                        ),
                      ),
                    ),
                    Spacer(),
                    Text("Validate", style: TextStyle(color: greenthemecolor,fontSize: 16)),
                  ],
                ),
              ),
            ),
              20.kh,
            Text(
              "Billing Address",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),10.kh,
            Row(
              children: [
                Checkbox(value: isChecked, onChanged: (bool ? value) {
                  setState(() {
                    isChecked = value ?? false;
                    
                  });
                  
                  
                },
                activeColor: greenthemecolor,
                checkColor: whitethemecolor,),10.kw,
                Text("Copy address data from shipping",style: TextStyle(fontSize: 16,color: greythemecolor),)
              ],
            )
            
          ],
        ),
      ),
    );
  
  }
}


// import 'package:flutter/material.dart';
// import 'package:fluxstore/const/sizedbox.dart';
// import 'package:fluxstore/model/shipping_model/shipping_model.dart';
// import 'package:fluxstore/molecules/widgets/custom_textfield.dart';
// import 'package:fluxstore/themecolor/themecolor.dart';

// class LocationContent extends StatelessWidget {
//   const LocationContent();
  

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const Text(
//               "Step 1",
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             20.kh,
//             const Text(
//               "Shipping",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             CustomTextField(context: context, hint: "First Name *"),
//             20.kh,
//             CustomTextField(context: context, hint: "Country *"),
//             20.kh,
//             CustomTextField(context: context, hint: "Street Name *"),
//             20.kh,
//             CustomTextField(context: context, hint: "City *"),
//             20.kh,
//             CustomTextField(context: context, hint: "Sate/Province *"),
//             20.kh,
//             CustomTextField(context: context, hint: "Zip Code *"),
//             20.kh,
//             CustomTextField(context: context, hint: "Phone Number *"),
//             20.kh,
//             Text(
//               "Shipping Method",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),

//             // RadioListTile(value: value, groupValue: groupValue, onChanged: onChanged)
//             ShippingCategory(),
//             20.kh,
//             Text(
//               "Coupon Code",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),10.kh,
//             Container(
//               height: 60,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.grey.shade300,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Have a code? type it here...",
//                           hintStyle: TextStyle(color: greythemecolor),
//                         ),
//                       ),
//                     ),
//                     Spacer(),
//                     Text("Validate", style: TextStyle(color: greenthemecolor,fontSize: 16)),
//                   ],
//                 ),
//               ),
//             ),
//               20.kh,
//             Text(
//               "Billing Address",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),10.kh,
//             Checkbox(value: value, onChanged: onChanged)
            
//           ],
//         ),
//       ),
//     );
//   }
// }
