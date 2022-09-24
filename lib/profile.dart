import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class profilpage extends StatefulWidget {
  const profilpage({super.key});

  @override
  State<profilpage> createState() => _profilpageState();
}

class _profilpageState extends State<profilpage> {
  File? image;

  uploadImage() async {
    var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    } else
      return {};
  }

  bool showpass = true;
  bool accpetrights = false;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 75, 111, 139),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              child: Icon(Icons.keyboard_arrow_left),
            ),
            Text(
              "Profile",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text("design",
                  style: TextStyle(color: Colors.red, fontSize: 16)),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    "save",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 254),
                        fontSize: 20),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Icons.vertical_align_bottom,
                    color: Color.fromARGB(255, 245, 121, 39),
                  ),
                ],
              )),
        ],
      ),
      body: Container(
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            Container(
                height: double.infinity,
                width: double.infinity,
                color: Color.fromARGB(255, 75, 111, 139),
                child: Container(
                  alignment: Alignment.topCenter,
                  child: image == null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Text(
                                "add cover photo",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.blue),
                              ),
                            ),
                            Container(
                              child: IconButton(
                                  onPressed: uploadImage,
                                  icon: Icon(
                                    Icons.add_a_photo,
                                    color: Colors.blueAccent,
                                    size: 60,
                                  )),
                            ),
                          ],
                        )
                      : Image.file(
                          image!,
                          fit: BoxFit.fill,
                          height: 200,
                          width: double.infinity,
                        ),
                )),
            Positioned(
              left: 125,
              top: 90,
              child: Container(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 70,
                ),
              ),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              margin: EdgeInsets.only(top: 170),
              height: double.infinity,
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: formstate,
                    child: Container(
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    validator: (text) {
                                      if (text!.isEmpty) {
                                        return " your name is required";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.black.withOpacity(0.3),
                                      labelText: "first name",
                                      prefixIcon: Icon(Icons.person),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 3),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 3),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 3),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 3),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    validator: (text) {
                                      if (text!.isEmpty) {
                                        return " your name is required";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.black.withOpacity(0.3),
                                      labelText: "last name",
                                      prefixIcon: Icon(Icons.person),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 3),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 3),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 3),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 3),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return " your name is required";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.black.withOpacity(0.3),
                                  labelText: "Type Email",
                                  prefixIcon: Icon(Icons.email),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 3,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 3),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 3),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 3),
                                  ),
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              validator: (text) {
                                if (text!.length <= 17) {
                                  return " your phone number incorrect";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              initialValue: " +20 | ",
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.black.withOpacity(0.3),
                                prefixIcon: Icon(Icons.call),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 3),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 3),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 3),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 3),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              validator: (text) {
                                if (text!.length < 9) {
                                  return " your password less than 9 characters";
                                }
                                return null;
                              },
                              obscureText: showpass,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.black.withOpacity(0.3),
                                labelText: "type bassword ",
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        showpass = !showpass;
                                      });
                                    },
                                    icon: Icon(showpass
                                        ? (Icons.visibility_off)
                                        : (Icons.visibility))),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 3),
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 3)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 3)),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 3),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: accpetrights,
                                    onChanged: (val) {
                                      setState(() {
                                        accpetrights = val!;
                                      });
                                    }),
                                Text(
                                  "Agree with terms & condition",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 116, 116, 116),
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: MaterialButton(
                                      minWidth: 250,
                                      height: 45,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      onPressed: () {
                                        if (formstate.currentState!
                                            .validate()) {}
                                      },
                                      child: Text(
                                        "Creat profial",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      color: Colors.blue.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: MaterialButton(
                                      minWidth: 250,
                                      height: 45,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      onPressed: () {
                                        if (formstate.currentState!
                                            .validate()) {}
                                      },
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      color: Colors.red.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
            Positioned(
              top: 105,
              left: 140,
              child: Container(
                clipBehavior: Clip.antiAlias,
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: image == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "add photo",
                            style: TextStyle(color: Colors.blue, fontSize: 20),
                          ),
                          IconButton(
                              onPressed: uploadImage,
                              icon: Icon(
                                Icons.add_a_photo,
                                color: Colors.blue,
                                size: 30,
                              ))
                        ],
                      )
                    : Image.file(
                        image!,
                        fit: BoxFit.fill,
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
