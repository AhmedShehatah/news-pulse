class SignInModel {
  String? email;
  String? password;

  SignInModel({this.email, this.password});

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        email: json['email'] as String?,
        password: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
