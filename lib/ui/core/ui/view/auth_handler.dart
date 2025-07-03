import 'package:enruta_auto_app/ui/core/navigation/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AuthHandler extends StatelessWidget {
  const AuthHandler({
    super.key,
    required this.child,
    required this.navigatorKey,
  });

  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        AppNavigator.home,
        (route) => false,
      );
    });
    return child;
  }
}
