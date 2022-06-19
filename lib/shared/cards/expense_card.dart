import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:raja_mexico_app/models/_models.dart';
import 'package:raja_mexico_app/shared/cards/_cards.dart';
import 'package:raja_mexico_app/shared/texts/_texts.dart';
import 'package:raja_mexico_app/utils/constants/_constants.dart';
import 'package:raja_mexico_app/utils/helpers/_helpers.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;

  const ExpenseCard({
    Key? key,
    required this.expense,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: StyledText(
                    text: expense.desc ?? '...',
                    color: AppColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                  ),
                ),
                StyledText(
                  text: '${AppText.expenseHistoryDate} ${expense.date}',
                  color: AppColor.black,
                  fontSize: 12,
                  textAlign: TextAlign.start,
                ),
                StyledText(
                  text:
                      '${AppText.expenseHistoryCategory} ${expense.category ?? '...'}',
                  color: AppColor.black,
                  fontSize: 12,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 80,
            child: StyledText(
              text: currencyFormat(expense.amount ?? 0),
              color: AppColor.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
