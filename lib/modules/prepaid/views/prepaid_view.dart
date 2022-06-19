import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raja_mexico_app/models/_models.dart';
import 'package:raja_mexico_app/modules/prepaid/_prepaid.dart';
import 'package:raja_mexico_app/shared/bars/bottom_bar.dart';
import 'package:raja_mexico_app/shared/buttons/_buttons.dart';
import 'package:raja_mexico_app/shared/cards/_cards.dart';
import 'package:raja_mexico_app/shared/texts/_texts.dart';
import 'package:raja_mexico_app/utils/constants/_constants.dart';
import 'package:raja_mexico_app/utils/helpers/_helpers.dart';

class PrepaidView extends StatefulWidget {
  const PrepaidView({Key? key}) : super(key: key);

  @override
  State<PrepaidView> createState() => _PrepaidViewState();
}

class _PrepaidViewState extends State<PrepaidView> {
  List<Prepaid>? prepaids;
  List<Prepaid>? filteredPrepaids;
  int statusFilter = 0;
  Set<int> statuses = {0, 1, 2, 3, 4};

  final _prepaidController = Get.find<PrepaidController>();

  @override
  void initState() {
    super.initState();

    _prepaidController.fetchPrepaids().then((value) {
      prepaids = value;
      _updateExpenses();
    });
  }

  void _updateExpenses() {
    if (statusFilter != 0) {
      filteredPrepaids = prepaids!.where((prepaid) {
        return prepaid.status == statusFilter;
      }).toList();
    }

    setState(() {
      filteredPrepaids = filteredPrepaids;
    });
  }

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
              text: AppText.familyTitle,
              color: AppColor.primary,
              fontSize: 24,
            ),
            const StyledText(
              text: AppText.familyMessage,
              color: AppColor.black2,
              fontSize: 14,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const StyledText(
                        text: AppText.familyBalance,
                        color: AppColor.black,
                        fontSize: 14,
                      ),
                      // TODO: Fetch saldo total
                      StyledText(
                        text: currencyFormat(100000),
                        color: AppColor.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                // TODO: Button tambah pesanan icon
                CustomElevatedButton(
                  onPressed: () => {},
                  text: AppText.addPrepaid,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedCard(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButton<String>(
                    value: parseStatus(statusFilter),
                    items: statuses.map((int status) {
                      return DropdownMenuItem(
                        value: parseStatus(status),
                        child: StyledText(
                          text: parseStatus(status),
                          color: AppColor.black,
                          fontSize: 12,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      statusFilter = parseStatusToInt(value ?? '');
                      _updateExpenses();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (filteredPrepaids != null) ...[
              const SizedBox(
                height: 128,
                child: CircularProgressIndicator(),
              ),
            ] else ...[
              for (Prepaid prepaid in filteredPrepaids!) ...[
                PrepaidCard(
                  icon: prepaid.category == 1
                      ? Icons.electric_bolt_outlined
                      : Icons.phone_android_outlined,
                  title: prepaid.title!,
                  amount: prepaid.amount!.toString(),
                  dueDays: prepaid.dueDays!,
                  status: prepaid.status!,
                ),
              ],
            ],
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(currentIndex: 2),
    );
  }
}
