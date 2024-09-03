import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:good_job/ui/text_styles.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '나의 습관',
          style: TextStyles.largeTextBold,
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '챌린지 목록이 비었어요',
              style: TextStyles.largeTextBold,
            ),
            const Text(
              '아래의 버튼을 눌러 새로운 습관 챌린지를 만들어볼까요?',
              style: TextStyles.largeTextBold,
            ),
            IconButton(
              onPressed: () {
                context.push('/make-sheet');
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
