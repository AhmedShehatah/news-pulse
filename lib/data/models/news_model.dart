class NewsModel {
  String? id;
  String? title;
  String? publisher;
  String? imageUrl;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? v;

  NewsModel({
    this.id,
    this.title,
    this.publisher,
    this.imageUrl,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json['_id']?.toString(),
        title: json['title']?.toString(),
        publisher: json['publisher']?.toString(),
        imageUrl: json['image_url']?.toString(),
        content: json['content']?.toString(),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.tryParse(json['createdAt'].toString()),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.tryParse(json['updatedAt'].toString()),
        v: num.tryParse(json['__v'].toString()),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'publisher': publisher,
        'image_url': imageUrl,
        'content': content,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
