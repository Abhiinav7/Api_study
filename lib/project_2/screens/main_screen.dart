import 'package:flutter/material.dart';

import '../model/models.dart';
import '../services/api_services.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {

  ApiClass apiclass = ApiClass();
  TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                controller: number,
                decoration: InputDecoration(
                    hintText: "Enter number", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    final _number = number.text;

                    final items = await apiclass.getNumber(number: _number);

print("///////////////////////////${items.text}/////////////////");
                  },
                  child: Text("get"),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
