import 'dart:html';

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  String name, weight, height;

  double wh = 0, total = 0, C = 0;
  WelcomePage(
      {Key? key,
      required this.name,
      required this.weight,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Data Screen'),
      ),
      body: Center(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text('Your Name : '),
                      subtitle: Text('$name'),
                    )),
                Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text('Your Weight : '),
                      subtitle: Text('$weight'),
                    )),
                Card(
                    color: Colors.lightBlue,
                    elevation: 5,
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text('Your Height : '),
                      subtitle: Text('$height'),
                    )),
                Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(10),
                    child: 
                    Container(
                      child:LayoutBuilder(builder: context, constraints){
                        if(weight == 'THB' || height == 'USD'){
                          return Text(" " + (double(name) * 0.031).toString())
                        }
                      }
                        
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void main() {
    if (weight == "THB" || height == "USD") {
      C = (double.parse(name) * 0.031);
    }
  }

  double numberAdd(double name ,String w, String h) {
    
  }
}
