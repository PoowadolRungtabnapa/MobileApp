import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  String Amount, Action;

  double wh = 0, total = 0, Balance = 0;
  WelcomePage({Key? key, required this.Amount, required this.Action})
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
                    subtitle: Text(' $Balance'),
                  ),
                ),
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text('Your Weight : '),
                    subtitle: Text(' $Amount'),
                  ),
                ),
                Card(
                  color: Colors.lightBlue,
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                      title: Text('Your Height : '), subtitle: Text('$Action')),
                ),
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text('Total Weight + Height = '),
                    subtitle: Text(' ' +
                        Cal(Balance, double.parse(Amount), (Action))
                            .toString()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double Cal(double balance, double amount, action) {
    if (balance - amount >= 0) {
      total = balance - amount;
      balance = total;
      action = 'Success';
    } else {
      total = 0;
    }
    return action;
  }
}
