import 'package:flutter/material.dart';
import 'package:good_job/ui/right_text_style.dart';

class InputTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;

  const InputTextField(
      {super.key,
      required this.title,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: RightTextStyle.largeTextBold,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: hintText,
                hintStyle: RightTextStyle.largeTextRegular,
                errorStyle: TextStyle(
                  color: Colors.green,
                ),
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
              validator: (String? value) {
                return (value == null || value.length < 2)
                    ? '2글자 이상으로 적어주세요.'
                    : null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
