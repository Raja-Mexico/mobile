import 'package:flutter/material.dart';
import 'package:raja_mexico_app/shared/bars/bottom_bar.dart';
import 'package:raja_mexico_app/shared/buttons/_buttons.dart';
import 'package:raja_mexico_app/shared/texts/_texts.dart';
import 'package:raja_mexico_app/utils/constants/_constants.dart';

class PrepaidView extends StatelessWidget {
  const PrepaidView({Key? key}) : super(key: key);

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
                    children: [
                      const StyledText(
                        text: AppText.familyBalance,
                        color: AppColor.black,
                        fontSize: 14,
                      ),
                      // TODO: Fetch saldo total
                      StyledText(
                        text: '100000',
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
            // TODO: Filter
            const SizedBox(height: 16),
            // TODO: Fetch prepaids
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(currentIndex: 2),
    );
  }
}
