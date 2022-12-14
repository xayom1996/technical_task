class Exhibit {
  const Exhibit({
    required this.title,
    required this.images
  });

  final String title;
  final List<String> images;

  factory Exhibit.fromJson(Map<String, dynamic> json) => Exhibit(
    title: json['title'],
    images: List.from(json['images'].map((image) => image.toString())),
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'images': images,
  };
}