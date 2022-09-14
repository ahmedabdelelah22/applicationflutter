import 'package:application_test/model/model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../apimodel.dart';
import './cartmodel.dart';
import 'package:application_test/myproduct.dart';
import 'package:dio/dio.dart';
import '../settingpage.dart';

class cartmodel with ChangeNotifier {
  CategoryModel? category;
  String? token;
  Future<dynamic> getAllCategory() async {
    Dio dio = Dio();
    dio.options.headers = {
      "lang": "ar",
      "Authorization": token,
    };
    final response =
        await dio.get("https://student.valuxapps.com/api/categories");
    category = CategoryModel.fromJson(response.data);
    notifyListeners();
  }

  List<product> _productdata = [];
  double _price = 0.0;
  void add(product product) {
    _productdata.add(product);
    _price += product.price!;
    notifyListeners();
  }

  void remove(product product) {
    _productdata.remove(product);
    _price -= product.price!;
    notifyListeners();
  }

  int get count {
    return _productdata.length;
  }

  double get totalprice {
    return _price;
  }

  List<product> get basketproduct {
    return _productdata;
  }
}
