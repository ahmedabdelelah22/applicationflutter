import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Homepage.dart';
import 'model/model.dart';
import 'profile.dart';
import 'dart:async';
import 'dart:io';
import 'loginpage.dart';
import 'registerpage.dart';
import 'package:provider/provider.dart';
import 'model/cartmodel.dart';
import 'myproduct.dart';

void main() {
  runApp(MyApp());
}

////////////////////////////////////////////////////////////////////////////////
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return cartmodel();
        },
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.blue.withOpacity(0.3),
          ),
          debugShowCheckedModeBanner: false,
          home: Test(),
        ));
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int selectedindex = 0;
  List<Widget> widgetpages = [
    Homepage(),
    profilpage(),
    myproduct(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black.withOpacity(0.5),
            selectedFontSize: 15,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            currentIndex: selectedindex,
            backgroundColor: Colors.white,
            elevation: 0,
            onTap: (index) {
              setState(() {
                selectedindex = index;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "catgory"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "my acount"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_basket), label: "myproduct")
            ]),
        body: widgetpages.elementAt(selectedindex));
  }
}
