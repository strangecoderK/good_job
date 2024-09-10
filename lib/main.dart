import 'package:flutter/material.dart';
import 'package:good_job/config/router/router.dart';
import 'package:good_job/domain/model/sheet.dart';
import 'package:good_job/domain/model/sticker.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(StickerAdapter());
  Hive.registerAdapter(SheetAdapter());
  await Hive.openBox<Sticker>('stickers');
  await Hive.openBox<Sheet>('sheets');

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
    );
  }
}
