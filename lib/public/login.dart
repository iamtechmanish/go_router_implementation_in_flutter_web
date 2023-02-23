import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';

class LoginPage extends StatelessWidget {
  final String? from;
  const LoginPage({this.from , Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Login Page"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            ElevatedButton(
              onPressed: (){
                storage.write("IS_LOGIN", "true");

                if(from!=null){
                  context.go(from.toString());
                }
                else {
                  context.goNamed("home");
                }

              },
              child: Text("Go to Home Page"),
            ),
            SizedBox(height: 100,),
            ElevatedButton(
              onPressed: (){
                context.goNamed("register");
              },
              child: Text("Go to Register"),
            ),
          ],
        ),
      ),
    );
  }
}
