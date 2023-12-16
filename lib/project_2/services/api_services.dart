import 'dart:convert';

import 'package:api_study/project_2/model/models.dart';
import 'package:http/http.dart' as http;
class ApiClass {

  Future<NumberModel> getNumber({required String number})async{
    var uri="http://numbersapi.com/$number?json";
    final response=await http.get(Uri.parse(uri));
   // print(response.body);
//List <dynamic> data=jsonDecode(response.body);
final body=jsonDecode(response.body) ;
final data=NumberModel.fromJson(body);
//print("////////////////////////////${data.text}////////////////");
return data;
  }
}
