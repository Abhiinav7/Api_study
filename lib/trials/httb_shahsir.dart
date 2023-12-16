import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MyHttp extends StatefulWidget {
  const MyHttp({super.key});

  @override
  State<MyHttp> createState() => _MyHttpState();
}

class _MyHttpState extends State<MyHttp> {
  var data;
  bool downloading = false;
  bool gotData = false;

  Future<bool> downloadData() async {
    var response;
    try {
      var url = Uri.parse('https://dummyjson.com/products/2');
      response = await http.get(url);
    } catch (e) {
      print("error=$e");
      return false;
    }
    print("data status code=${response.statusCode}");
    print("data=${response.body}");

    data = jsonDecode(response.body);
    print("json decoded=$data");
    print("title=${data["title"]}");

    setState(() {});
    return true;
  }

  Future<dynamic> post() async {
    var response;
    var data = {"title": "I am in love with someone.", "userId": "5"};
    try {
      var url = Uri.parse('https://dummyjson.com/posts/add');
      response = await http.post(url, body: data);
    } catch (e) {
      print("error =$e");
      return false;
    }
    print("data status code=${response.statusCode}");
    print("data  =${response.body}");


    return true;
  }

  Future <dynamic> put() async {
    var response;
    var data = {
      "title": "I think I should shift to the moon",
    };
    try {
      var url = Uri.parse('https://dummyjson.com/posts/1');
      response = await http.put(url, body: data);
    } catch (e) {
      print(("errror=$e"));
      return false;
    }

    print("data status code=${response.statusCode}");
    print("data=${response.body}");
    return true;
  }

  Future <dynamic> delete() async {
    var response;
    try {
      var url = Uri.parse('https://dummyjson.com/posts/1');
      response = await http.delete(url);
    } catch (e) {
      print("error=$e");
      return false;
    }
    print("status code=${response.statusCode}");
    print("data=${response.body}");
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            downloading
                ? Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.grey,
                    child: gotData
                        ? Column(
                            children: [
                              Text(
                                "Item=${data["title"]}",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "id=${data["id"]}",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "category=${data["category"]}",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "brand=${data["brand"]}",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "price=${data["price"]}",
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          )
                        : Center(
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child: CircularProgressIndicator(),
                            ),
                          ))
                : Container(
                    height: 300,
                    width: double.infinity,
                    color: Colors.grey,
                    child: Center(
                      child: Text("click get to download data"),
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    downloading = true;
                  });
                  gotData = await downloadData();
                },
                child: Text("Get")),
            ElevatedButton(
                onPressed: () {
                  post();
                },
                child: Text("post")),
            ElevatedButton(onPressed: () {put();}, child: Text("put")),
            ElevatedButton(onPressed: () {delete();}, child: Text("delete"))
          ],
        ),
      ),
    );
  }
}
