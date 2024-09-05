import 'package:flutter/material.dart';
import 'package:good_job/presentation/component/big_button.dart';
import 'package:good_job/presentation/component/input_text_field.dart';
import 'package:good_job/presentation/component/pick_up_button.dart';
import 'package:good_job/ui/right_text_style.dart';

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
        title: const Text('새로운 챌린지 만들기', style: RightTextStyle.headerTextBold),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputTextField(
              title: '챌린지 이름',
              hintText: '3글자 이상으로 적어주세요!',
              controller: controller),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              '며칠동안 도전해볼까요?',
              style: RightTextStyle.largeTextBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
            ),
            child: Row(
              children: [
                PickUpButton(
                  text: '10일',
                  // onTap: () {},
                ),
                PickUpButton(
                  text: '15일',
                  // onTap: () {},
                ),
                PickUpButton(
                  text: '20일',
                  // onTap: () {},
                ),
                PickUpButton(
                  text: '30일',
                  // onTap: () {},
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          const BigButton(text: '만들기'),
        ],
      ),
    );
  }
}
