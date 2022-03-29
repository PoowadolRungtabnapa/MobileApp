// To parse this JSON data, do
//
//     final quiz = quizFromJson(jsonString);

import 'dart:convert';

List<Quiz> quizFromJson(String str) =>
    List<Quiz>.from(json.decode(str).map((x) => Quiz.fromJson(x)));

String quizToJson(List<Quiz> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quiz {
  Quiz({
    required this.title,
    required this.choice,
    required this.answerId,
  });

  String title;
  List<Choice> choice;
  int answerId;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        title: json["title"],
        choice:
            List<Choice>.from(json["choice"].map((x) => Choice.fromJson(x))),
        answerId: json["answerID"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "choice": List<dynamic>.from(choice.map((x) => x.toJson())),
        "answerID": answerId,
      };
}

class Choice {
  Choice({
    required this.choiceid,
    required this.title,
  });

  int choiceid;
  String title;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        choiceid: json["choiceid"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "choiceid": choiceid,
        "title": title,
      };
}
