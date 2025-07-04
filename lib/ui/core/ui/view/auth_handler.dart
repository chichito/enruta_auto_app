import 'package:enruta_auto_app/ui/core/navigation/app_navigator.dart';
import 'package:enruta_auto_app/ui/home/bloc/data_store_bloc.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    /*SchedulerBinding.instance.addPostFrameCallback((_) {
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        AppNavigator.home,
        (route) => false,
      );
    });
    return child;*/
    return BlocListener<DataStoreBloc, DataStoreState>(
      listener: (context, state) {
        if (state is AuthStatusValid) {
          navigatorKey.currentState?.pushNamedAndRemoveUntil(
            AppNavigator.home,
            (route) => false,
          );
        } else if (state is AuthStatusInValid) {
          navigatorKey.currentState?.pushNamedAndRemoveUntil(
            AppNavigator.data,
            (route) => false,
          );
        }
      },
      child: child,
    );
  }
}
