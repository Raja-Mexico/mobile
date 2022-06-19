import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raja_mexico_app/models/expense.dart';
import 'package:raja_mexico_app/modules/expense_details/expense_details_controller.dart';
import 'package:raja_mexico_app/shared/bars/_bars.dart';
import 'package:raja_mexico_app/shared/cards/_cards.dart';
import 'package:raja_mexico_app/shared/charts/_charts.dart';
import 'package:raja_mexico_app/shared/texts/_texts.dart';
import 'package:raja_mexico_app/utils/constants/_constants.dart';
import 'package:raja_mexico_app/utils/helpers/_helpers.dart';

class ExpenseDetailsView extends StatefulWidget {
  const ExpenseDetailsView({Key? key}) : super(key: key);

  @override
  State<ExpenseDetailsView> createState() => _ExpenseDetailsViewState();
}

class _ExpenseDetailsViewState extends State<ExpenseDetailsView> {
  String? nameFilter;
  String? categoryFilter;
  int totalExpense = 0;
  List<Expense>? expenses;
  List<Expense>? filteredExpenses;
  List<ExpenseCategory>? topExpenses;
  Set<String> members = {'Semua'};
  Set<String> categories = {'Semua'};

  final _expenseDetailsController = Get.find<ExpenseDetailsController>();

  @override
  void initState() {
    super.initState();

    _expenseDetailsController.fetchUser().then((value) {
      nameFilter = value.name;

      _expenseDetailsController.fetchExpenses().then((value) {
        expenses = value;
        _updateExpenses();
      });
    });
  }

  void _updateExpenses() {
    if (nameFilter == null) {
      filteredExpenses = expenses;
    } else {
      filteredExpenses = expenses!.where((expense) {
        members.add(expense.spender!);
        return expense.spender == nameFilter;
      }).toList();
    }

    Map<String, int> categoryMap = {};
    totalExpense = 0;

    categories = {'Semua'};

    for (Expense expense in filteredExpenses!) {
      categories.add(expense.category!);
      totalExpense += expense.amount!;
      if (categoryMap.containsKey(expense.category)) {
        categoryMap[expense.category!] =
            categoryMap[expense.category!]! + expense.amount!;
      } else {
        categoryMap[expense.category!] = expense.amount!;
      }
    }

    topExpenses = categoryMap.entries.map((entry) {
      return ExpenseCategory(
        categoryGroup: entry.key,
        total: entry.value,
      );
    }).toList();

    if (categoryFilter != null) {
      filteredExpenses = filteredExpenses!.where((expense) {
        return expense.category == categoryFilter;
      }).toList();
    }

    setState(() {
      totalExpense = totalExpense;
      topExpenses!.sort((a, b) => b.total!.compareTo(a.total!));
      topExpenses = topExpenses!.sublist(0, min(3, topExpenses!.length));
      filteredExpenses!.sort((a, b) => b.date!.compareTo(a.date!));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                fontWeight: FontWeight.bold,
              ),
              const StyledText(
                text: AppText.expenseDetailsMessage,
                color: AppColor.black2,
                fontSize: 12,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const StyledText(
                    text: AppText.expenseDistribution,
                    color: AppColor.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  ElevatedCard(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DropdownButton<String>(
                      value: nameFilter ?? 'Semua',
                      items: members.map((String name) {
                        return DropdownMenuItem(
                          value: name,
                          child: StyledText(
                            text: name,
                            color: AppColor.black,
                            fontSize: 12,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        nameFilter = value == 'Semua' ? null : value;
                        categoryFilter = null;
                        _updateExpenses();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedCard(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    if (topExpenses == null) ...[
                      const SizedBox(
                        width: 160,
                        height: 128,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ] else ...[
                      TopExpensesChart(topExpenses: topExpenses!),
                    ],
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          StyledText(
                            text:
                                '${AppText.expenseDistributionMessage} ${topExpenses?[0].categoryGroup ?? '...'}',
                            color: AppColor.black,
                            fontSize: 12,
                          ),
                          const SizedBox(height: 16),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: AppText.expenseTotalTitle,
                                  style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const TextSpan(
                                  text: AppText.expenseTotalMessage,
                                  style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 12,
                                  ),
                                ),
                                TextSpan(
                                  text: currencyFormat(totalExpense),
                                  style: const TextStyle(
                                    color: AppColor.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          // TODO: Lihat semua distribusi
                          GestureDetector(
                            onTap: () => {},
                            child: const StyledText(
                              text: AppText.expenseDistributionDetails,
                              color: AppColor.black3,
                              fontSize: 12,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const StyledText(
                    text: AppText.expenseHistory,
                    color: AppColor.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  ElevatedCard(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DropdownButton<String>(
                      value: categoryFilter ?? 'Semua',
                      items: categories.map((String category) {
                        return DropdownMenuItem(
                          value: category,
                          child: StyledText(
                            text: category,
                            color: AppColor.black,
                            fontSize: 12,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        categoryFilter = value == 'Semua' ? null : value;
                        _updateExpenses();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (filteredExpenses == null) ...[
                const Center(child: CircularProgressIndicator()),
              ] else ...[
                for (Expense expense in filteredExpenses!) ...[
                  ExpenseCard(expense: expense),
                  const SizedBox(height: 8),
                ],
              ],
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(currentIndex: 1),
    );
  }
}
