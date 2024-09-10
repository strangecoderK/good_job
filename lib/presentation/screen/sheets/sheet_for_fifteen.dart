import 'package:flutter/material.dart';

class SheetForFifteen extends StatefulWidget {
  const SheetForFifteen({super.key});

  @override
  State<SheetForFifteen> createState() => _SheetForFifteenState();
}

class _SheetForFifteenState extends State<SheetForFifteen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),child: Container(),
      ),
    );
  }
}
