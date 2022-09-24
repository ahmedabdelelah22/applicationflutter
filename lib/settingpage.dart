import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/cartmodel.dart';
import 'Homepage.dart';

class settingpage extends StatefulWidget {
  const settingpage({super.key});

  @override
  State<settingpage> createState() => _settingpageState();
}

class _settingpageState extends State<settingpage> {
  @override
  void initState() {
    Provider.of<cartmodel>(context, listen: false).getAllCategory();
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
                "Category",
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
              ],
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: Consumer<cartmodel>(builder: (context, cartmodel, child) {
          return cartmodel.category == null
              ? Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                )
              : Container(
                  child: ListView.builder(
                      itemCount: cartmodel.category!.data!.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 200,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.green[300],
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Column(children: [
                            Expanded(
                              child: Image.network(
                                cartmodel.category!.data!.data![index].image!,
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            Text(
                                "${cartmodel.category!.data!.data![index].name!}")
                          ]),
                        );
                      }));
        }));
  }
}
