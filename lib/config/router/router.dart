import 'package:go_router/go_router.dart';
import 'package:good_job/presentation/screen/main/main_screen.dart';
import 'package:good_job/presentation/screen/make_sheet/make_sheet_screen.dart';
import 'package:good_job/presentation/screen/splash/splash_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/make-sheet',
      builder: (context, state) => const MakeSheetScreen(),
    ),
  ],
);
