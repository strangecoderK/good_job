import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:good_job/presentation/component/sheet_tile.dart';
import 'package:good_job/presentation/screen/main/main_view_model.dart';
import 'package:good_job/ui/right_text_style.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '나의 습관',
          style: RightTextStyle.headerTextBold,
        ),
      ),
      body: viewModel.sheets!.values.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '챌린지 목록이 비었어요',
                    style: RightTextStyle.largeTextBold,
                  ),
                  Text(
                    '아래의 + 버튼을 눌러 새로운 습관 챌린지를 만들어볼까요?',
                    style: RightTextStyle.largeTextBold,
                  ),
                ],
              ),
            )
          : ListView(
              children: viewModel.sheets!.values
                  .map((e) => SheetTile(sheet: e))
                  .toList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.go('/make-sheet');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
