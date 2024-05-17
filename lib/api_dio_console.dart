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
    final cancelToken = CancelToken();

    // Add Interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add a custom header to the request
          options.headers['Authorization'] = 'Bearer my_token';
          return handler.next(options);
        },
      ),
    );

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

      // Interceptor GET request
      final responseInterceptor =
          await dio.get('https://jsonplaceholder.typicode.com/todos/1');

      // Simulate a request that gets canceled
      Future.delayed(Duration(milliseconds: 100), () {
        cancelToken.cancel('Request cancelled');
      });

      try {
        final responseCancel = await dio.get(
          'https://jsonplaceholder.typicode.com/todos/1',
          cancelToken: cancelToken,
        );
        print('Cancel Request: ${responseCancel.data}');
      } catch (e) {
        if (CancelToken.isCancel(true as DioException)) {
          print('Request was cancelled: $e');
        } else {
          print('Error: $e');
        }
      }

      // Print the responses
      print('GET response: ${responseGet.data}');
      print('POST response: ${responsePost.data}');
      print('PUT response: ${responsePut.data}');
      print('DELETE response: ${responseDelete.data}');
      print('GET with Interceptor response: ${responseInterceptor.data}');
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
