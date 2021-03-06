import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:raja_mexico_app/models/_models.dart';
import 'package:raja_mexico_app/modules/home/_home.dart';
import 'package:raja_mexico_app/shared/bars/_bars.dart';
import 'package:raja_mexico_app/shared/buttons/_buttons.dart';
import 'package:raja_mexico_app/shared/cards/elevated_card.dart';
import 'package:raja_mexico_app/shared/cards/prepaid_card.dart';
import 'package:raja_mexico_app/shared/charts/top_expenses_chart.dart';
import 'package:raja_mexico_app/shared/dialogs/custom_dialog.dart';
import 'package:raja_mexico_app/shared/forms/_forms.dart';
import 'package:raja_mexico_app/shared/texts/_texts.dart';
import 'package:raja_mexico_app/utils/constants/_constants.dart';
import 'package:raja_mexico_app/utils/helpers/_helpers.dart';
import 'package:raja_mexico_app/utils/routes/_routes.dart';

// IconData getPrepaidIcon (status) {
//     if (status == 1) {
//       return Icons.electric_bolt_outlined;
//     }
//     return Icons.phone_callback_outlined;
// }

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final _homeController = Get.find<HomeController>();

  Widget _buildHeader(String name, int balance, String virtualAccountNumber) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StyledText(
          text: '${AppText.greetings} $name!',
          color: AppColor.primary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        const StyledText(
          text: AppText.greetingsMessage,
          color: AppColor.black2,
          fontSize: 14,
        ),
        const SizedBox(height: 24),
        ElevatedCard(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            children: [
              const Image(
                image: AssetImage('assets/logo.png'),
                height: 36,
                width: 24,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const StyledText(
                      text: AppText.balance,
                      color: AppColor.black,
                      fontSize: 12,
                    ),
                    StyledText(
                      text: currencyFormat(balance),
                      color: AppColor.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const StyledText(
                    text: AppText.virtualAccountCode,
                    color: AppColor.black2,
                    fontSize: 12,
                  ),
                  Row(
                    children: [
                      StyledText(
                        text: virtualAccountNumber,
                        color: AppColor.black2,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () => {
                          Clipboard.setData(
                              ClipboardData(text: virtualAccountNumber))
                        },
                        child: const Icon(
                          Icons.content_copy_outlined,
                          color: AppColor.black2,
                          size: 16,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExpenseSummary(List<ExpenseCategory>? topExpenses, bool isLoaded,
      List<String>? institutions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const StyledText(
          text: AppText.expenseSummaryTitle,
          color: AppColor.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 8),
        if (isLoaded && topExpenses == null) ...[
          const StyledText(
            text: AppText.expenseSummaryMessageNone,
            color: AppColor.black2,
            fontSize: 12,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              CustomElevatedButton(
                onPressed: () => {_homeController.openBrick()},
                text: AppText.addAccount,
              ),
            ],
          ),
        ] else if (isLoaded && topExpenses != null) ...[
          const StyledText(
            text: AppText.expenseSummaryMessage,
            color: AppColor.black2,
            fontSize: 12,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TopExpensesChart(topExpenses: topExpenses),
              SizedBox(
                width: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const StyledText(
                      text: AppText.connectedAccount,
                      color: AppColor.black,
                      fontSize: 12,
                      textAlign: TextAlign.start,
                    ),
                    // TODO: Refactor and add functionality
                    if (institutions != null) ...[
                      for (String institution in institutions) ...[
                        ElevatedCard(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              StyledText(
                                text: institution,
                                color: AppColor.black,
                                fontSize: 12,
                              ),
                              const Icon(
                                Icons.delete_outlined,
                                color: AppColor.black3,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                    CustomElevatedButton(
                      onPressed: () => {_homeController.openBrick()},
                      text: AppText.addConnectedAccount,
                    ),
                    GestureDetector(
                      onTap: () => {Get.offNamed(AppRoutes.expenseDetails)},
                      child: const StyledText(
                        text: AppText.viewExpenseDetails,
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
        ] else ...[
          const StyledText(
            text: AppText.expenseSummaryMessageLoading,
            color: AppColor.black2,
            fontSize: 12,
          ),
        ],
      ],
    );
  }

  IconData getPrepaidIcon(status) {
    if (status == 1) {
      return Icons.electric_bolt_outlined;
    } else {
      return Icons.phone_callback_outlined;
    }
  }

  Widget _buildPrepaidList(List<Prepaid> prepaids) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const StyledText(
        text: AppText.prepaidListTitle,
        color: AppColor.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      SizedBox(height: 12),
      for (var prepaid in prepaids) ...{
        PrepaidCard(
            icon: getPrepaidIcon(prepaid.status),
            title: prepaid.title!,
            amount: prepaid.amount!,
            dueDays: prepaid.dueDays!,
            status: prepaid.status!),
        const SizedBox(height: 8),
      }
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 32 + MediaQuery.of(context).viewPadding.top,
          bottom: 32,
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FutureBuilder<User>(
              future: _homeController.fetchUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.name == null) {
                      _homeController.signOut();
                      return Container();
                    }
                    return _buildHeader(
                        snapshot.data!.name ?? '',
                        snapshot.data!.balance ?? 0,
                        snapshot.data!.virtualAccountCode ?? '?????');
                  } else {
                    _homeController.signOut();
                    return _buildHeader('Error', 0, '?????');
                  }
                } else {
                  return _buildHeader('...', 0, 'Loading...');
                }
              },
            ),
            const SizedBox(height: 24),
            FutureBuilder<ExpenseCategorySummary>(
              future: _homeController.fetchExpenses(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return _buildExpenseSummary(snapshot.data?.topExpenses, true,
                      snapshot.data?.institutions);
                } else {
                  return _buildExpenseSummary([], false, null);
                }
              },
            ),
            const SizedBox(height: 24),
            FutureBuilder<List<Prepaid>>(
              future: _homeController.fetchPrepaids(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return _buildPrepaidList(snapshot.data!);
                  } else {
                    return Container();
                  }
                } else {
                  return _buildPrepaidList([]);
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(currentIndex: 0),
    );
  }
}
