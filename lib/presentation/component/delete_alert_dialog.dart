import 'package:flutter/material.dart';
import 'package:good_job/ui/right_text_style.dart';

class DeleteAlertDialog extends StatelessWidget {
  final VoidCallback cancelOnTap;
  final VoidCallback okOnTap;

  const DeleteAlertDialog(
      {super.key, required this.cancelOnTap, required this.okOnTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        '삭제하기',
        style: RightTextStyle.largeTextBold,
      ),
      content: const Text(
        '챌린지를 정말 삭제하시겠어요?',
        style: RightTextStyle.largeTextRegular,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: cancelOnTap,
          child: const Text(
            '취소',
            style: RightTextStyle.largeTextRegular,
          ),
        ),
        TextButton(
          onPressed: okOnTap,
          child: const Text(
            '확인',
            style: RightTextStyle.largeTextRegular,
          ),
        ),
      ],
    );
  }
}
