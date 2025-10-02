import 'package:flutter/material.dart';
import 'package:fluxstore/model/search_screen_model/color_category_model/color_category_model.dart';
import 'package:fluxstore/themecolor/themecolor.dart';



class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String selected = "Apply";
  int selectedStars = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: whitethemecolor,
      endDrawer: _buildFilterDrawer(), // ✅ New Drawer
      appBar: AppBar(
        backgroundColor: whitethemecolor,
        surfaceTintColor: whitethemecolor,
        leading: const Icon(Icons.line_style_outlined, size: 25),
        title: const Text(
          "Discover",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications_active),
          ),
         
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                _buildSearchBar(),
                 IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // ✅ Safe call to open drawer
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _scaffoldKey.currentState?.openEndDrawer();
              });
            },
          ),
              ],
            ),
            const SizedBox(height: 15),
            _customImageContainer("assets/Frame 33149.png"),
            const SizedBox(height: 15),
            _customImageContainer("assets/Frame 33123.png"),
            const SizedBox(height: 15),
            _customImageContainer("assets/Frame 33117.png"),
            const SizedBox(height: 15),
            _customImageContainer("assets/Frame 33117 (1).png"),
          ],
        ),
      ),
    );
  }

  /// 🔎 Search Bar
  Widget _buildSearchBar() {
    return Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: whitethemecolor,
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(1, 2),
              // ignore: deprecated_member_use
              color: blackthemecolor.withOpacity(0.1),
            ),
          ],
        ),
        child: const TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            border: InputBorder.none,
            hintText: "Search",
            prefixIcon: Icon(Icons.search, color: greythemecolor, size: 25),
            hintStyle: TextStyle(color: greythemecolor, fontSize: 18),
          ),
        ),
      ),
    );
  }

  /// 🖼 Image Banner
  Widget _customImageContainer(String imgPath) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
      ),
    );
  }

  /// 📂 Drawer
  Widget _buildFilterDrawer() {
    return Drawer(
      backgroundColor: whitethemecolor,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: const [
                Text("Filter", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Spacer(),
                Icon(Icons.filter_list),
              ],
            ),
            const SizedBox(height: 20),

            const Text("Color", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(7, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.primaries[index % Colors.primaries.length],
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 30),
            const Text("Star Rating", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
      Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        int starIndex = index + 1;
        bool isSelected = selectedStars >= starIndex;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedStars = starIndex;
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? themeprimarycolor : Colors.white,
              border: Border.all(
                color: themeprimarycolor,
                width: 2,
              ),
            ),
            child: Icon(
              Icons.star,
              size: 22,
              color: isSelected ? Colors.white : themeprimarycolor,
            ),
          ),
        );
      }),
    ),

            const SizedBox(height: 30),
            const Text("Category", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            ExpansionTile(
              leading: const Icon(Icons.woman),
              title: const Text("Crops Top"),
              children: const [
                ListTile(
                  leading: Icon(Icons.person_2_outlined, color: greythemecolor),
                  title: Text("T-Shirt", style: TextStyle(fontSize: 17)),
                ),
              ],
            ),

            const SizedBox(height: 30),
            const Text("Discount", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: List.generate(4, (index) {
                return Chip(
                  label: Text("${(index + 1) * 10}% OFF"),
                  backgroundColor: Colors.blue.shade50,
                );
              }),
            ),

            const SizedBox(height: 30),
            Row(
              children: [
                _filterButton("Reset", selected == "Reset", () {
                  setState(() => selected = "Reset");
                  Navigator.pop(context);
                }),
                const SizedBox(width: 10),
                _filterButton("Apply", selected == "Apply", () {
                  setState(() => selected = "Apply");
                  Navigator.pop(context);
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 🎛 Filter Button
  Widget _filterButton(String label, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isSelected ? themeprimarycolor : Colors.white,
            border: Border.all(color: themeprimarycolor),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? whitethemecolor : themeprimarycolor,
            ),
          ),
        ),
      ),
    );
  }
}


Widget colorCategory(int limit) {
  return ListView.builder(
    shrinkWrap: true,
    primary: false,
    scrollDirection: Axis.horizontal,
    itemCount: limit.clamp(0, colorCategoryModellist.length),
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(left: 5),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: colorCategoryModellist[index].color,
        ),
      );
    },
  );
}


// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:fluxstore/const/sizedbox.dart';
// import 'package:fluxstore/model/search_screen_model/color_category_model/color_category_model.dart';
// import 'package:fluxstore/model/search_screen_model/discount_category_model/discount_category.dart';
// import 'package:fluxstore/model/search_screen_model/star_model/star_category_model.dart';
// import 'package:fluxstore/themecolor/themecolor.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // 🔑 GlobalKey
//   String selected = "Apply";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey, // ✅ Important
//       endDrawer: FilterSheet(
//         selected: selected,
//         onSelect: (val) {
//           setState(() {
//             selected = val;
//           });
//         },
//       ),
//       backgroundColor: whitethemecolor,
//       appBar: AppBar(
//         backgroundColor: whitethemecolor,
//         surfaceTintColor: whitethemecolor,
//         leading: const Icon(Icons.line_style_outlined, size: 25),
//         title: const Text(
//           "Discover",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         actions: [
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Icon(Icons.notifications_active),
//           ),
//           IconButton(
//             icon: const Icon(Icons.filter_list),
//             onPressed: () {
//               _scaffoldKey.currentState?.openEndDrawer(); // ✅ Open Drawer safely
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               5.kh,
//               Row(
//                 children: [
//                   5.kw,
//                   Expanded(
//                     child: Container(
//                       height: 40,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(25),
//                         color: whitethemecolor,
//                         boxShadow: [
//                           BoxShadow(
//                             spreadRadius: 1,
//                             blurRadius: 2,
//                             offset: const Offset(1, 2),
//                             color: blackthemecolor.withOpacity(0.1),
//                           ),
//                         ],
//                       ),
//                       child: const TextField(
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.symmetric(
//                             horizontal: 10,
//                             vertical: 10,
//                           ),
//                           border: InputBorder.none,
//                           hintText: "Search",
//                           prefixIcon: Icon(
//                             Icons.search,
//                             color: greythemecolor,
//                             size: 25,
//                           ),
//                           hintStyle: TextStyle(
//                             color: greythemecolor,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   5.kw,
//                 ],
//               ),
//               15.kh,
//               _customImageContainer(
//                 context: context,
//                 imgllink: "assets/Frame 33149.png",
//               ),
//               15.kh,
//               _customImageContainer(
//                 context: context,
//                 imgllink: "assets/Frame 33123.png",
//               ),
//               15.kh,
//               _customImageContainer(
//                 context: context,
//                 imgllink: "assets/Frame 33117.png",
//               ),
//               15.kh,
//               _customImageContainer(
//                 context: context,
//                 imgllink: "assets/Frame 33117 (1).png",
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class FilterSheet extends StatelessWidget {
//   final String selected;
//   final ValueChanged<String> onSelect;

//   const FilterSheet({
//     super.key,
//     required this.selected,
//     required this.onSelect,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: whitethemecolor,
//       child: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Row(
//                   children: const [
//                     Text(
//                       "Filter",
//                       style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                     ),
//                     Spacer(),
//                     Icon(Icons.filter_list),
//                   ],
//                 ),
//               ),
//               20.kh,
//               const Padding(
//                 padding: EdgeInsets.only(left: 10),
//                 child: Text("Color", style: TextStyle(fontSize: 16)),
//               ),
//               10.kh,
//               SizedBox(height: 40, child: colorCategory(7)),
//               30.kh,
//               const Padding(
//                 padding: EdgeInsets.only(left: 10),
//                 child: Text("Star Rating", style: TextStyle(fontSize: 16)),
//               ),
//               10.kh,
//               const SizedBox(height: 42, child: StarRatingCategory()),
//               30.kh,
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text("Category", style: TextStyle(fontSize: 16)),
//                     10.kh,
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: greythemecolor, width: 2),
//                       ),
//                       child: Theme(
//                         data: Theme.of(context).copyWith(
//                           visualDensity: const VisualDensity(
//                             horizontal: 0,
//                             vertical: -4,
//                           ),
//                         ),
//                         child: const ExpansionTile(
//                           leading: Icon(Icons.woman),
//                           title: Text("Crops Top"),
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 16),
//                               child: Row(
//                                 children: [
//                                   Icon(
//                                     Icons.person_2_outlined,
//                                     color: greythemecolor,
//                                   ),
//                                   SizedBox(width: 20),
//                                   Text("T-Shirt", style: TextStyle(fontSize: 17)),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     30.kh,
//                     const Text("Discount", style: TextStyle(fontSize: 16)),
//                     10.kh,
//                     SizedBox(height: 100, child: DiscountCards()),
//                     30.kh,
//                     Row(
//                       children: [
//                         FilterButton(
//                           label: "Reset",
//                           isSelected: selected == "Reset",
//                           onTap: () => onSelect("Reset"),
//                         ),
//                         const SizedBox(width: 10),
//                         FilterButton(
//                           label: "Apply",
//                           isSelected: selected == "Apply",
//                           onTap: () => onSelect("Apply"),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class FilterButton extends StatelessWidget {
//   final String label;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const FilterButton({
//     super.key,
//     required this.label,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         height: 40,
//         width: 100,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: isSelected ? themeprimarycolor : Colors.white,
//         ),
//         alignment: Alignment.center,
//         child: Text(
//           label,
//           style: TextStyle(
//             fontSize: 16,
//             color: isSelected ? whitethemecolor : themeprimarycolor,
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget _customImageContainer({
//   required BuildContext context,
//   required String imgllink,
// }) {
//   return FadeInDown(
//     child: Container(
//       height: 200,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         image: DecorationImage(image: AssetImage(imgllink), fit: BoxFit.cover),
//       ),
//     ),
//   );
// }
