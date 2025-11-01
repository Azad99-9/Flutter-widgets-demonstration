import 'dart:convert';

import 'package:first_project/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class PostService {
  final List<Post> posts = [];
  // get using http
  Future<void> fetchPostsByHTTP() async {
    final url = Uri.parse('http://jsonplaceholder.typicode.com/posts');

    try {
      // error prone

      // 1. step 1
      // 2. step 2 (might throw error)
      // 3. step 3 (finishing)


      // [
      //   post1 in json format
      //   post2 in json format
      //   post3 in json format
      // ]
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        for (var jsonData in data) {
          print(jsonData);
          final post = Post.fromJson(jsonData);
          print(post.toString());
          posts.add(post);
          print("");
        }

      } else {
        print('Failed: ${response.statusCode}, failed to fetch posts');
      }


    } catch (error) {
      // if something goes wrong in try block the control flow will be directly given to me i.e catch block
    }
  }

  // get using dio
  Future<void> fetchPostsWithDio() async {
  try {
    final response = await Dio().get('http://jsonplaceholder.typicode.com/posts');
    print('Fetched ${response.data.length} posts');
  } 
  on DioException catch (e) {
    print('Dio error: ${e.message}');
  }
}

  Future<void> createPostByHttp() async {
    final response = await http.post(
      Uri.parse('http://jsonplaceholder.typicode.com/posts'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': 'Hello HTTP',
        'body': 'Posting data with HTTP package',
        'userId': 1,
      }),
    );
    print(response.statusCode);
    print(response.body);

    // try {
    // final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
    // } on DioException catch (e) {
    //   if (e.type == DioExceptionType.connectionTimeout) {
    //     print("Connection timed out");
    //   } else if (e.response?.statusCode == 404) {
    //     print("Resource not found");
    //   // } else {
    //   //   print("Unexpected error: ${e.message}");
    //   // }
    // } on someothernewexception catch(e) {

    // } finally {

    // }

  }
  
  Future<void> createPostByDio() async {
    try {
      final response = await Dio().post(
        'http://jsonplaceholder.typicode.com/posts',
        data: {
          'title': 'Hello Flutter',
          'body': 'This post was created using Dio!',
          'userId': 1,
        },
      );

      print('Created Post: ${response.statusCode}');
      print('Response: ${response.data}');
      final post = Post.fromJson(response.data);
      print('After parsing');
      print(post);
    } on DioException catch (e) {
      print('Error: ${e.message}');
    }
  }

}

void main() {
  final postService = PostService();
  // postService.fetchPosts();
  postService.createPostByHttp();

}