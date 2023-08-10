import 'dart:io';

class AddNewsModel {
  String? title;
  String? content;
  File? image;
  String? imageUrl;

  AddNewsModel({this.title, this.content, this.image, this.imageUrl});

  factory AddNewsModel.fromJson(Map<String, dynamic> json) => AddNewsModel(
        title: json['title'] as String?,
        content: json['content'] as String?,
        imageUrl: json['image_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'image_url': imageUrl,
      };
}
