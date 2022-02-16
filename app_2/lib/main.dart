import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'MoneyBox.dart';
import 'InputBox.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //use MaterialApp() widget like this
        home: Home() //create new widget class for this 'home' to
        // escape 'No MediaQuery widget found' error
        );
  }
}

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test Container'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(0.001),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 100),
                height: 120,
                width: 120,
                padding: const EdgeInsets.all(1),
                child: Image(image: AssetImage('assets/images/image1.jpg')),
              ),
              InputBox(Icon(IconData(0xe043, fontFamily: 'MaterialIcons')),
                  "Username"),
              InputBox(Icon(IconData(0xe22a, fontFamily: 'MaterialIcons')),
                  "Email address"),
              InputBox(Icon(IconData(0xeaa8, fontFamily: 'MaterialIcons')),
                  "Password"),
              InputBox(Icon(IconData(0xeaa8, fontFamily: 'MaterialIcons')),
                  "Confirm Password"),
              InputBox(Icon(IconData(0xe745, fontFamily: 'MaterialIcons')),
                  "Mobile"),
              Container(
                margin: EdgeInsets.symmetric(vertical: 0.1, horizontal: 10),
                width: 300,
                child: TextButton(
                  child: Text(
                    "REGISTER",
                    style: TextStyle(fontSize: 15),
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'Already have an Account?',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.right,
                    )),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.green),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
