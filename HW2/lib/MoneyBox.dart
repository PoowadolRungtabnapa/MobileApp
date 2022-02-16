import 'dart:ffi';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class MoneyBox extends StatelessWidget {
  String title;
  double amount;
  double sizeConHeight;
  Color colorSet;

  MoneyBox(this.title, this.amount, this.sizeConHeight, this.colorSet);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
          color: colorSet, borderRadius: BorderRadius.circular(20)),
      height: sizeConHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              '${NumberFormat("#,###.###").format(amount)}',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
