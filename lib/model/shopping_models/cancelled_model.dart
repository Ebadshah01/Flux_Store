class CancelledModel {
  final String orderNO;
  final String trackingNO;
  final String quantity;
  final String date;
  final String price;

  CancelledModel({
    required this.orderNO,
    required this.trackingNO,
    required this.quantity,
    required this.date,
    required this.price,
  });
}

final List<CancelledModel> cancelledModellist = [
  CancelledModel(
    orderNO: "Order #1524",
    trackingNO: " IK287368838",
    quantity: "2",
    date: "13/05/2021",
    price: "\$110",
  ),
  CancelledModel(
    orderNO: "Order #1525",
    trackingNO: " IK2873218897",
    quantity: "3",
    date: "12/05/2021",
    price: "\$230",
  ),
    CancelledModel(
    orderNO: "Order #1526",
    trackingNO: "IK237368820",
    quantity: "5",
    date: "10/05/2021",
    price: "\$490",
  ),
];
