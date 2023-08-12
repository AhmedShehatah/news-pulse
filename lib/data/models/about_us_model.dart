class AboutUsModel {
  String? id;
  String? imageUrl;
  String? content;

  AboutUsModel({this.id, this.imageUrl, this.content});

  factory AboutUsModel.fromJson(Map<String, dynamic> json) => AboutUsModel(
        id: json['_id'] as String?,
        imageUrl: json['image_url'] as String?,
        content: json['content'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'image_url': imageUrl,
        'content': content,
      };
}
