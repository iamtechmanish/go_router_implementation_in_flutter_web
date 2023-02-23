import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:routing_poc/pages/error_screen.dart';
import 'package:routing_poc/pages/page_1.dart';
import 'package:routing_poc/pages/page_2.dart';
import 'package:routing_poc/pages/page_3.dart';
import 'package:routing_poc/public/login.dart';
import 'package:routing_poc/public/otp.dart';
import 'package:routing_poc/public/public.dart';
import 'package:routing_poc/public/register.dart';
import 'package:routing_poc/secure/home.dart';
import 'package:routing_poc/secure/not_open_without_home.dart';
import 'package:routing_poc/secure/profile.dart';
import 'package:url_strategy/url_strategy.dart';

final storage = GetStorage();

void main() async {
  setPathUrlStrategy();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    errorBuilder: (context, state) => const ErrorScreen(),

    redirect: (context, state) {
      /// we define the path and redirect directives
      /// see the logic redirect
      final bool userAuthenticated = storage.read("IS_LOGIN").toString()=="true";
      final bool onPublicPages = state.location.contains("/public");
      final bool onSecurePages = state.location.contains("/secure");
      final String deepLinkRoute = Uri.parse(state.location.toString()).path;

      print("her: "+deepLinkRoute);
      if (!userAuthenticated && !onPublicPages) {
        if(onSecurePages){
          return '/public/login?from=$deepLinkRoute';
        }
        else {
          return '/public/login';
        }

      }
      if (userAuthenticated && onPublicPages) {
        return '/secure/home';
      }
      print("nn");
      //you must include this. so if condition not meet, there is no redirect
      return null;
    },
    routes: [
      GoRoute(
          name: 'page1',
          path: '/',
          builder: (context, state) {
            print("mai chla tbhi yeh chle");
            return const Splash();
          },),
      GoRoute(
          path: '/public',
          builder: (context, state) {
            // this will be called every time when we open any public route (initsate method will be executed of returning statefull widget)
            return Container();
  },
          redirect: (context, state) {
            if(state.location == '/public'){
            return   '/public/login' ;
            };
            return null ;
          },
          routes: [
            GoRoute(
              name: 'login',
              path: 'login',
              builder: (context, state) {
                return LoginPage(from: state.queryParams['from'],);
              },
            ),
            GoRoute(
              name: 'register',
              path: 'register',
              builder: (context, state) {
                return RegisterPage();
              },
            ),
            GoRoute(
              name: 'otp',
              path: 'otp',
              redirect: (context, state){
                if(state.queryParams["email"]==null){
                  return '/public/register';
                }
                return null ;
              },
              builder: (context, state) {
                return OtpScreen();
              },
            ),
          ]),
      GoRoute(path: '/secure',
          builder: (context, state) {
            return Container();
          },
          redirect: (context, state) {
            if(state.location == '/secure'){
              return   '/secure/home' ;
            };
           return null ;
          },
          routes: [
            GoRoute(
              name: 'home',
              path: 'home',
              builder: (context, state) {
                return HomePage();
              },
            ),
            GoRoute(
              name: 'profile',
              path: 'profile',
              builder: (context, state) {
                return ProfilePage();
              },
            ),
            GoRoute(
              name: 'not-open-without-homepage',
              path: 'not-open-without-homepage',
              builder: (context, state) {
                return NotOpenWithOutHome();
              },
            )
          ])

    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with 'flutter run'. You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // 'hot reload' (press 'r' in the console where you ran 'flutter run',
        // or simply save your changes to 'hot reload' in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
    );
  }
}
