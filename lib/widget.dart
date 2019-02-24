class Widget {
  Widget(
      {this.name,
      this.description,
      this.categories,
      this.subcategories,
      this.link,
      this.image});

  final String name;
  final String description;
  final List<String> categories;
  final List<String> subcategories;
  final String link;
  final String image;
  String ofwLink;

  Widget.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        categories = (json['categories'] as List<dynamic>).cast<String>(),
        subcategories = (json['subcategories'] as List<dynamic>).cast<String>(),
        link = json['link'],
        image = json['image'];
}
