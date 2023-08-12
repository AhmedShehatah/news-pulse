import 'data.dart';

class PublisherModel {
  Data? data;
  String? token;

  PublisherModel({this.data, this.token});

  factory PublisherModel.fromJson(Map<String, dynamic> json) {
    return PublisherModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'token': token,
      };
}
