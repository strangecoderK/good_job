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
      child: GestureDetector(onTap: onTap,
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
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(Icons.pets),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sheet.name,
                        style: RightTextStyle.largeTextBold,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Align(alignment: Alignment.bottomRight,
                          child: Text(
                            '${sheet.filledCount}/${sheet.count}',
                            style: RightTextStyle.mediumTextRegular,
                          ),
                        ),
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
