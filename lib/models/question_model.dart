// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';

QuestionModel questionModelFromJson(String str) =>
    QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
  QuestionModel({
    this.id,
    this.title,
    this.choices,
    this.answerId,
  });

  int id;
  String title;
  List<Choice> choices;
  int answerId;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        choices: json["choices"] == null
            ? null
            : List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
        answerId: json["answerID"] == null ? null : json["answerID"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "choices": choices == null
            ? null
            : List<dynamic>.from(choices.map((x) => x.toJson())),
        "answerID": answerId == null ? null : answerId,
      };
}

class Choice {
  Choice({
    this.id,
    this.title,
  });

  int id;
  String title;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
      };
}
