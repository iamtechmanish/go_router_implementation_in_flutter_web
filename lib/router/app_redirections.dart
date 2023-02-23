import 'dart:async';

import '../main.dart';

FutureOr<String?> appRedirections(context, state){

  /// we define the path and redirect directives
  /// see the logic redirect
  final bool userAuthenticated = storage.read("IS_LOGIN").toString()=="true";
  final bool onPublicPages = state.location.contains("/public");
  final bool onSecurePages = state.location.contains("/secure");
  final String deepLinkRoute = Uri.parse(state.location.toString()).path;

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
  //you must include this. so if condition not meet, there is no redirect
  return null;
}