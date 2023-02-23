import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routing_poc/main.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}


class _SplashState extends State<Splash> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 1"),
      ),
      body: Center(
       child: Text("Splash Screen"),
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if(storage.read("IS_LOGIN").toString()=="true"){
        context.goNamed("home");
      }
      else {
        context.goNamed("login");
      }


    });

  }
}