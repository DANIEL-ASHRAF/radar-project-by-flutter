// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../landing_page.dart';
import '../../views/launcher_view.dart';
import '../../views/radar_view.dart';
import '../../views/reset_password_view.dart';
import '../../views/sign_in_view.dart';

class Routes {
  static const String landingPage = '/';
  static const String signInView = '/sign-in-view';
  static const String radarView = '/radar-view';
  static const String launcherView = '/launcher-view';
  static const String resetPasswordView = '/reset-password-view';
  static const all = <String>{
    landingPage,
    signInView,
    radarView,
    launcherView,
    resetPasswordView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.landingPage, page: LandingPage),
    RouteDef(Routes.signInView, page: SignInView),
    RouteDef(Routes.radarView, page: RadarView),
    RouteDef(Routes.launcherView, page: LauncherView),
    RouteDef(Routes.resetPasswordView, page: ResetPasswordView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    LandingPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LandingPage(),
        settings: data,
      );
    },
    SignInView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignInView(),
        settings: data,
      );
    },
    RadarView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RadarView(),
        settings: data,
      );
    },
    LauncherView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LauncherView(),
        settings: data,
      );
    },
    ResetPasswordView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ResetPasswordView(),
        settings: data,
      );
    },
  };
}
