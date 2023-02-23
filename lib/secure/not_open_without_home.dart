import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotOpenWithOutHome extends StatelessWidget {
  const NotOpenWithOutHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("No open without Home"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                context.goNamed("home");
              },
              child: Text("Go to home again"),
            )
          ],
        ),
      ),
    );
  }
}
