import 'package:flutter/material.dart';
import 'package:good_job/domain/model/sheet.dart';

class SheetTile extends StatelessWidget {
  final Sheet sheet;

  const SheetTile({super.key, required this.sheet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(sheet.name),
            Text('${sheet.filledCount}/${sheet.count}'),
          ],
        ),
      ),
    );
  }
}
