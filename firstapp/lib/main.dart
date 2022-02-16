import 'package:flutter/material.dart';
import '../../foodMenu.dart';

void main() {
  runApp(MyApp());
  //print("Hello World");
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.cyan),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<foodMenu> menu = [
    foodMenu("กุ้งเผา", '500', 'assets/images/image1.jpg'),
    foodMenu("กระเพราหมู", "80", 'assets/images/image2.jpg'),
    foodMenu("ข้าวผัดหมู", "60", 'assets/images/image3.jpg'),
    foodMenu("ข้าวผัดไก่", "60", 'assets/images/image4.jpg'),
    foodMenu("ข้าวผัดกุ้ง", "80", 'assets/images/image5.jpg'),
    foodMenu("ข้าวผัดกระเทียม", "60", 'assets/images/image6.jpg'),
    foodMenu("ข้าวผัดหมึก", "80", 'assets/images/image7.jpg'),
    foodMenu("ข้าวผัดพริกเผา", "70", 'assets/images/image8.jPpg'),
    foodMenu("ข้าวผัดเนื้อ", "90", 'assets/images/image9.jpg'),
    foodMenu("ข้าวผัดทะเล", "90", 'assets/images/image10.jpg'),
  ];

  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("เลือกอาหาร"),
        ),
        body: ListView.builder(
          itemCount: menu.length,
          itemBuilder: (BuildContext context, int index) {
            foodMenu food = menu[index];
            return ListTile(
              leading: Image.asset(food.img),
              title: Text(
                "${index + 1}" + "." + food.name,
                style: TextStyle(fontSize: 30),
              ),
              subtitle: Text("ราคา" + food.price + "บาท"),
              onTap: () {
                AlertDialog alert = AlertDialog(
                  title: Text("คุณเลือกเมนู คือ " + food.name),
                );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              },
            );
          },
        ));
  }

  List<Widget> getData(int count) {
    List<Widget> data = [];

    data.add(
      Text(
        "กดปุ่ม เพื่อค่า ตัวเลข",
        style: TextStyle(fontSize: 40, color: Colors.red),
      ),
    );
    data.add(Text(
      number.toString(),
      style: TextStyle(fontSize: 60),
    ));
    data.add(Text("ทดสอบ List"));
    data.add(Text("ทดสอบ List"));
    for (var i = 1; i <= count; i++) {
      data.add(Text("ทดสอบ List with for รอบที่ $i"));
    }
    return data;
  }
}
