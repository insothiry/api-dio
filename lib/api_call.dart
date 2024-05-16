import 'dart:convert';

import 'package:api_dio/display_product.dart';
import 'package:api_dio/product.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiCall extends StatelessWidget {
  Future<List<Product>> fetchAPI() async {
    Dio dio = Dio();

    var response = await dio.get('https://fakestoreapi.com/products');
    print(response.data.toString());

    final List<dynamic> responseData = response.data;
    List<Product> products =
        responseData.map((json) => Product.fromJson(json)).toList();
    print(response.data.toString());

    return products;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: fetchAPI(),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DisplayProduct(
                        productTitle: snapshot.data![index].title,
                        productPrice: snapshot.data![index].price.toString(),
                        productDescription: snapshot.data![index].description,
                        productRating:
                            snapshot.data![index].rating.rate.toString(),
                        productCount:
                            snapshot.data![index].rating.count.toString(),
                      ),
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    title: Text(snapshot.data![index].title),
                    subtitle: Text(
                        '\$${snapshot.data![index].price.toString()}'), // Convert double to string
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
