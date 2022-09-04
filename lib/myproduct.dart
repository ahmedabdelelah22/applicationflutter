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
          centerTitle: true,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.blue.withOpacity(0.3),
          title: Text("my product"),
          actions: [
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
                                    cartmodel.basketproduct[index].image!))),
                        Expanded(
                          flex: 3,
                          child: ListTile(
                            title: Text("EGP" +
                                cartmodel.basketproduct[index].price
                                    .toString()),
                            subtitle: Text(
                              "EGP" +
                                  cartmodel.basketproduct[index].oldprice
                                      .toString(),
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.remove_circle),
                              onPressed: () {
                                cartmodel
                                    .remove(cartmodel.basketproduct[index]);
                              },
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
