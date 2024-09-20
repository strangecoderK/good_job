import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:good_job/domain/model/check.dart';
import 'package:good_job/ui/right_text_style.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Box<Check>? checkBox;

  @override
  void initState() {
    checkBox = Hive.box<Check>('check');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                'assets/splash.png',
                width: 70,
              ),
            ),
            const Text(
              '오늘도 좋은 습관을 만들러 가볼까요?',
              style: RightTextStyle.largerTextBold,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            TextButton(
              onPressed: () {
                final check = checkBox?.get(1);
                final firstCheck = Check(isFirstMake: true);
                if (check == null) {
                  checkBox?.put(1, firstCheck);
                }
                print(checkBox?.get(1));
                context.go('/main');
              },
              child: const Text(
                '좋아요!',
                style: RightTextStyle.largeTextBold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
