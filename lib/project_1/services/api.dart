import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/post.dart';

class ApiServices{

  Future<List<Post>> getdata()async{
    //var uri="https://jsonplaceholder.typicode.com/posts";
   // final response;

var url=Uri.parse("https://jsonplaceholder.typicode.com/posts");
final response=await http.get(url);
if(response.statusCode == 200){
  List<dynamic> data=json.decode(response.body);
  List<Post> posts=data.map((e) => Post.fromJson(e)).toList();

  return posts;
}
else{
  throw Exception("failed to load posts");
}




}

}