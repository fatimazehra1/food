class Categories {
  final String? id;
  final String? name;
  final String? image;
  final String? categoryCode;
  final String? categoryType;

  Categories({
    required this.id,
    this.name,
    this.image,
    this.categoryCode,
    this.categoryType,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      categoryCode: json['categoryCode'],
      categoryType: json['categoryType'],
    );
  }
}
