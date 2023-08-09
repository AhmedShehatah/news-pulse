import 'dart:io';

class AddNewsModel {
  String? title;
  String? content;
  File? image;
  String? imageUrl;

  AddNewsModel({this.title, this.content});

  factory AddNewsModel.fromJson(Map<String, dynamic> json) => AddNewsModel(
        title: json['title'] as String?,
        content: json['content'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
      };
}
