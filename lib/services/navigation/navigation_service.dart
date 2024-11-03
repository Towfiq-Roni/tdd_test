import 'package:flutter/material.dart';
import 'package:tdd_test/res/routes/route_paths.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  BuildContext? getContext() {
    return navigatorKey.currentContext;
  }

  static Future<dynamic> navigateTo(String routeName,
      {dynamic arguments}) async {
    if (navigatorKey.currentState != null) {
      return navigatorKey.currentState!
          .pushNamed(routeName, arguments: arguments);
    } else {
      return Future.error("Navigator key is not set");
    }
  }

  static Future<dynamic> navigateReplaced(String routeName,
      {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  static dynamic goBack([dynamic popValue]) {
    if (navigatorKey.currentState != null) {
      return navigatorKey.currentState!.pop(popValue);
    }
  }

  static dynamic popUntil(String routeName) {
    return navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }

  static Future<dynamic> navigateRemoveUntil(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }

  static void navigateToLoginAndClearStack(Widget widget) {
    navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false);
  }

  static Future<void> logoutAndNavigateToLoginScreen() async {
    BuildContext context = navigatorKey.currentContext!;
    Navigator.of(context).pushNamedAndRemoveUntil(
        RoutePaths.authenticationScreen, (Route<dynamic> route) => false);
  }
}
