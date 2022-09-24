import 'dart:ui';
import 'package:provider/provider.dart';
import 'myproduct.dart';
import 'model/cartmodel.dart';
import 'model/model.dart';
import 'package:flutter/material.dart';
import 'myproduct.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<product> productdata = [
    product(
      price: 110,
      oldprice: "190",
      discount: "40",
      image: 'lib/assets/06.jpg',
      prandimage: 'lib/assets/7.jpg',
      id: 1,
    ),
    product(
      price: 110,
      oldprice: "190",
      discount: "40",
      image: 'lib/assets/08.jpg',
      prandimage: 'lib/assets/5.jpg',
      id: 1,
    ),
    product(
      price: 110,
      oldprice: "190",
      discount: "40",
      image: 'lib/assets/04.jpg',
      prandimage: 'lib/assets/12.jpg',
      id: 1,
    ),
    product(
      price: 110,
      oldprice: "190",
      discount: "40",
      image: 'lib/assets/05.jpg',
      prandimage: 'lib/assets/11.jpg',
      id: 1,
    ),
    product(
      price: 110,
      oldprice: "190",
      discount: "40",
      image: 'lib/assets/07.jpg',
      prandimage: 'lib/assets/10.jpg',
      id: 1,
    ),
    product(
      price: 110,
      oldprice: "190",
      discount: "40",
      image: 'lib/assets/01.jpg',
      prandimage: 'lib/assets/14.jpg',
      id: 1,
    ),
    product(
      price: 100,
      oldprice: "190",
      discount: "40",
      image: 'lib/assets/09.jpg',
      prandimage: 'lib/assets/16.jpg',
      id: 1,
    ),
    product(
      price: 110,
      oldprice: "190",
      discount: "40",
      image: 'lib/assets/011.jpg',
      prandimage: 'lib/assets/8.jpg',
      id: 1,
    ),
    product(
      price: 110,
      oldprice: "190",
      discount: "40",
      image: 'lib/assets/012.jpg',
      prandimage: 'lib/assets/7.jpg',
      id: 1,
    ),
    product(
      price: 110,
      oldprice: "190",
      discount: "40",
      image: 'lib/assets/014.jpg',
      prandimage: 'lib/assets/5.jpg',
      id: 1,
    ),
    product(
      price: 110,
      oldprice: "190",
      discount: "40",
      image: 'lib/assets/013.jpg',
      prandimage: 'lib/assets/12.jpg',
      id: 1,
    ),
    product(
      price: 110,
      oldprice: "190",
      discount: "40",
      image: 'lib/assets/016.jpg',
      prandimage: 'lib/assets/11.jpg',
      id: 1,
    ),
    product(
      price: 110,
      oldprice: "190",
      discount: "40",
      image: 'lib/assets/015.jpg',
      prandimage: 'lib/assets/10.jpg',
      id: 1,
    ),
    product(
      price: 100,
      oldprice: "190",
      discount: "40",
      image: 'lib/assets/017.jpg',
      prandimage: 'lib/assets/14.jpg',
      id: 1,
    )
  ];

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
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return myproduct();
                  }));
                },
                child: Icon(Icons.add_shopping_cart),
              ),
              SizedBox(
                width: 4,
              ),
              Consumer<cartmodel>(
                builder: (context, cartmodel, child) {
                  return Text("${cartmodel.count}");
                },
              ),
              SizedBox(
                width: 10,
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            color: Colors.black.withOpacity(0.2),
            height: 60,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
              itemCount: productdata.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage(productdata[index].prandimage!),
                      radius: 20,
                    ),
                    SizedBox(width: 5),
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black.withOpacity(0.2),
              child: GridView.builder(
                  padding: EdgeInsets.only(),
                  scrollDirection: Axis.vertical,
                  itemCount: productdata.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return Consumer<cartmodel>(
                      builder: (context, cartmodel, child) {
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
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.blue,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                productdata[index].image!),
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
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15)),
                                              color: Colors.blue,
                                            ),
                                            height: 45,
                                            width: 30,
                                            child: Column(children: [
                                              Icon(Icons.bolt,
                                                  color: Colors.red),
                                              Text(
                                                productdata[index].discount!,
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
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                              Text("zara")
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: 10, left: 2),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    "EGP" +
                                                        productdata[index]
                                                            .price!
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "EGP" +
                                                        productdata[index]
                                                            .oldprice!,
                                                    style: TextStyle(
                                                        fontSize: 9,
                                                        color: Colors.black
                                                            .withOpacity(0.5),
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
                                                        color: Colors.white,
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
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
