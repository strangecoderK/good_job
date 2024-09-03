import 'package:flutter/material.dart';
import 'package:good_job/presentation/component/input_text_field.dart';

class MakeSheetScreen extends StatefulWidget {
  const MakeSheetScreen({super.key});

  @override
  State<MakeSheetScreen> createState() => _MakeSheetScreenState();
}

class _MakeSheetScreenState extends State<MakeSheetScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('새로운 챌린지 만들기'),
      ),
      body: Column(
        children: [
          InputTextField(
              title: '챌린지 이름',
              hintText: '3글자 이상으로 적어주세요!',
              controller: controller),
        ],
      ),
    );
  }
}
