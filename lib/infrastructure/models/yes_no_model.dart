// To parse this JSON data, do
//
//     final yesNoAnswerModel = yesNoAnswerModelFromJson(jsonString);

import 'dart:convert';

import '../../domain/entity/message.dart';

YesNoAnswerModel yesNoAnswerModelFromJson(String str) => YesNoAnswerModel.fromJsonMap(json.decode(str));

String yesNoAnswerModelToJson(YesNoAnswerModel data) => json.encode(data.toJson());

class YesNoAnswerModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoAnswerModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoAnswerModel.fromJsonMap(Map<String, dynamic> json) => YesNoAnswerModel(
    answer: json["answer"],
    forced: json["forced"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "answer": answer,
    "forced": forced,
    "image": image,
  };

  Message toMessageEntity() => Message(
    text: answer,
    fromWho: FromWho.hers,
    imageUrl: image
  );
}
