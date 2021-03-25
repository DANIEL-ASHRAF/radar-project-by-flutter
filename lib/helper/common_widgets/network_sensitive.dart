import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radar_project_app/services/internet_connectivity.dart';
import 'empty_content.dart';

class NetworkSensitive extends StatelessWidget {
  final Widget child;

  NetworkSensitive({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Get our connection status from the provider
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    if (connectionStatus != ConnectivityStatus.Offline) {
      return child;
    }else{
      return EmptyContent(title: "No Internet",message: "Check your connectivity");
    }
  }
}