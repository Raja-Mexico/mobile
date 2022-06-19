import 'package:flutter/material.dart';
import 'package:raja_mexico_app/shared/cards/elevated_card.dart';
import 'package:raja_mexico_app/shared/texts/styled_text.dart';
import 'package:raja_mexico_app/utils/constants/_constants.dart';
import 'package:raja_mexico_app/utils/helpers/_helpers.dart';

class PrepaidCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final int amount;
  final int dueDays;
  final int status;

  const PrepaidCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.amount,
    required this.dueDays,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 24,
                color: AppColor.primary,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: StyledText(
                  text: title,
                  color: AppColor.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 16),
              StyledText(
                text: currencyFormat(amount),
                color: AppColor.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: AppText.dueMessage,
                          style: TextStyle(
                            color: AppColor.black,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: dueDays.toString(),
                          style: const TextStyle(
                            color: AppColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: AppText.dueDaysLeft,
                          style: TextStyle(
                            color: AppColor.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: AppText.dueStatusMessage,
                          style: TextStyle(
                            color: AppColor.black,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: parseStatus(status),
                          style: TextStyle(
                            color: parseStatusToColor(status),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
