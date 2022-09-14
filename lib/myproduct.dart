import 'dart:ui';
import 'Homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:application_test/model/model.dart';
import 'model/cartmodel.dart';

class myproduct extends StatefulWidget {
  const myproduct({super.key});

  @override
  State<myproduct> createState() => _myproductState();
}

class _myproductState extends State<myproduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue.withOpacity(0.3),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Icon(Icons.keyboard_arrow_left),
              ),
              Text(
                "Fashion",
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
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 12,
              child: Icon(
                Icons.shopping_basket_rounded,
                color: Colors.red,
                size: 15,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Consumer<cartmodel>(builder: (context, cartmodel, child) {
              return Center(
                  child: Text("Total : " + cartmodel.totalprice.toString()));
            }),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Consumer<cartmodel>(builder: (context, cartmodel, child) {
          return Container(
            color: Colors.black.withOpacity(0.1),
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: cartmodel.basketproduct.length,
              itemBuilder: (BuildContext context, int index) {
                return Expanded(
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                                height: 100,
                                child: Image.asset(
                                  cartmodel.basketproduct[index].image!,
                                  fit: BoxFit.fill,
                                ))),
                        Expanded(
                          flex: 3,
                          child: ListTile(
                            title: Text(
                              "white Coat for winter ",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            subtitle: Container(
                              margin: EdgeInsets.only(top: 5),
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "EGP" +
                                        cartmodel.basketproduct[index].price
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                  Text(
                                    "EGP" +
                                        cartmodel.basketproduct[index].oldprice
                                            .toString(),
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                ],
                              ),
                            ),
                            trailing: CircleAvatar(
                              radius: 19,
                              backgroundColor:
                                  Color.fromARGB(255, 223, 224, 224),
                              child: IconButton(
                                icon: Icon(
                                  Icons.remove_shopping_cart_rounded,
                                  color: Color.fromARGB(255, 233, 7, 7),
                                  size: 23,
                                ),
                                onPressed: () {
                                  cartmodel
                                      .remove(cartmodel.basketproduct[index]);
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }));
  }
}
