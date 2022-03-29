import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/flutter_qr_bar_scanner.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const qrCode(title: 'Test QR Code'),
    );
  }
}

class qrCode extends StatefulWidget {
  const qrCode({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<qrCode> createState() => _qrCodeState();
}

class _qrCodeState extends State<qrCode> {
  String? _qrInfo = 'Scan a QR/Bar code';
  bool _camState = false;

  Widget showButton() {
    return ElevatedButton.icon(
        onPressed: () {
          print('pressed Scan');
          setState(() {
            _camState = true;
          });
        },
        icon: Icon(Icons.qr_code_outlined),
        label: Text("Scan"));
  }

  _qrCallback(String? code) {
    setState(() {
      _camState = false;
      _qrInfo = code;
    });
  }

  _scanCode() {
    setState(() {
      _camState = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _scanCode();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget showScanner() {
    return Container(
      child: SizedBox(
        height: 200,
        width: 200,
        child: QRBarScannerCamera(
          onError: (context, error) => Text(
            error.toString(),
            style: TextStyle(color: Colors.red),
          ),
          qrCodeCallback: (code) {
            _qrCallback(code);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          _camState ? showScanner() : Container(),
          showButton(),
          Text(_qrInfo!),
        ],
      ),
    );
  }
}
