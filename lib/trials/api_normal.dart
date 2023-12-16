import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyApi extends StatefulWidget {
  const MyApi({super.key});

  @override
  State<MyApi> createState() => _MyApiState();
}

class _MyApiState extends State<MyApi> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  List<dynamic> data = [];

  Future getData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
      });
    } else {
      print("error to get data from api==${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: data.isNotEmpty
            ? ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> item = data[index];
                  return ListTile(
                    title: Text(item["title"]),
                    subtitle: Text(item["body"]),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
