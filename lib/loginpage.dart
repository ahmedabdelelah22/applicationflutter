import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'registerpage.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  bool showpass = true;
  bool accpetrights = false;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      height: 50,
                    ),
                    Container(
                      child: Image.asset('lib/assets/2000.png'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Login ",
                            style: TextStyle(
                                fontSize: 28,
                                color: Color.fromARGB(255, 116, 116, 116)),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 7),
                              child: Text(
                                "now to see our produts",
                                style: TextStyle(
                                    fontSize: 16.5,
                                    color: Color.fromARGB(255, 116, 116, 116)),
                              ))
                        ],
                      ),
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
                      decoration: InputDecoration(
                        labelText: "Type userName or Email",
                        prefixIcon: Icon(Icons.person),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.blue, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.blue, width: 3),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.red, width: 3),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.red, width: 3),
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
                        labelText: "Type bassword ",
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
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.blue, width: 3),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.red, width: 3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 3)),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.red, width: 3),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 17,
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
                          "Remember me",
                          style: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Container(
                              padding: EdgeInsets.only(left: 0),
                              child: Text(
                                "Forgest password ?",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Container(
                      child: MaterialButton(
                        minWidth: 250,
                        height: 45,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        onPressed: () {
                          if (formstate.currentState!.validate()) {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Homepage();
                            }));
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        color: Colors.blue.withOpacity(0.8),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          child: Divider(
                            color: Color.fromARGB(255, 139, 139, 139),
                            thickness: 1.5,
                          ),
                        ),
                        Text(
                          "  or  ",
                          style: TextStyle(fontSize: 25),
                        ),
                        Container(
                          width: 120,
                          child: Divider(
                            color: Color.fromARGB(255, 139, 139, 139),
                            thickness: 1.5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('lib/assets/1.jpg'),
                          radius: 30,
                        ),
                        CircleAvatar(
                          backgroundImage: AssetImage('lib/assets/3.jpg'),
                          radius: 30,
                        ),
                        CircleAvatar(
                          backgroundImage: AssetImage('lib/assets/4.jpg'),
                          radius: 30,
                        ),
                        CircleAvatar(
                          backgroundImage: AssetImage('lib/assets/2.jpg'),
                          radius: 30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an acount ?",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 139, 139, 139),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return Registerpage();
                              }));
                            },
                            child: Container(
                                padding: EdgeInsets.only(left: 0),
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
