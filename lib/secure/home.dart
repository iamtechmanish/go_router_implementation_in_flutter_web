import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            ElevatedButton(
              onPressed: (){
                context.goNamed("profile");
              },
              child: Text("Go to Profile Page"),
            ),
            SizedBox(height: 100,),
            ElevatedButton(
              onPressed: (){
                storage.write("IS_LOGIN", "false");
                context.goNamed("login");
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
