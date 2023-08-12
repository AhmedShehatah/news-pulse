class ContactUsModel {
  String? email;
  String? report;

  ContactUsModel({this.email, this.report});

  factory ContactUsModel.fromJson(Map<String, dynamic> json) {
    return ContactUsModel(
      email: json['email']?.toString(),
      report: json['report']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (email != null) 'email': email,
        if (report != null) 'report': report,
      };
}
