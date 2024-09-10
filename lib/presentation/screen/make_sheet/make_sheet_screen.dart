import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:good_job/presentation/component/big_button.dart';
import 'package:good_job/presentation/component/input_text_field.dart';
import 'package:good_job/presentation/component/pick_up_button.dart';
import 'package:good_job/presentation/screen/make_sheet/make_sheet_view_model.dart';
import 'package:good_job/ui/right_text_style.dart';
import 'package:provider/provider.dart';

class MakeSheetScreen extends StatefulWidget {
  const MakeSheetScreen({super.key});

  @override
  State<MakeSheetScreen> createState() => _MakeSheetScreenState();
}

class _MakeSheetScreenState extends State<MakeSheetScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MakeSheetViewModel>();
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/main');
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text('새로운 챌린지 만들기', style: RightTextStyle.largerTextBold),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: _formKey,
            child: InputTextField(
                title: '챌린지 이름',
                hintText: '2글자 이상으로 적어주세요!',
                controller: controller),
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              '며칠동안 도전해볼까요?',
              style: RightTextStyle.largeTextBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
            ),
            child: Row(
              children: [
                PickUpButton(
                  text: '10일',
                  isSelected: state.selectedButton == 10,
                  onTap: () {
                    viewModel.selectButton(10);
                  },
                ),
                PickUpButton(
                  text: '15일',
                  isSelected: state.selectedButton == 15,
                  onTap: () {
                    viewModel.selectButton(15);
                  },
                ),
                PickUpButton(
                  text: '20일',
                  isSelected: state.selectedButton == 20,
                  onTap: () {
                    viewModel.selectButton(20);
                  },
                ),
                PickUpButton(
                  text: '30일',
                  isSelected: state.selectedButton == 30,
                  onTap: () {
                    viewModel.selectButton(30);
                  },
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          BigButton(
            text: '만들기',
            onTap: () async {
              if (_formKey.currentState?.validate() == false) {
                return;
              }
              if (state.selectedButton != null) {
                await viewModel.addSheet(
                    controller.text, state.selectedButton!);
                if (context.mounted) {
                  context.go('/main');
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
