import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:good_job/ui/right_text_style.dart';

class BigButton extends StatefulWidget {
  final String text;
  final String? path;

  const BigButton({super.key, required this.text, this.path});

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 10,
          bottom: 10,
        ),
        child: GestureDetector(
          onTap: () {
            if (widget.path != null) {
              context.go(widget.path!);
            }
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF0F2E2),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  widget.text,
                  style: RightTextStyle.largeTextBold
                      .copyWith(color: const Color(0xFF004000)),
                ),
              ),
            ),
          ),
        ));
  }
}
