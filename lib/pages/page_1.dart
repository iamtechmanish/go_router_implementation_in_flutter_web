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
        child: ElevatedButton(
          onPressed: (){
            storage.write("TITLE_PAGE_2", "PAGE 2 From Storage");
            context.goNamed("page2", );
          },
            child: Text("Go to page 2"),
        ),
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      print("mai chla");
      // if(storage.read("IS_LOGIN").toString()=="true"){
      //   context.goNamed("home");
      // }
      // else {
      //   context.goNamed("login");
      // }


    });

  }
}