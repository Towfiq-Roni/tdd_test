import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tdd_test/features/counter/screen/screen_counter.dart';
import 'package:tdd_test/features/homepage/presentation/screen/screen_homepage.dart';
import 'package:tdd_test/features/list/presentation/screen/screen_list.dart';
import 'package:tdd_test/res/routes/route_paths.dart';

class AppRouter {
  static final widgetMap = <String, Widget Function(RouteSettings)>{
    RoutePaths.listScreen: (settings) => const ListScreen(),
    RoutePaths.counterScreen: (settings) => const CounterPage(),
    RoutePaths.homeScreen: (settings) => const ScreenHomepage(),
  };

  static Route generateRoute(RouteSettings settings) {
    Widget widget = widgetMap[settings.name]?.call(settings) ??
        Container(); // default to Container if route not found. Not found widget

    if (Platform.isIOS) {
      return MaterialPageRoute(
        builder: (context) {
          return PopScope(
            canPop: true,
            onPopInvoked: (didPop) async {
              if (didPop) return;
              _onPop(context);
            },
            child: widget,
          );
        },
        settings:
            RouteSettings(name: settings.name, arguments: settings.arguments),
      );
    }

    return _createRoute(settings, widget);
  }

  static Route<dynamic> _createRoute(
      final RouteSettings settings, final Widget widget) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      barrierColor: Colors.black,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static bool _onPop(BuildContext context) {
    if (Navigator.of(context).userGestureInProgress) {
      return false;
    }
    Navigator.of(context).pop();
    return true;
  }
}
