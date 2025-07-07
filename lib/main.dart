import 'package:enruta_auto_app/ui/core/navigation/app_navigator.dart';
import 'package:enruta_auto_app/ui/core/themes/theme.dart';
import 'package:enruta_auto_app/ui/core/ui/view/auth_handler.dart';
import 'package:enruta_auto_app/ui/data/repository/post_repository.dart';
import 'package:enruta_auto_app/ui/home/bloc/datosenrutamiento/datosenrutamiento_bloc.dart';
import 'package:enruta_auto_app/ui/home/bloc/storage/data_store_bloc.dart';
import 'package:enruta_auto_app/ui/home/cubit/data/data_cubit.dart';
import 'package:enruta_auto_app/ui/home/cubit/hora/hora_cubit.dart';
import 'package:enruta_auto_app/ui/home/view/data_page.dart';
import 'package:enruta_auto_app/ui/home/view/home_page.dart';
import 'package:enruta_auto_app/ui/root/view/root_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataStoreBloc()..add(AppStarted()),
      child: AuthHandler(
        navigatorKey: navigatorKey,
        child: MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Flutter Demo',
          theme: AppTheme.light,
          routes: {
            AppNavigator.main: (_) => RootPage(),
            AppNavigator.data: (_) => MultiBlocProvider(
              //create: (context) => HoraCubit(),
              providers: [
                BlocProvider<HoraCubit>(create: (context) => HoraCubit()),
                BlocProvider<DataCubit>(create: (context) => DataCubit()),
              ],
              child: DataPage(),
            ),
            AppNavigator.home: (_) => MultiBlocProvider(
              providers: [
                BlocProvider<HoraCubit>(create: (context) => HoraCubit()),
                BlocProvider<DatosenrutamientoBloc>(
                  create: (context) =>
                      DatosenrutamientoBloc(PostRepository())
                        ..add(FetchPosts()),
                ),
              ],
              child: HomePage(),
            ),
          },
        ),
      ),
    );
  }
}
