import 'package:flutter/material.dart';

class SheetForTen extends StatefulWidget {
  const SheetForTen({super.key});

  @override
  State<SheetForTen> createState() => _SheetForTenState();
}

class _SheetForTenState extends State<SheetForTen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {return Container(decoration: BoxDecoration(),);})),
        ),
      ),
    );
  }
}
