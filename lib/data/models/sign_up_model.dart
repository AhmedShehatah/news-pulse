class SignUpModel {
  String? userName;
  String? email;
  String? password;

  SignUpModel({this.userName, this.email, this.password});

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        userName: json['user_name']?.toString(),
        email: json['email']?.toString(),
        password: json['password']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (userName != null) 'user_name': userName,
        if (email != null) 'email': email,
        if (password != null) 'password': password,
      };
}
