import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Register"),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 100,),
              ElevatedButton(
                onPressed: (){
                  context.goNamed("login");
                },
                child: Text("Go to Login"),
              ),
              SizedBox(height: 100,),
              ElevatedButton(
                onPressed: (){
                  context.goNamed("otp", queryParams: {
                    "email" : "test@gmail.com"
                  });
                },
                child: Text("Go to OTP"),
              ),
            ],
          ),
        ),
      );
  }
}
