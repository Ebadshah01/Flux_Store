import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/themecolor/themecolor.dart';
import 'package:fluxstore/view/auth/login_screeens/signin.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late final PageController _pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitethemecolor,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            children: const [
              OnBoardingPage(
                imgLink: "assets/Frame 33089.png",
                title: "Discover something new",
                description: "Special new arrivals just for you",
              ),
              OnBoardingPage(
                imgLink: "assets/Group 33078.png",
                title: "Update trendy outfit",
                description: "Favorite brands and hottest trends",
              ),
              OnBoardingPage(
                imgLink: "assets/pngegg (1)_auto_x2 1.png",
                title: "Explore your true style",
                description: "Relax and let us bring the style to you",
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    if (currentIndex == 0) {
                      _pageController.jumpToPage(1);
                    } else if (currentIndex == 1) {
                      _pageController.jumpToPage(2);
                    } else if (currentIndex == 2) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Signin()),
                        (route) => false,
                      );
                    }
                  },
                  child: Container(
                    height: context.screenHeight * 0.055,
                    width: context.screenWidth * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: whitethemecolor, width: 1.5),
                    ),
                    child: const Center(
                      child: Text(
                        "Shopping Now",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: context.screenHeight * 0.15,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _activeindicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6.0,
      width: isActive ? 9 : 9,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: whitethemecolor,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  Widget _inactiveindicator(bool isInActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isInActive ? 9 : 9,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_activeindicator(true));
      } else {
        indicators.add(_inactiveindicator(false));
      }
    }
    return indicators;
  }
}

class OnBoardingPage extends StatelessWidget {
  final String imgLink;
  final String title;
  final String description;

  const OnBoardingPage({
    super.key,
    required this.imgLink,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              // Background containers
              Column(
                children: [
                  Container(
                    height: context.screenHeight * 0.5,
                    width: double.infinity,
                    color: whitethemecolor,
                  ),
                  Container(
                    height: context.screenHeight * 0.5,
                    width: double.infinity,
                    color: themeprimarycolor,
                  ),
                ],
              ),

              // Center content (overlapping both containers)
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        description,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //   SizedBox(height: context.screenHeight * 0.02),
                      SizedBox(height: 50,),
                      Container(
                      constraints: BoxConstraints(
                        minHeight: 400
                      ),
                        
                        width: 350,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imgLink),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
