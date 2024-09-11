import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:good_job/domain/model/sheet.dart';
import 'package:good_job/presentation/screen/sheets/thirty/sheet_for_thirty_view_model.dart';
import 'package:good_job/ui/right_text_style.dart';
import 'package:provider/provider.dart';

class SheetForThirty extends StatefulWidget {
  final Sheet sheet;

  const SheetForThirty({super.key, required this.sheet});

  @override
  State<SheetForThirty> createState() => _SheetForThirtyState();
}

class _SheetForThirtyState extends State<SheetForThirty> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SheetForThirtyViewModel>();
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
              children: List.generate(6, (row) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (col) {
                    return GestureDetector(
                      onTap: () {
                        viewModel.tapSticker(widget.sheet.id, row, col, true);
                        viewModel.plusCount(widget.sheet.id);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
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
                                  viewModel.getColor(widget.sheet.id, row, col),
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
