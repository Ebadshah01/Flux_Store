import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/model/home_screen_models/category_model/category_model.dart';
import 'package:fluxstore/model/home_screen_models/feature_model/feature_model.dart';
import 'package:fluxstore/model/home_screen_models/recommended_model/recommended_model.dart';
import 'package:fluxstore/molecules/custom_title_row/custom_title_row.dart';
import 'package:fluxstore/provider/theme_change_provider.dart';
import 'package:fluxstore/themecolor/themecolor.dart';
import 'package:fluxstore/view/bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:fluxstore/view/screens/home_screen/sub_screen/feature_screen_detail.dart/feature_detail.dart';
import 'package:fluxstore/view/screens/notification_screen/notification_screen.dart';
import 'package:fluxstore/view/screens/search_screen/search_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
   


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: _customDrawer(context: context),
      appBar: AppBar(
        backgroundColor: whitethemecolor,
        surfaceTintColor: whitethemecolor,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(Icons.menu, size: 25),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
        ),
        title: Text(
          "Gemstore",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: customNotificationIcon(context: context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            10.kh,
            SizedBox(
              //color: redthemecolor,
              height: 75,
              child: _customCategorymodel(
                context: context,
                currentIndex: currentIndex,
                onCategoryTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage("assets/Mask Group.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Autumn\nCollection\n2022",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: whitethemecolor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  10.kh,
                 
                  CustomTitleRow(
                    title: "Feature Products",
                    actionText: "Show All",
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 250,
              child: customFeatureProducts(context: context),
            ),
            10.kh,
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Frame 33164.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomTitleRow(
                title: "Recommended",
                actionText: "Show All",
              ),
            ),
            SizedBox(
              height: 80,
              child: _customRecommendedProducts(context: context),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomTitleRow(
                    title: "Top Collection",
                    actionText: "Show All",
                  ),

                  customContainer(
                    imglink: "assets/banner 1.png",
                    context: context,
                  ),
                  customContainer(
                    imglink: "assets/banner 2.png",
                    context: context,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: customContainer(
                          width: 220,
                          imglink: "assets/banner 3.png",
                          context: context,
                        ),
                      ),

                      Expanded(
                        child: customContainer(
                          width: 220,

                          imglink: "assets/image 65.png",
                          context: context,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _customDrawer({required BuildContext context}) {
  final themeChanger = Provider.of<ThemeChangeProvider>(context);

  return Drawer(
    backgroundColor: whitethemecolor,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListView(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhOHR-lBQg5XZyFajzzHe7hk8o74yQjGsojQ&s",
                ),
              ),
              10.kw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ebad Ali",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "ebad@gmail.com",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          10.kh,
          customListTile(
            context: context,
            title: "Home",
            icon: Icons.home_outlined,
            newpage: BottomNavbar(),
          ),
          customListTile(
            context: context,
            title: "Discover",
            icon: Icons.search,
            newpage: SearchScreen(),
          ),
          customListTile(
            context: context,
            title: "My Order",
            icon: Icons.shopping_bag_outlined,
            newpage: BottomNavbar(),
          ),
          customListTile(
            context: context,
            title: "My Profile",
            icon: Icons.person_2_outlined,
            newpage: BottomNavbar(),
          ),
          Text(
            "Other",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: greythemecolor,
            ),
          ),
          customListTile(
            context: context,
            title: "Setting",
            icon: Icons.settings,
            newpage: BottomNavbar(),
          ),
          customListTile(
            context: context,
            title: "Support",
            icon: Icons.mail_outline,
            newpage: BottomNavbar(),
          ),
          customListTile(
            context: context,
            title: "About us",
            icon: Icons.error_outline,
            newpage: BottomNavbar(),
          ),
          RadioListTile<ThemeMode>(
            title: Text("Light Theme"),
            value: ThemeMode.light,
            groupValue: themeChanger.thememode,
            onChanged: themeChanger.settheme,
          ),
          RadioListTile<ThemeMode>(
            title: Text("Dark Theme"),
            value: ThemeMode.dark,
            groupValue: themeChanger.thememode,
            onChanged: themeChanger.settheme,
          ),
          RadioListTile<ThemeMode>(
            title: Text("System Theme"),
            value: ThemeMode.system,
            groupValue: themeChanger.thememode,
            onChanged: themeChanger.settheme,
          ),
        ],
      ),
    ),
  );
}

Widget _customCategorymodel({
  required BuildContext context,
  required int currentIndex,
  required Function(int) onCategoryTap,
}) {
  return FadeInRight(
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      primary: false,
      itemCount: categoryModellist.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            onCategoryTap(index);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor:
                      currentIndex == index
                          ? themeprimarycolor
                          // ignore: deprecated_member_use
                          : greythemecolor.withOpacity(0.2),
                  child: Icon(
                    categoryModellist[index].icon,
                    color:
                        currentIndex == index ? whitethemecolor : greythemecolor,
                  ),
                ),
                Text(
                  categoryModellist[index].title,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

Widget customFeatureProducts({required BuildContext context}) {
  return FadeInRight(
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      primary: false,
      itemCount: featureModellist.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeatureDetailScreen(featureModellist: featureModellist[index])
                    ),
                  );
                },
                child: Container(
                  height: 200,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(featureModellist[index].imglink),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(child: Text(featureModellist[index].title, style: TextStyle(fontSize: 16))),
              Expanded(
                child: Text(
                  featureModellist[index].price,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget _customRecommendedProducts({required BuildContext context}) {
  return FadeInLeft(
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      primary: false,
      itemCount: recommendedModellist.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Container(
            //    height: context.screenHeight * 0.15,
            // width: context.screenWidth * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: whitethemecolor,
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(1, 1),
                  // ignore: deprecated_member_use
                  color: blackthemecolor.withOpacity(0.2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(1, 1),
                          // ignore: deprecated_member_use
                          color: blackthemecolor.withOpacity(0.2),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(recommendedModellist[index].imglink),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  10.kw,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recommendedModellist[index].title,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        recommendedModellist[index].price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget customContainer({
  required imglink,
  required BuildContext context,
  double? width,
}) {
  return FadeInDown(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 200,
        width:
            width ??
            double.infinity, // default double.infinity, but Row me fixed width
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage(imglink), fit: BoxFit.cover),
        ),
      ),
    ),
  );
}

Widget customListTile({
  required BuildContext context,
  required title,
  required IconData icon,
  required newpage,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => newpage));
    },
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: greythemecolor),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: greythemecolor,
        ),
      ),
    ),
  );
}
