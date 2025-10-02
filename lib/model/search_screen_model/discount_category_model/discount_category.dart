import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';

class DiscountCategory {
  final String namecat;

  DiscountCategory({required this.namecat});
}

final List<DiscountCategory> discountCategorylist = [
  DiscountCategory(namecat: "50% off"),
  DiscountCategory(namecat: "40% off"),
  DiscountCategory(namecat: "30% off"),
  DiscountCategory(namecat: "25% off")
];

class DiscountCards extends StatefulWidget {
  const DiscountCards({super.key});

  @override
  State<DiscountCards> createState() => _DiscountCardsState();
}

class _DiscountCardsState extends State<DiscountCards> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        
        mainAxisExtent: 40,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: discountCategorylist.length,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                discountCategorylist[index].namecat,
                style: TextStyle(fontSize: 16),
              ),
              5.kw,
              Icon(Icons.cancel_outlined),
            ],
          ),
        );
      },
    );
  }
}
