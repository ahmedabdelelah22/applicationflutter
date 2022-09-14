import 'package:application_test/settingpage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Homepage.dart';
import 'model/model.dart';
import 'profile.dart';
import 'dart:async';
import 'dart:io';
import 'authorities/loginpage.dart';
import 'authorities/registerpage.dart';
import 'package:provider/provider.dart';
import 'model/cartmodel.dart';
import 'myproduct.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'apimodel.dart';
import 'model/homemodelapi.dart';
import 'homepageapi.dart';

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
            primaryColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          home: loginpage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  int selectedindex = 0;
  List<Widget> widgetpages = [
    homepageapi(),
    profilpage(),
    myproduct(),
    settingpage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widgetpages.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) => setState(() => _currentIndex = index),
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Colors.red,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.people),
              title: Text('Users'),
              activeColor: Colors.purpleAccent,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.shopping_basket),
              title: Text(
                ' products ',
              ),
              activeColor: Colors.pink,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: Colors.blue,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
