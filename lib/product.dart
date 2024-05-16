import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final ProductRating rating;

  const Product({
    Key? key,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.rating,
    required this.image,
  }) : super(key: key);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(), // Convert to double
      description: json['description'],
      category: json['category'],
      rating: ProductRating.fromJson(json['rating']),
      image: json['image'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ProductRating {
  final double rate;
  final int count;

  const ProductRating({
    required this.rate,
    required this.count,
  });

  factory ProductRating.fromJson(Map<String, dynamic> json) {
    return ProductRating(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }
}
