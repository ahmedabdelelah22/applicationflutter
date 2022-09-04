import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'Homepage.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
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
                      height: 15,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Register ",
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 116, 116, 116)),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 6),
                              child: Text(
                                "now to see our produts",
                                style: TextStyle(
                                    fontSize: 15,
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
                        labelText: "Type name",
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
                      height: 20,
                    ),
                    TextFormField(
                        validator: (text) {
                          if (text!.isEmpty) {
                            return " your name is required";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Type Email",
                          prefixIcon: Icon(Icons.email),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 3,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 3),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.red, width: 3),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.red, width: 3),
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (text) {
                        if (text!.length <= 17) {
                          return " your phone number incorrect";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      initialValue: " +20 | ",
                      decoration: InputDecoration(
                        labelText: "Type phone number",
                        prefixIcon: Icon(Icons.call),
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
                        labelText: "type bassword ",
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
                      height: 10,
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
                          "Agree with terms & condition",
                          style: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116),
                              fontWeight: FontWeight.bold),
                        )
                      ],
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
                          "Register",
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
                      height: 0,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an acount ?",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 139, 139, 139),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return loginpage();
                              }));
                            },
                            child: Container(
                                padding: EdgeInsets.only(left: 0),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
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
