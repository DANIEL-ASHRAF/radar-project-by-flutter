// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;

import '../../landing_page.dart' as _i2;
import '../../views/launcher_view.dart' as _i5;
import '../../views/radar_view.dart' as _i4;
import '../../views/reset_password_view.dart' as _i6;
import '../../views/sign_in_view.dart' as _i3;

class Router extends _i1.RootStackRouter {
  Router();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LandingRoute.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry,
          child: _i2.LandingPage(),
          maintainState: true,
          fullscreenDialog: false);
    },
    SignInView.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry,
          child: _i3.SignInView(),
          maintainState: true,
          fullscreenDialog: false);
    },
    RadarView.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry,
          child: _i4.RadarView(),
          maintainState: true,
          fullscreenDialog: false);
    },
    LauncherView.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry,
          child: _i5.LauncherView(),
          maintainState: true,
          fullscreenDialog: false);
    },
    ResetPasswordView.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry,
          child: _i6.ResetPasswordView(),
          maintainState: true,
          fullscreenDialog: false);
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LandingRoute.name,
            path: '/', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(SignInView.name,
            path: '/sign-in-view', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(RadarView.name,
            path: '/radar-view', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(LauncherView.name,
            path: '/launcher-view', fullMatch: false, usesTabsRouter: false),
        _i1.RouteConfig(ResetPasswordView.name,
            path: '/reset-password-view',
            fullMatch: false,
            usesTabsRouter: false)
      ];
}

class LandingRoute extends _i1.PageRouteInfo {
  const LandingRoute() : super(name, path: '/');

  static const String name = 'LandingRoute';
}

class SignInView extends _i1.PageRouteInfo {
  const SignInView() : super(name, path: '/sign-in-view');

  static const String name = 'SignInView';
}

class RadarView extends _i1.PageRouteInfo {
  const RadarView() : super(name, path: '/radar-view');

  static const String name = 'RadarView';
}

class LauncherView extends _i1.PageRouteInfo {
  const LauncherView() : super(name, path: '/launcher-view');

  static const String name = 'LauncherView';
}

class ResetPasswordView extends _i1.PageRouteInfo {
  const ResetPasswordView() : super(name, path: '/reset-password-view');

  static const String name = 'ResetPasswordView';
}
