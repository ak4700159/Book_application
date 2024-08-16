class Book {
  Book(
    this.content, {
    required this.title,
    required this.author,
    required this.image,
    required this.publicher,
  });

  String title;
  String author;
  String image;
  String publicher;
  String? content;
  bool? isChecked = false;

  factory Book.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'image': String image,
        'author': String author,
        'publicher': String publicher,
        'title': String title,
        'content': String content,
      } =>
        Book(
          content,
          image: image,
          author: author,
          publicher: publicher,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
