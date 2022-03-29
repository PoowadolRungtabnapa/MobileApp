import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Screen'),
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx >= 15 || details.delta.dx <= -15) {
            print(details.delta.dx);
            Navigator.pop(context);
          }
        },
        child: Center(
          child: Text(
            'Drag for change',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
