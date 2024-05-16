import 'package:flutter/material.dart';

class DisplayProduct extends StatelessWidget {
  String? productTitle;
  String? productPrice;
  String? productDescription;
  String? productRating;
  String? productCount;

  DisplayProduct({
    required this.productTitle,
    required this.productPrice,
    required this.productDescription,
    required this.productRating,
    required this.productCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Column(
            children: [
              Text(
                productTitle.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                productPrice.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                productDescription.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              Text(
                'Rating: ${productRating.toString()}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
              Text(
                'Count: ${productCount.toString()}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
