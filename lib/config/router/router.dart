import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:good_job/data/repository/sheet_repository_impl.dart';
import 'package:good_job/presentation/screen/main/main_screen.dart';
import 'package:good_job/presentation/screen/main/main_view_model.dart';
import 'package:good_job/presentation/screen/make_sheet/make_sheet_screen.dart';
import 'package:good_job/presentation/screen/make_sheet/make_sheet_view_model.dart';
import 'package:good_job/presentation/screen/splash/splash_screen.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (BuildContext context) =>
              MainViewModel(repository: SheetRepositoryImpl()),
          child: const MainScreen(),
        );
      },
    ),
    GoRoute(
      path: '/make-sheet',
      builder: (context, state) {
        return ChangeNotifierProvider<MakeSheetViewModel>(
          create: (BuildContext context) => MakeSheetViewModel(repository: SheetRepositoryImpl()),
          child: const MakeSheetScreen(),
        );
      },
    ),
  ],
);
