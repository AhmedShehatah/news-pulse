class Data {
  String? userName;
  String? email;
  String? id;

  Data({this.userName, this.email, this.id});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userName: json['user_name'] as String?,
        email: json['email'] as String?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user_name': userName,
        'email': email,
        'id': id,
      };
}
