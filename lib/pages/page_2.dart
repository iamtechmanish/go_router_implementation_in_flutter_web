import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routing_poc/main.dart';

class Page2 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(storage.read("TITLE_PAGE_2").toString()),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            storage.write("TITLE_PAGE_3", "PAGE 3 From Storage");
            context.goNamed("page3");
          },
          child: Text("Go to page 3"),
        ),
      ),
    );
  }
}
