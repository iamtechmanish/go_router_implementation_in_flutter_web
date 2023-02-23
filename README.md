# routing_poc

go_router Routing POC for flutter web

## Getting Started

POC for redirection in go_router is done by this we fixed :
* user was able to access public routes even after login and was able to access secure routes without login ,
* even after logout on browser back button user was able to access secure routes
* there are some sensitive routes which we only wants to open after a specific screen like OTP page but user was able to access otp page by forword button of browser.
* disable opening secure routes manually by entering in address bar of browser and same for public routes when user is already logged.
* like this there are more functionality issues we were facing because go_router does not support Navigator.removeRoute , Navigator.popUntil , Navigator.pushAndRemoveUntil , Navigator.replace.
>we are using go_router because it enable us to use Material.router widget in declarative way.
so in order to fix above issues we have divided our routes in public and secure types and configured global redirection policy which can listen to global auth service.
* this implementation also supports deeplinking. ex. user clicks on secure routes (https://domain.com/secure/myprofile) but before that we need to authenticate the user and the redirect to the required route.
* go_router also support individual route redirection, as of now number of redirection limit per route is 5.

