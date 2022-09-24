import 'package:application_test/model/homemodelapi.dart';
import 'package:application_test/model/loginregister.dart';
import 'package:application_test/model/model.dart';
import 'package:application_test/model/registermodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../apimodel.dart';
import './cartmodel.dart';
import 'package:application_test/myproduct.dart';
import 'package:dio/dio.dart';
import '../settingpage.dart';
import '../homepageapi.dart';
import '../authorities/registerpage.dart';

class cartmodel with ChangeNotifier {
  loginmodel? Loginmodel;
  Map<String, dynamic>? logindata;
  Future<dynamic> login({
    String? email,
    String? password,
  }) async {
    Dio dio = Dio();
    dio.options.headers = {"lang": "en", "Content-Type": "application/json"};
    logindata = {
      "email": email,
      "password": password,
    };
    final response = await dio.post("https://student.valuxapps.com/api/login",
        data: logindata);
    Loginmodel = loginmodel.fromJson(response.data);
    notifyListeners();
  }

  registermodel? Rgistermodel;
  Map<String, dynamic>? registerdata;
  Future<dynamic> register({
    String? name,
    String? email,
    String? phone,
    String? password,
  }) async {
    Dio dio = Dio();
    dio.options.headers = {"lang": "en", "Content-Type": "application/json"};
    registerdata = {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
    };
    final response = await dio
        .post("https://student.valuxapps.com/api/register", data: registerdata);
    Rgistermodel = registermodel.fromJson(response.data);
    notifyListeners();
  }

  CategoryModel? category;
  String? token;
  Future<dynamic> getAllCategory() async {
    Dio dio = Dio();
    dio.options.headers = {
      "lang": "en",
      "Authorization": token,
    };
    final response =
        await dio.get("https://student.valuxapps.com/api/categories");
    category = CategoryModel.fromJson(response.data);
    notifyListeners();
  }

  homeapi? data;

  Future<dynamic> getAllData() async {
    Dio dio = Dio();
    dio.options.headers = {
      "lang": "en",
      "Content-Type": "application/json",
      "Authorization": token,
    };
    final response = await dio.get("https://student.valuxapps.com/api/home?");
    data = homeapi.fromJson(response.data);
    notifyListeners();
  }

  List<Products> _productdata = [];
  double _price = 0.0;
  void add(Products products) {
    _productdata.add(products);
    _price += products.price!;
    notifyListeners();
  }

  void remove(Products products) {
    _productdata.remove(products);
    _price -= products.price!;
    notifyListeners();
  }

  int get count {
    return _productdata.length;
  }

  double get totalprice {
    return _price;
  }

  List<Products> get basketproduct {
    return _productdata;
  }

  // List<product> _productdata = [];
  // double _price = 0.0;
  // void add(product product) {
  //   _productdata.add(product);
  //   _price += product.price!;
  //   notifyListeners();
  // }

  // void remove(product product) {
  //   _productdata.remove(product);
  //   _price -= product.price!;
  //   notifyListeners();
  // }

  // int get count {
  //   return _productdata.length;
  // }

  // double get totalprice {
  //   return _price;
  // }

  // List<product> get basketproduct {
  //   return _productdata;
  // }

}
