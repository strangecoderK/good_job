import 'package:flutter/material.dart';
import 'package:good_job/ui/right_text_style.dart';

class PickUpButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  const PickUpButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    // required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 5.0,
          right: 5.0,
        ),
        child: GestureDetector(
          onTap:onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected
                  ? const Color(0xFF7B9A5F)
                  : const Color(0xFFF0F2E2),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: RightTextStyle.largeTextBold
                      .copyWith(color: const Color(0xFF004000)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
