
import'package:auto_route/auto_route_annotations.dart';
import 'package:radar_project_app/landing_page.dart';
import 'package:radar_project_app/views/launcher_view.dart';
import 'package:radar_project_app/views/radar_view.dart';
import 'package:radar_project_app/views/reset_password_view.dart';
import 'package:radar_project_app/views/sign_in_view.dart';
@autoRouter
class $Router{
  @initial
  LandingPage landingPage;
  SignInView signInView;
  RadarView radarView;
  LauncherView launcherView;
  ResetPasswordView resetPasswordView;
}