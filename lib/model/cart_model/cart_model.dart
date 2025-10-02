class CartModel {
  final String imglink;
  final String text;
  final String price;
  final String size;
  final String color;

  CartModel({
    required this.imglink,
    required this.text,
    required this.price,
    required this.size,
    required this.color,
  });
}

final List<CartModel> cartModellist = [
  CartModel(
    imglink: "assets/Mask Group (5).png",
    text: "Sportwear Set",
    price: "\$ 80.00",
    size: "L",
    color: "Cream",
  ),
  CartModel(
    imglink: "assets/Mask Group (1).png",
    text: "Turtleneck Sweater",
    price: "\$ 39.00",
    size: "M",
    color: "White",
  ),
  CartModel(
    imglink: "assets/image 65.png",
    text: "Cotton T-shirt",
    price: "\$ 30.00",
    size: "L",
    color: "Black",
  ),
];
