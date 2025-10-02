import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/model/shopping_models/order_model.dart';
import 'package:fluxstore/themecolor/themecolor.dart';
import 'package:fluxstore/view/screens/shopping_screen/sub_screen/order_details.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // yeh teen lists banao
    final List<OrderModel> pendingOrders =
        orderList.where((order) => order.status == "Pending").toList();

    final List<OrderModel> deliveredOrders =
        orderList.where((order) => order.status == "Delivered").toList();

    final List<OrderModel> cancelledOrders =
        orderList.where((order) => order.status == "Cancelled").toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: whitethemecolor,
        title: const Text("My Orders"),
      ),
      backgroundColor: whitethemecolor,
      body: Column(
        children: [
          const SizedBox(height: 20),

          // 🌟 TabBar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              labelStyle: const TextStyle(fontWeight: FontWeight.w600),
              tabs: const [
                Tab(text: "Pending"),
                Tab(text: "Delivered"),
                Tab(text: "Cancelled"),
              ],
            ),
          ),

          10.kh,

          // 🧾 TabBarView
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildOrderList(
                  list: pendingOrders,
                  status: "Pending",
                  statusColor: Colors.orange,
                ),
                _buildOrderList(
                  list: deliveredOrders,
                  status: "Delivered",
                  statusColor: Colors.green,
                ),
                _buildOrderList(
                  list: cancelledOrders,
                  status: "Cancelled",
                  statusColor: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔥 Common function for all orders
  Widget _buildOrderList({
    required List<OrderModel> list,
    required String status,
    required Color statusColor,
  }) {
    if (list.isEmpty) {
      return const Center(child: Text("No Orders Found"));
    }

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final order = list[index];
        return Card(
          //color: whitethemecolor,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Order No & Date
                Row(
                  children: [
                    Text(
                      order.orderNO,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      order.date,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
                8.kh,

                // Tracking
                Text(
                  "Tracking: ${order.trackingNO}",
                  style: const TextStyle(fontSize: 14),
                ),

                8.kh,

                // Qty & Price
                Row(
                  children: [
                    Text(
                      "Qty: ${order.quantity}",
                      style: const TextStyle(fontSize: 14),
                    ),
                    const Spacer(),
                    Text(
                      "Subtotal: ${order.price}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                12.kh,

                // Status & Button
                Row(
                  children: [
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 16,
                        color: statusColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderDetails(orderList: list[index]),
                          ),
                        );
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black),
                          color: whitethemecolor,
                        ),
                        child: const Center(
                          child: Text(
                            "Details",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
