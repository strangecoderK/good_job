import 'package:flutter/material.dart';
import 'package:good_job/ui/right_text_style.dart';

class ShowStickerContainer extends StatelessWidget {
  final String stickerPath;
  final String stickerName;

  const ShowStickerContainer({
    super.key,
    required this.stickerPath,
    required this.stickerName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Center(
        child: Column(
          children: [
            Image.asset(
              stickerPath,
              width: 60,
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('$stickerName 스티커를 붙일 수 있어요!',style: RightTextStyle.largeTextRegular, ),
            ),
          ],
        ),
      ),
    );
  }
}
