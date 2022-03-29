import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:asynchronous/quizModel.dart';

class quiz extends StatefulWidget {
  const quiz({Key? key, required String title}) : super(key: key);

  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> {
  late List<Quiz> quiz = [];
  int _choice = 0;
  late List<Quiz> myquiz = [];

  void loadjson() async {
    String data = await rootBundle.loadString("assets/data.json");
    final jsdata = quizFromJson(data);
    setState(() {
      quiz = jsdata;
      shuffle(quiz);

      for (var q in quiz) {
        print(q.title);
        shuffle(q.choice);
      }
    });
  }

  List shuffle(List items) {
    var random = new Random();
    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }
    return items;
  }

  @override
  void initState() {
    super.initState();
    loadjson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Test"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              loadjson();
            },
            child: const Text('Load Data'),
          ),
          quiz.isNotEmpty
              ? Expanded(
                  child: Column(
                  children: [
                    Text(quiz[0].title),
                    Expanded(
                        child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Radio(
                              value: index,
                              groupValue: _choice,
                              onChanged: (int? value) {
                                setState(() {
                                  _choice = value!;
                                  if (quiz[0].answerId ==
                                      quiz[0].choice[value].choiceid) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Correct'),
                                            content: Text('You Cool'),
                                          );
                                        });
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('In Correct'),
                                            content: Text("You Miss" +
                                                " " +
                                                quiz[0].answerId.toString() +
                                                " " +
                                                quiz[0]
                                                    .choice[value]
                                                    .choiceid
                                                    .toString()),
                                          );
                                        });
                                  }
                                });
                              }),
                          title: Text(quiz[0].choice[index].title),
                        );
                      },
                      itemCount: quiz[0].choice.length,
                    ))
                  ],
                ))
              : Container()
        ],
      ),
    );
  }
}
