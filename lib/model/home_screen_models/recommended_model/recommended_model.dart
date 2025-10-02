class RecommendedModel {
  final String imglink;
  final String title;
  final String price;

  RecommendedModel({
    required this.imglink,
    required this.price,
    required this.title,
  });
}

final List<RecommendedModel> recommendedModellist = [
  RecommendedModel(
    imglink: "assets/Mask Group (4).png",
    price: "\$29.00",
    title: "White fashion hoodie",
  ),
  RecommendedModel(imglink: "assets/image 65.png", price: "\$30.00", title: "Rise Crop Hoodie")
];
