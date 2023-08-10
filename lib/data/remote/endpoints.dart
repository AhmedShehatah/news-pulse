class AppEndpoints {
  static const baseUrl = "https://studentsystem.onrender.com";
  static const version = "/api/v1";

  // receiveTimeout
  static const Duration receiveTimeout = Duration(milliseconds: 15000);

  // connectTimeout
  static const Duration connectionTimeout = Duration(milliseconds: 30000);

  // put your endpoints here

  // ex
  // static const String login = "/login";
  // static const String publisher = "/publisher";
  // static const String publisherNews = "$publisher/news";
  static const String news = "$version/news";
  static var contactUs = "$version/contact";
  static const String signIn = "$version/auth/login";
  static const String signUp = "$version/auth/signup";
  static const String upload = "/uploads";
}
