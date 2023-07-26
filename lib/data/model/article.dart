import 'comment.dart';

class Article {
  String id;
  String title;
  String description;
  String images;
  Map<String, Comments>? comments;
  DateTime createdAt;

  Article({
    this.id = 'AF20SK',
    this.title = 'Default Article',
    this.description = 'Default Description',
    this.images = '',
    required this.createdAt,
    Map<String, Comments>? comment,
  }) : comments = comment ?? <String, Comments>{};

  factory Article.fromJson(Map<String, dynamic> json) {
    Article data = Article(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      images: json['images'],
      createdAt: DateTime.parse(json['createdAt']),
    );

    if (json.containsKey('comments')) {
      Map<String, Comments> buffer = {};
      for (Map<String, dynamic> i in json['comments']) {
        buffer['comments'] = Comments.fromJson(i);
      }

      data.comments = buffer;
    }

    return data;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> buffer = {
      'id': id,
      'title': title,
      'description': description,
      'images': images,
      'createdAt': createdAt.toIso8601String(),
    };

    if (comments != null) {
      buffer['comments'] = comments;
    }

    return buffer;
  }
}
