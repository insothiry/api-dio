import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioConsole extends StatefulWidget {
  const DioConsole({super.key});

  @override
  _DioConsoleState createState() => _DioConsoleState();
}

class _DioConsoleState extends State<DioConsole> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final dio = Dio();
    try {
      // Perform GET request
      final responseGet =
          await dio.get('https://jsonplaceholder.typicode.com/todos/1');

      // Perform POST request
      final responsePost = await dio.post(
        'https://jsonplaceholder.typicode.com/posts',
        data: {
          'title': 'My Post',
          'body': 'This is my post content',
          'userId': 1,
        },
      );

      // Perform PUT request
      final responsePut =
          await dio.put('https://jsonplaceholder.typicode.com/posts/1', data: {
        'title': 'My Other Post',
        'body': 'This is my another post content',
        'userId': 111,
      });

      // Perform DELETE request
      final responseDelete =
          await dio.delete('https://jsonplaceholder.typicode.com/todos/1');

      // Print the responses
      print('GET response: ${responseGet.data}');
      print('POST response: ${responsePost.data}');
      print('PUT response: ${responsePut.data}');
      print('DELETE response: data deleted');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio Example'),
      ),
      body: const Center(
        child: Text('Check console for fetched data.'),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: DioConsole(),
  ));
}
