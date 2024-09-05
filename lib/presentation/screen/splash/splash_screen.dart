import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:good_job/ui/right_text_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '오늘도 좋은 습관을 만들러 가볼까요?',
              style: RightTextStyle.largerTextBold,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            TextButton(
              onPressed: () {
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
