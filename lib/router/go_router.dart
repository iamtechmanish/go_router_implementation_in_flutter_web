import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';
import '../pages/error_screen.dart';
import '../pages/page_1.dart';
import '../public/login.dart';
import '../public/otp.dart';
import '../public/register.dart';
import '../secure/home.dart';
import '../secure/not_open_without_home.dart';
import '../secure/profile.dart';
import 'app_redirections.dart';

final GoRouter router = GoRouter(
  errorBuilder: (context, state) => const ErrorScreen(),
  redirect: appRedirections,
  routes: [
    GoRoute(
      name: 'page1',
      path: '/',
      builder: (context, state) {
        return const Splash();
      },
    ),
    GoRoute(
        path: '/public',
        builder: (context, state) {
          // this will be called every time when we open any public route (initsate method will be executed of returning statefull widget)
          return Container();
        },
        redirect: (context, state) {
          if (state.location == '/public') {
            return '/public/login';
          }
          ;
          return null;
        },
        routes: [
          GoRoute(
            name: 'login',
            path: 'login',
            builder: (context, state) {
              return LoginPage(
                from: state.queryParams['from'],
              );
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
            redirect: (context, state) {
              if (state.queryParams["email"] == null) {
                return '/public/register';
              }
              return null;
            },
            builder: (context, state) {
              return OtpScreen();
            },
          ),
        ]),
    GoRoute(
        path: '/secure',
        builder: (context, state) {
          return Container();
        },
        redirect: (context, state) {
          if (state.location == '/secure') {
            return '/secure/home';
          }
          ;
          return null;
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
