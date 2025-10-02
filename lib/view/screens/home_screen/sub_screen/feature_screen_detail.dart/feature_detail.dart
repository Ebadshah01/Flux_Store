import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/model/home_screen_models/feature_model/feature_model.dart';
import 'package:fluxstore/molecules/backward_arrow.dart';
import 'package:fluxstore/themecolor/themecolor.dart';
import 'package:fluxstore/view/screens/Cart_screen/cart_screen.dart';
import 'package:fluxstore/view/screens/home_screen/home_screen.dart';
import 'package:fluxstore/view/screens/search_screen/search_screen.dart';

class FeatureDetailScreen extends StatefulWidget {
  final FeatureModel featureModellist;
  const FeatureDetailScreen({super.key, required this.featureModellist});

  @override
  State<FeatureDetailScreen> createState() => _FeatureDetailScreenState();
}

class _FeatureDetailScreenState extends State<FeatureDetailScreen> {
  String selectedSize = "";
  final List<double> ratings = [0.80, 0.12, 0.05, 0.01, 0.0];
  final List<String> labels = [
    '5 Stars',
    '4 Stars',
    '3 Stars',
    '2 Stars',
    '1 Star',
  ];

  @override
  Widget build(BuildContext context) {
   // final favoriteProvider = Provider.of<FavoriteItem>(context);
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
         // ErrorMessage(context, "Successfully Added", themeprimarycolor);
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: themeprimarycolor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                color: whitethemecolor,
                size: 30,
              ),
              10.kw,
              Text(
                "Add to Cart",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: whitethemecolor,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: whitethemecolor,
      body: Stack(
        children: [
          _buildTopImage(),
          Padding(
            padding: const EdgeInsets.only(top: 360),
            child: FadeInDown(
              child: Container(
                decoration: BoxDecoration(
                  color: whitethemecolor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: blackthemecolor.withOpacity(0.1),
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    children: [
                      _buildTitleAndPrice(),
                      10.kh,
                      _buildRatingRow(),
                      10.kh,
                      const Divider(),
                      10.kh,
                      _buildColorAndSize(),
                      20.kh,
                      _buildDescription(),
                      _buildReviews(),
                      _buildSimilarProducts(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopImage() {
    return Stack(
      children: [
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.featureModellist.imglink),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
          child: Row(
            children: [
              BackwardArrow(),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    
                  },
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: whitethemecolor,
                    child: Icon(Icons.favorite_border,size: 25,color: themeprimarycolor,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTitleAndPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.featureModellist.title,
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          widget.featureModellist.price,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildRatingRow() {
    return Row(
      children: [
        ...List.generate(
          5,
          (index) => Icon(Icons.star, color: greenthemecolor, size: 20),
        ),
        10.kw,
        Text("(83)", style: TextStyle(fontSize: 13, color: greythemecolor)),
      ],
    );
  }

  Widget _buildColorAndSize() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_colorSelector(), _sizeSelector()],
    );
  }

  Widget _colorSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color", style: TextStyle(fontSize: 16, color: greythemecolor)),
        10.kh,
        SizedBox(
          height: 35,
          child: colorCategory(3), // <-- yeh function apka color return karega
        ),
      ],
    );
  }

  Widget _sizeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Size", style: TextStyle(fontSize: 16, color: greythemecolor)),
        10.kh,
        Row(
          children:
              ["S", "M", "L"].map((size) {
                return customSizeCategory(
                  context: context,
                  size: size,
                  isSelected: selectedSize == size,
                  onTap: () => setState(() => selectedSize = size),
                );
              }).toList(),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title: const Text(
        "Description",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      children: [
        Text(
          "Sportswear is no longer under culture, it is no longer indie or cobbled together as it once was. Sport is fashion today. The top is oversized in fit and style, may need to size down.",
          maxLines: 4,
          style: TextStyle(fontSize: 16, color: greythemecolor),
        ),
      ],
    );
  }

  Widget _buildReviews() {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title: const Text(
        "Reviews",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      children: [
        Column(
          children: [
            _reviewSummary(),
            20.kh,
            ...List.generate(ratings.length, (index) {
              return _ratingBarRow(label: labels[index], value: ratings[index]);
            }),
            _reviewHeader(),
            10.kh,
            ReviewCard(
              userName: "Fatima",
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo_DZdc_B-rEj5HcQla8tjy7ARivFc1bOcgw&s",
              rating: 5,
              time: "5 min",
              description:
                  "I love it. Awesome customer service!! Helped me out with adding an additional item to my order. Thanks again!",
            ),
            10.kh,
            ReviewCard(
              userName: "Kelly",
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKgRk4IqCaE3XZ-d-NB-pYqgnSC4oL16C1oA&s",
              rating: 5,
              time: "19 min",
              description:
                  "I'm very happy with order, It was delivered on and good quality. Recommended!",
            ),
            20.kh,
          ],
        ),
      ],
    );
  }

  Widget _reviewSummary() {
    return Row(
      children: [
        const Text(
          "4.9",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        10.kw,
        Expanded(
          child: Text(
            "OUT of 5",
            style: TextStyle(fontSize: 16, color: greythemecolor),
          ),
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: List.generate(
                5,
                (index) => Icon(Icons.star, color: greenthemecolor, size: 25),
              ),
            ),
            Text(
              "83 Rating",
              style: TextStyle(fontSize: 16, color: greythemecolor),
            ),
          ],
        ),
      ],
    );
  }

  Widget _ratingBarRow({required String label, required double value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(label, style: TextStyle(fontSize: 16)),
          ),
          10.kw,
          Expanded(
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: value,
                child: Container(
                  decoration: BoxDecoration(
                    color: greenthemecolor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          10.kw,
          SizedBox(
            width: 50,
            child: Text(
              "${(value * 100).toInt()}%",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _reviewHeader() {
    return Row(
      children: [
        Expanded(
          child: Text(
            "47 Reviews",
            style: TextStyle(fontSize: 16, color: greythemecolor),
          ),
        ),
        const Spacer(),
        Expanded(
          child: Text(
            "WRITE A REVIEW",
            style: TextStyle(fontSize: 16, color: greythemecolor),
          ),
        ),
        5.kw,
        Icon(Icons.edit, color: greythemecolor),
      ],
    );
  }

  Widget _buildSimilarProducts() {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title: const Text(
        "Similar Product",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      children: [
        SizedBox(height: 250, child: customFeatureProducts(context: context)),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String userName;
  final String imageUrl;
  final int rating;
  final String time;
  final String description;

  const ReviewCard({
    super.key,
    required this.userName,
    required this.imageUrl,
    required this.rating,
    required this.time,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                imageUrl,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: List.generate(
                      rating,
                      (index) =>
                          Icon(Icons.star, color: greenthemecolor, size: 20),
                    ),
                  ),
                ],
              ),
            ),
            Text(time, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
          ],
        ),
        10.kh,
        Text(description, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}

/// ✅ FIXED: Removed Expanded from inside GestureDetector
Widget customSizeCategory({
  required BuildContext context,
  required String size,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CircleAvatar(
        backgroundColor:
            // ignore: deprecated_member_use
            isSelected ? Colors.black : greythemecolor.withOpacity(0.2),
        radius: 18,
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? Colors.white : greythemecolor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
