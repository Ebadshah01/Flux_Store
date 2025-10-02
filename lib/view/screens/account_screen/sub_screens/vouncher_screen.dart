import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/model/account_models/vouncher_model.dart';
import 'package:fluxstore/molecules/backward_arrow.dart';
import 'package:fluxstore/themecolor/themecolor.dart';

class VouncherScreen extends StatefulWidget {
  const VouncherScreen({super.key});

  @override
  State<VouncherScreen> createState() => _VouncherScreenState();
}

class _VouncherScreenState extends State<VouncherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitethemecolor,
      appBar: AppBar(
        backgroundColor: whitethemecolor,
        surfaceTintColor: whitethemecolor,
        leading: BackwardArrow(),
        title: Text(
          "Vouncher",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            10.kh,
            Expanded(child: _vouncherModelItems(context: context)),
          ],
        ),
      ),
    );
  }
}

Widget _vouncherModelItems({required BuildContext context}) {
  return ListView.builder(
  shrinkWrap: true,
    primary: false,
    itemCount: vouncherlist.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: whitethemecolor,
            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                offset: Offset(1, 1),
                blurRadius: 2,
                // ignore: deprecated_member_use
                color: blackthemecolor.withOpacity(0.1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: vouncherlist[index].color,
                  ),
                  child: Center(
                    child: Text(
                      vouncherlist[index].discount,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: whitethemecolor,
                      ),
                    ),
                  ),
                ),
                10.kw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      vouncherlist[index].title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          "Sale off ",
                          style: TextStyle(fontSize: 14, color: greythemecolor),
                        ),
                        Text(
                          vouncherlist[index].discount,
                          style: TextStyle(fontSize: 14, color: greythemecolor),
                        ),
                      ],
                    ),
                    Text(
                      vouncherlist[index].code,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),
                Container(height: 100, width: 2, color: greythemecolor),
                10.kw,
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Exp",
                      style: TextStyle(fontSize: 16, color: greythemecolor),
                    ),
                    10.kh,
                    Text(
                      vouncherlist[index].date,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
