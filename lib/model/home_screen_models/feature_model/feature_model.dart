class FeatureModel {
  final String imglink;
  final String title;
  final String price;

  FeatureModel({
    required this.imglink,
    required this.price,
    required this.title,
  });
}

final List<FeatureModel> featureModellist = [
  FeatureModel(
    imglink: "assets/Mask Group (1).png",
    price: "\$39.99",
    title: "Turtleneck Sweater",
  ),
  FeatureModel(
    imglink: "assets/Mask Group (2).png",
    price: "\$45.99",
    title: "Long Sleeve Dress",
  
  )
  ,
  FeatureModel(imglink: "assets/Mask Group (3).png", price: "80.00", title: "Sportwear Set")
];
