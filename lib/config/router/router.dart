import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:good_job/data/repository/sheet_repository_impl.dart';
import 'package:good_job/data/repository/sticker_repository_impl.dart';
import 'package:good_job/domain/model/sheet.dart';
import 'package:good_job/presentation/screen/main/main_screen.dart';
import 'package:good_job/presentation/screen/main/main_view_model.dart';
import 'package:good_job/presentation/screen/make_sheet/make_sheet_screen.dart';
import 'package:good_job/presentation/screen/make_sheet/make_sheet_view_model.dart';
import 'package:good_job/presentation/screen/sheets/fifteen/sheet_for_fifteen.dart';
import 'package:good_job/presentation/screen/sheets/fifteen/sheet_for_fifteen_view_model.dart';
import 'package:good_job/presentation/screen/sheets/ten/sheet_for_ten.dart';
import 'package:good_job/presentation/screen/sheets/ten/sheet_for_ten_view_model.dart';
import 'package:good_job/presentation/screen/sheets/thirty/sheet_for_thirty_view_model.dart';
import 'package:good_job/presentation/screen/sheets/twenty/sheet_for_twenty.dart';
import 'package:good_job/presentation/screen/sheets/twenty/sheet_for_twenty_view_model.dart';
import 'package:good_job/presentation/screen/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:good_job/presentation/screen/sheets/thirty/sheet_for_thirty.dart';

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
          create: (BuildContext context) =>
              MakeSheetViewModel(repository: SheetRepositoryImpl()),
          child: const MakeSheetScreen(),
        );
      },
    ),
    GoRoute(
      path: '/sheet-10',
      builder: (context, state) {
        final sheet = state.extra as Sheet;
        return ChangeNotifierProvider<SheetForTenViewModel>(
          create: (BuildContext context) => SheetForTenViewModel(
              stickerRepository: StickerRepositoryImpl(),
              sheetRepository: SheetRepositoryImpl()),
          child: SheetForTen(sheet: sheet),
        );
      },
    ),
    GoRoute(
      path: '/sheet-15',
      builder: (context, state) {
        final sheet = state.extra as Sheet;
        return ChangeNotifierProvider<SheetForFifteenViewModel>(
          create: (BuildContext context) => SheetForFifteenViewModel(
              stickerRepository: StickerRepositoryImpl(),
              sheetRepository: SheetRepositoryImpl()),
          child: SheetForFifteen(sheet: sheet),
        );
      },
    ),
    GoRoute(
      path: '/sheet-20',
      builder: (context, state) {
        final sheet = state.extra as Sheet;
        return ChangeNotifierProvider<SheetForTwentyViewModel>(
          create: (BuildContext context) => SheetForTwentyViewModel(
              stickerRepository: StickerRepositoryImpl(),
              sheetRepository: SheetRepositoryImpl()),
          child: SheetForTwenty(sheet: sheet),
        );
      },
    ),
    GoRoute(
      path: '/sheet-30',
      builder: (context, state) {
        final sheet = state.extra as Sheet;
        return ChangeNotifierProvider<SheetForThirtyViewModel>(
          create: (BuildContext context) => SheetForThirtyViewModel(
              stickerRepository: StickerRepositoryImpl(),
              sheetRepository: SheetRepositoryImpl()),
          child: SheetForThirty(sheet: sheet),
        );
      },
    ),
  ],
);
