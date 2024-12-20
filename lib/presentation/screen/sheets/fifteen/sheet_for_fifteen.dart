import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:good_job/domain/model/sheet.dart';
import 'package:good_job/presentation/screen/sheets/fifteen/sheet_for_fifteen_view_model.dart';
import 'package:good_job/ui/right_text_style.dart';
import 'package:provider/provider.dart';

class SheetForFifteen extends StatefulWidget {
  final Sheet sheet;

  const SheetForFifteen({super.key, required this.sheet});

  @override
  State<SheetForFifteen> createState() => _SheetForFifteenState();
}

class _SheetForFifteenState extends State<SheetForFifteen> {
  @override
  void initState() {
    Future.microtask(() {
      if (mounted) {
        final viewModel = context.read<SheetForFifteenViewModel>();
        viewModel.checkTodayFilled(widget.sheet.id);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SheetForFifteenViewModel>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Expanded(
          child: Column(
            children: [
              Text(
                widget.sheet.name,
                style: RightTextStyle.headerTextBold,
              ),
              Text(
                '${widget.sheet.id.split(' ')[0]}~',
                style: RightTextStyle.smallTextRegular,
              )
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.go('/main');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                onTap: () {
                  viewModel.showDeleteDialog(context, widget.sheet.id, () {
                    context.pop();
                  }, () {
                    context.go('/main');
                    viewModel.deleteSheet(widget.sheet.id);
                  });
                },
                child: const Text(
                  '삭제하기',
                  style: RightTextStyle.largeTextRegular,
                ),
              ),
            ];
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Stack(
          children: [
            Container(
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
                      children: List.generate(row + 1, (col) {
                        return GestureDetector(
                          onTap: () {
                            viewModel.tapSticker(
                                widget.sheet.id, row, col, true);
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade300),
                            child: viewModel.getSticker(
                                    widget.sheet.id, row, col)
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
            viewModel.ableToCheck(widget.sheet.id)
                ? const SizedBox.shrink()
                : Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.05),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFE0FBEC),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '오늘의 챌린지를 완료하셨네요!',
                            style: RightTextStyle.largeTextRegular,
                          ),
                        ),
                      ),
                    ),
                  ),
            viewModel.checkCompleted(widget.sheet.id)
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.05),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFE0FBEC),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '축하해요! 챌린지를 완료하셨어요!',
                            style: RightTextStyle.largeTextRegular,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
