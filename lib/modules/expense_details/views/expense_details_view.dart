import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raja_mexico_app/modules/expense_details/expense_details_controller.dart';
import 'package:raja_mexico_app/shared/bars/_bars.dart';
import 'package:raja_mexico_app/shared/texts/_texts.dart';
import 'package:raja_mexico_app/utils/constants/_constants.dart';

class ExpenseDetailsView extends StatelessWidget {
  ExpenseDetailsView({Key? key}) : super(key: key);

  final _expenseDetailsController = Get.find<ExpenseDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 32 + MediaQuery.of(context).viewPadding.top,
          bottom: 32,
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const StyledText(
              text: AppText.expenseDetailsTitle,
              color: AppColor.primary,
              fontSize: 24,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(currentIndex: 1),
    );
  }
}
