import 'package:flutter/material.dart';
import 'package:raja_mexico_app/shared/bars/_bars.dart';
import 'package:raja_mexico_app/shared/cards/_cards.dart';
import 'package:raja_mexico_app/shared/texts/_texts.dart';
import 'package:raja_mexico_app/utils/constants/_constants.dart';

class PrepaidCreateView extends StatelessWidget {
  const PrepaidCreateView({Key? key}) : super(key: key);

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
              text: AppText.prepaidSelectProduct,
              color: AppColor.primary,
              fontSize: 24,
            ),
            const StyledText(
              text: AppText.prepaidSelectProductMessage,
              color: AppColor.black2,
              fontSize: 14,
            ),
            const SizedBox(height: 24),
            PrepaidServiceCard(
              title: AppText.prepaidServiceElectricity,
              icon: Icons.electric_bolt_outlined,
              onTap: () => {},
            ),
            const SizedBox(height: 8),
            PrepaidServiceCard(
              title: AppText.prepaidServiceMobile,
              icon: Icons.phone_callback_outlined,
              onTap: () => {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(currentIndex: -1),
    );
  }
}

class PrepaidServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;

  const PrepaidServiceCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ElevatedCard(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColor.primary,
              size: 24,
            ),
            Expanded(
              child: StyledText(
                text: title,
                color: AppColor.black,
                fontSize: 18,
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: AppColor.black,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
