import 'package:flutter/material.dart';
import 'package:good_job/config/router/router.dart';
import 'package:good_job/domain/model/check.dart';
import 'package:good_job/domain/model/sheet.dart';
import 'package:good_job/domain/model/sticker.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Hive.initFlutter();
  Hive.registerAdapter(StickerAdapter());
  Hive.registerAdapter(SheetAdapter());
  Hive.registerAdapter(CheckAdapter());
  await Hive.openBox<Sticker>('stickers');
  await Hive.openBox<Sheet>('sheets');
  await Hive.openBox<Check>('check');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
