import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:good_job/domain/model/sheet.dart';
import 'package:good_job/presentation/screen/sheets/ten/sheet_for_ten_view_model.dart';
import 'package:good_job/ui/right_text_style.dart';
import 'package:provider/provider.dart';

class SheetForTen extends StatefulWidget {
  final Sheet sheet;

  const SheetForTen({super.key, required this.sheet});

  @override
  State<SheetForTen> createState() => _SheetForTenState();
}

class _SheetForTenState extends State<SheetForTen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SheetForTenViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.sheet.name,
          style: RightTextStyle.headerTextBold,
        ),
        leading: IconButton(
          onPressed: () {
            context.go('/main');
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (row) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(2, (col) {
                    return GestureDetector(
                      onTap: () {
                        viewModel.tapSticker(widget.sheet.id, row, col, true);
                        viewModel.plusCount(widget.sheet.id);
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: viewModel.getSticker(widget.sheet.id, row, col)
                              ? Colors.white
                              : Colors.grey,
                        ),
                        child: viewModel.getSticker(widget.sheet.id, row, col)
                            ? ClipOval(
                                child: Image.asset(
                                  viewModel.getImageForPosition(row, col),
                                  fit: BoxFit.fill,
                                ),
                              )
                            : null,
                      ),
                    );
                  }),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
