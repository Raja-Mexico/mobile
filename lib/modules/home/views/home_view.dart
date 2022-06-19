import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:raja_mexico_app/models/_models.dart';
import 'package:raja_mexico_app/modules/home/_home.dart';
import 'package:raja_mexico_app/shared/bars/_bars.dart';
import 'package:raja_mexico_app/shared/buttons/_buttons.dart';
import 'package:raja_mexico_app/shared/cards/elevated_card.dart';
import 'package:raja_mexico_app/shared/charts/top_expenses_chart.dart';
import 'package:raja_mexico_app/shared/dialogs/custom_dialog.dart';
import 'package:raja_mexico_app/shared/forms/_forms.dart';
import 'package:raja_mexico_app/shared/texts/_texts.dart';
import 'package:raja_mexico_app/utils/constants/_constants.dart';

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
                      fontSize: 14,
                    ),
                    StyledText(
                      text: '$balance',
                      color: AppColor.black,
                      fontSize: 24,
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

  Widget _buildExpenseSummary(List<Expense>? topExpenses, bool isLoaded) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const StyledText(
          text: AppText.expenseSummaryTitle,
          color: AppColor.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        if (isLoaded && topExpenses == null) ...[
          const StyledText(
            text: AppText.expenseSummaryMessageNone,
            color: AppColor.black2,
            fontSize: 12,
          ),
          // TODO: Tambah
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
              Container(
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
                    ElevatedCard(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          StyledText(
                            text: 'Gopay',
                            color: AppColor.black,
                            fontSize: 12,
                          ),
                          Icon(
                            Icons.delete_outlined,
                            color: AppColor.black3,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                    CustomElevatedButton(
                      // TODO: Buka brick
                      onPressed: () => {},
                      text: AppText.addConnectedAccount,
                    ),
                    // TODO: Navigate to expense details
                    const StyledText(
                      text: AppText.viewExpenseDetails,
                      color: AppColor.black3,
                      fontSize: 12,
                      textAlign: TextAlign.end,
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

  Widget _buildPrepaidList() {
    return Container();
  }

  // TODO: Pop up join family
  void _showCreatePopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          child: Column(
            children: [
              StyledText(
                text: AppText.createFamily,
                color: AppColor.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              StyledText(
                text: AppText.createFamilyMessage,
                color: AppColor.black,
                fontSize: 14,
              ),
              CustomTextForm(
                controller: _homeController.familyCreateController,
                placeholder: AppText.createFamilyPlaceholder,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(milliseconds: 50), () => _showCreatePopUp(context));
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
            FutureBuilder<User>(
              future: _homeController.fetchUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return _buildHeader(
                        snapshot.data!.name ?? '',
                        snapshot.data!.balance ?? 0,
                        snapshot.data!.virtualAccountCode ?? '?????');
                  } else {
                    return _buildHeader('Error', 0, '?????');
                  }
                } else {
                  return _buildHeader('...', 0, 'Loading...');
                }
              },
            ),
            const SizedBox(height: 24),
            FutureBuilder<ExpenseSummary>(
              future: _homeController.fetchExpenses(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return _buildExpenseSummary(snapshot.data?.topExpenses, true);
                } else {
                  return _buildExpenseSummary([], false);
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
