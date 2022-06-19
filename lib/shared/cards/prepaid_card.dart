import 'package:flutter/material.dart';
import 'package:raja_mexico_app/shared/cards/elevated_card.dart';
import 'package:raja_mexico_app/shared/texts/styled_text.dart';
import 'package:raja_mexico_app/utils/constants/_constants.dart';

class PrepaidCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String amount;
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
                text: amount,
                color: AppColor.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          Row(
            children: [
              Column(
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
                          text: status == 0
                              ? AppText.dueStatusWait
                              : (status == 1
                                  ? AppText.dueStatusPaid
                                  : AppText.dueStatusLate),
                          style: TextStyle(
                            color: status == 0
                                ? const Color(0xFFF0AE2D)
                                : (status == 1
                                    ? const Color(0xFF50DB77)
                                    : const Color(0xFFE95050)),
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
