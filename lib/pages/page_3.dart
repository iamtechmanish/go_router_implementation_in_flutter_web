import 'package:flutter/material.dart';
import 'package:routing_poc/main.dart';

class Page3 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(storage.read("TITLE_PAGE_3").toString()),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){

          },
          child: Text("Go to page 1"),
        ),
      ),
    );
  }
}
