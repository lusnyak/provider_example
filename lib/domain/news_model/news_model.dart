class NewsModel {
  String title;
  String description;
  String? imagePath;
  DateTime? dateTime;


  NewsModel({
    required this.title,
    required this.description,
    this.imagePath,
    this.dateTime,
  });
}
