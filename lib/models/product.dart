import 'dart:convert';

class Product {
  final String name;
  final String description;
  final List<String> images;
  final String category;
  final bool isPerishable;
  final String? id;
  Product({
    required this.name,
    required this.description,

    required this.images,
    required this.category,
    required this.isPerishable,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'images': images,
      'category': category,
      'isPerishable': isPerishable,
      'id': id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      images: List<String>.from(map['images']),
      category: map['category'] ?? '',
      isPerishable: map['isPerishable']?? '',
      id: map['_id'],

    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}