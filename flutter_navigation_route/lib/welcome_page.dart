import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  String name, weight, height;

  double wh = 0, total = 0;
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
                    child: ListTile(
                      title: Text('Total Weight + Height = '),
                      subtitle: Text(' ' +
                          numberAdd(double.parse(weight), double.parse(height))
                              .toString()),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double numberAdd(double w, double h) {
    total = w + h;

    return total;
  }
}
