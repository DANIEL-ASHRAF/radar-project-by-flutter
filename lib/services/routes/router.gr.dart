// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:radar_project_app/landing_page.dart';
import 'package:radar_project_app/views/sign_in_view.dart';
import 'package:radar_project_app/views/radar_view.dart';
import 'package:radar_project_app/views/launcher_view.dart';
import 'package:radar_project_app/views/reset_password_view.dart';

class Router {
  static const landingPage = '/';
  static const signInView = '/sign-in-view';
  static const radarView = '/radar-view';
  static const launcherView = '/launcher-view';
  static const resetPasswordView = '/reset-password-view';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Router>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.landingPage:
        return MaterialPageRoute(
          builder: (_) => LandingPage(),
          settings: settings,
        );
      case Router.signInView:
        return MaterialPageRoute(
          builder: (_) => SignInView(),
          settings: settings,
        );
      case Router.radarView:
        return MaterialPageRoute(
          builder: (_) => RadarView(),
          settings: settings,
        );
      case Router.launcherView:
        return MaterialPageRoute(
          builder: (_) => LauncherView(),
          settings: settings,
        );
      case Router.resetPasswordView:
        return MaterialPageRoute(
          builder: (_) => ResetPasswordView(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
