class AppEndpoints {
  static const baseUrl = "https://studentsystem.onrender.com/api/v1";

  // receiveTimeout
  static const Duration receiveTimeout = Duration(milliseconds: 15000);

  // connectTimeout
  static const Duration connectionTimeout = Duration(milliseconds: 30000);

  // put your endpoints here

  // ex
  // static const String login = "/login";
  // static const String publisher = "/publisher";
  // static const String publisherNews = "$publisher/news";
  static const String news = "/news";
  static var contactUs = "/contact";
  static const String signIn = "/auth/login";

}
