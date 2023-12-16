import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../models/post.dart';
import '../services/api.dart';
class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    httpService.getdata();
  }
  final ApiServices httpService =ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: FutureBuilder(
    future: httpService.getdata(),
    builder: (context, snapshot) {
      if(snapshot.hasData){
        List<Post>? p=snapshot.data;
        return ListView.builder(
            itemCount: p!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(p[index].title),
              );
            },);
      }
      else {
        return Center(child: CircularProgressIndicator());
      }
    }
    ),    );
  }
}
