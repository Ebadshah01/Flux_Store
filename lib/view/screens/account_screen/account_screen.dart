import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/themecolor/themecolor.dart';
import 'package:fluxstore/view/auth/login_screeens/signin.dart';
import 'package:fluxstore/view/screens/account_screen/sub_screens/address_screen.dart';
import 'package:fluxstore/view/screens/account_screen/sub_screens/feedback_screen.dart';
import 'package:fluxstore/view/screens/account_screen/sub_screens/payment_screen.dart';
import 'package:fluxstore/view/screens/account_screen/sub_screens/profile_screen.dart';
import 'package:fluxstore/view/screens/account_screen/sub_screens/vouncher_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitethemecolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              100.kh,
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhOHR-lBQg5XZyFajzzHe7hk8o74yQjGsojQ&s",
                      ),
                    ),
                    10.kw,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ebad",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('ebad@gmail.com', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.settings, size: 25),
                  ],
                ),
              ),
              50.kh,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whitethemecolor,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(1, 1),
                      // ignore: deprecated_member_use
                      color: blackthemecolor.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: Row(
                    //     children: [
                    //       Icon(Icons.location_on, color: greythemecolor),
                    //       Text("Address", style: TextStyle(fontSize: 16)),
                    //       Spacer(),
                    //       Icon(Icons.arrow_forward_ios),
                    //       10.kh,
                    //     ],
                    //   ),
                    // ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddressScreen(),
                          ),
                        );
                      },
                      child: _accountContainers(
                        context: context,
                        icon: Icons.location_on,
                        namecat: "Address",
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentScreen(),
                          ),
                        );
                      },
                      child: _accountContainers(
                        context: context,
                        icon: Icons.payment,
                        namecat: "Payment method",
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VouncherScreen(),
                          ),
                        );
                      },
                      child: _accountContainers(
                        context: context,
                        icon: Icons.discount_outlined,
                        namecat: "Vouncher",
                      ),
                    ),
                    _accountContainers(
                      context: context,
                      icon: Icons.favorite,
                      namecat: "My Wishlist",
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FeedbackScreen(),
                          ),
                        );
                      },
                      child: _accountContainers(
                        context: context,
                        icon: Icons.star_purple500_sharp,
                        namecat: "Rate this app",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Signin()),
                            (route) => false,
                          );
                        },
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Signin()),
                              (route) => false,
                            );
                          },
                          child: Row(
                            children: [
                              Icon(Icons.logout, color: greythemecolor),
                              10.kw,
                              Text("Log out", style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _accountContainers({
  required BuildContext context,
  required IconData icon,
  required String namecat,
}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(icon, color: greythemecolor),
            10.kw,
            Expanded(child: Text(namecat, style: TextStyle(fontSize: 16))),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 20),
            10.kh,
          ],
        ),
      ),
      Divider(),
    ],
  );
}
