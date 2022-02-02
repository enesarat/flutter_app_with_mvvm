import 'package:complete_flutter_app/presentation/forgot_password/forgot_password.dart';
import 'package:complete_flutter_app/presentation/login/login.dart';
import 'package:complete_flutter_app/presentation/main/main.dart';
import 'package:complete_flutter_app/presentation/onboarding/onboarding.dart';
import 'package:complete_flutter_app/presentation/register/register.dart';
import 'package:complete_flutter_app/presentation/resources/string_manager.dart';
import 'package:complete_flutter_app/presentation/splash/splash.dart';
import 'package:complete_flutter_app/presentation/store_details/store_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes{
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(
        builder: (_)=>Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.noRouteFound),
          ),
          body: Center(child:Text(AppStrings.noRouteFound)),
        ));
  }
}