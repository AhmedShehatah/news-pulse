class ShowNews {
  String? id;
  String? title;
  String? publisher;
  String? imageUrl;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ShowNews({
    this.id,
    this.title,
    this.publisher,
    this.imageUrl,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ShowNews.fromJson(Map<String, dynamic> json) => ShowNews(
        id: json['_id'] as String?,
        title: json['title'] as String?,
        publisher: json['publisher'] as String?,
        imageUrl: json['image_url'] as String?,
        content: json['content'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
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
