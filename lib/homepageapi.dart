import 'dart:ui';
import 'package:provider/provider.dart';
import 'myproduct.dart';
import 'model/cartmodel.dart';
import 'model/model.dart';
import 'package:flutter/material.dart';
import 'myproduct.dart';

class homepageapi extends StatefulWidget {
  const homepageapi({super.key});

  @override
  State<homepageapi> createState() => _homepageapiState();
}

class _homepageapiState extends State<homepageapi> {
  @override
  void initState() {
    Provider.of<cartmodel>(context, listen: false).getAllData();
    // TODO: implement initState
    super.initState();
  }

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
            Row(
              children: [
                Icon(Icons.search),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  Icons.access_alarm,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 4,
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(Icons.add_shopping_cart),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
        body: Consumer<cartmodel>(
          builder: (context, cartmodel, child) {
            return cartmodel.data == null
                ? Center(
                    child: CircularProgressIndicator(color: Colors.blue),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.black.withOpacity(0.2),
                          child: GridView.builder(
                            padding: EdgeInsets.only(),
                            scrollDirection: Axis.vertical,
                            itemCount: cartmodel.data!.data!.products!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 7,
                                      offset: Offset(9.0, 10.0),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                width: double.infinity,
                                margin: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 7,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.blue,
                                              image: DecorationImage(
                                                  image: NetworkImage(cartmodel
                                                      .data!
                                                      .data!
                                                      .products![index]
                                                      .image!),
                                                  fit: BoxFit.fill)),
                                          width: double.infinity,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(15),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    15)),
                                                    color: Colors.blue,
                                                  ),
                                                  height: 45,
                                                  width: 30,
                                                  child: Column(children: [
                                                    Icon(Icons.bolt,
                                                        color: Colors.red),
                                                    Text(
                                                      cartmodel
                                                          .data!
                                                          .data!
                                                          .products![index]
                                                          .discount!
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )
                                                  ])),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                              )
                                            ],
                                          )),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                          margin: EdgeInsets.all(12),
                                          width: double.infinity,
                                          child: Column(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "white Coat for winter ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15),
                                                    ),
                                                    Text("zara")
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 10, left: 2),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          "EGP" +
                                                              cartmodel
                                                                  .data!
                                                                  .data!
                                                                  .products![
                                                                      index]
                                                                  .price!
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "EGP" +
                                                              cartmodel
                                                                  .data!
                                                                  .data!
                                                                  .products![
                                                                      index]
                                                                  .oldPrice!
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 9,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.5),
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              Colors.blue,
                                                          radius: 15,
                                                          child: InkWell(
                                                            onTap: () {},
                                                            child: Icon(
                                                              Icons
                                                                  .add_shopping_cart_rounded,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
          },
        ));
  }
}
