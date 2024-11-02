import 'package:flutter/material.dart';
import 'package:good_job/domain/model/sheet.dart';
import 'package:good_job/ui/right_text_style.dart';

class SheetTile extends StatelessWidget {
  final Sheet sheet;
  final VoidCallback onTap;

  const SheetTile({super.key, required this.sheet, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: sheet.count == 10
                      ? Image.asset(
                          'assets/10_0_1.png',
                          width: 50,
                          height: 50,
                        )
                      : sheet.count == 15
                          ? Image.asset(
                              'assets/15_0_0.png',
                              width: 50,
                              height: 50,
                            )
                          : sheet.count == 20
                              ? Image.asset(
                                  'assets/4.png',
                                  width: 50,
                                  height: 50,
                                )
                              : Image.asset(
                                  'assets/7.png',
                                  width: 50,
                                  height: 50,
                                ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sheet.name,
                        style: RightTextStyle.largeTextBold,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${sheet.id.split(' ')[0]} ~',
                            style: RightTextStyle.mediumTextRegular,
                          ),
                          Text(
                            '${sheet.filledCount}/${sheet.count}',
                            style: RightTextStyle.mediumTextRegular,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
