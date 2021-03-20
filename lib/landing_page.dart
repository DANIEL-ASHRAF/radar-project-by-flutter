import 'package:flutter/material.dart';
import 'package:radar_project_app/services/auth.dart';
import 'package:radar_project_app/services/locator/locator.dart';
import 'package:radar_project_app/views/radar_view.dart';
import 'package:radar_project_app/views/sign_in_view.dart';
import 'home/home_page.dart';

class LandingPage extends StatelessWidget {
  final Auth auth=locator<Auth>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserFromFirebase?>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            UserFromFirebase? user = snapshot.data;
            if (user == null) {
              return SignInView();
            }
            return HomePage();

          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(strokeWidth: 5,),
              ),
            );
          }
        });
  }
}
