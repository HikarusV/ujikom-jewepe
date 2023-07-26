class Comments {
  String id;
  String comment;
  String username;
  String email;
  DateTime createdAt;

  Comments({
    this.id = 'FG45AA',
    this.comment =
        'Lorem ipsum dolor sit amet consectetur adipiscing elit proin, dictum tortor potenti natoque sollicitudin in aenean gravida facilisi, varius quisque purus non fringilla aptent cubilia.',
    this.username = 'default username',
    this.email = 'default@mail.com',
    required this.createdAt,
  });

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
      id: json['id'],
      comment: json['comment'],
      username: json['username'],
      email: json['email'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'comment': comment,
      'username': username,
      'email': email,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
