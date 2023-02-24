import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:routing_poc/router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';

final storage = GetStorage("TEST");

void main() async {
  setPathUrlStrategy();
  await GetStorage.init("TEST");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: 'Flutter Go Router Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
