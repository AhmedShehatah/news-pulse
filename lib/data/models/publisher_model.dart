class PublisherModel {
  String? userName;
  String? token;

  PublisherModel({this.userName, this.token});

  factory PublisherModel.fromJson(Map<String, dynamic> json) {
    return PublisherModel(
      userName: json['user_name'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'user_name': userName,
        'token': token,
      };
}
