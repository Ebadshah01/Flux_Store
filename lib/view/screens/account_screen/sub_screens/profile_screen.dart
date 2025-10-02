import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluxstore/const/sizedbox.dart';
import 'package:fluxstore/molecules/backward_arrow.dart';
import 'package:fluxstore/themecolor/themecolor.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Function to pick image from gallery
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitethemecolor,
      appBar: AppBar(
        backgroundColor: whitethemecolor,
        leading:BackwardArrow(),
        title: Text(
          "Profile Setting",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: themeprimarycolor,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              _image != null
                                  ? FileImage(_image!)
                                  : const NetworkImage(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhOHR-lBQg5XZyFajzzHe7hk8o74yQjGsojQ&s",
                                      )
                                      as ImageProvider,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 4,
                        child: GestureDetector(
                          onTap: pickImage,
                          child: const CircleAvatar(
                            radius: 15,
                            backgroundColor: themeprimarycolor,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                30.kh,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "First Name",
                          style: TextStyle(fontSize: 16, color: greythemecolor),
                        ),
                        SizedBox(
                          height: 40,
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: blackthemecolor),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: greythemecolor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Last Name",
                          style: TextStyle(fontSize: 16, color: greythemecolor),
                        ),
                        SizedBox(
                          height: 40,
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: blackthemecolor),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: greythemecolor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                20.kh,
                  Text(
                          "Email",
                          style: TextStyle(fontSize: 16, color: greythemecolor),
                        ),
                        TextField(
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: blackthemecolor),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: greythemecolor),
                              ),
                            ),
                          ),
                          20.kh,
                            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Gender",
                          style: TextStyle(fontSize: 16, color: greythemecolor),
                        ),
                        SizedBox(
                          height: 40,
                          width: 150,
                          child: TextField(
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: blackthemecolor),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: greythemecolor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Phone",
                          style: TextStyle(fontSize: 16, color: greythemecolor),
                        ),
                        SizedBox(
                          height: 40,
                          width: 250,
                          child: TextField(
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: blackthemecolor),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: greythemecolor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                50.kh,
                Center(
                  child: Container(
                   
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                    color: themeprimarycolor),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Text("Save Changes",style: TextStyle(fontSize: 16,color: whitethemecolor,fontWeight: FontWeight.bold),),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
