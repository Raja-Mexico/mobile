import 'package:flutter/material.dart';
import 'package:raja_mexico_app/utils/constants/_constants.dart';

String parseStatus(int status) {
  switch (status) {
    case 1:
      return AppText.dueStatusWait;
    case 2:
      return AppText.dueStatusPaid;
    case 3:
      return AppText.dueStatusGroup;
    case 4:
      return AppText.dueStatusWithdraw;
    case 5:
      return AppText.dueStatusLate;
    default:
      return 'Semua';
  }
}

int parseStatusToInt(String status) {
  switch (status) {
    case AppText.dueStatusWait:
      return 1;
    case AppText.dueStatusPaid:
      return 2;
    case AppText.dueStatusGroup:
      return 3;
    case AppText.dueStatusWithdraw:
      return 4;
    case AppText.dueStatusLate:
      return 5;
    default:
      return 0;
  }
}

Color parseStatusToColor(int status) {
  switch (status) {
    case 1:
      return const Color(0xFFF0AE2D);
    case 2:
      return const Color(0xFF50DB77);
    case 3:
      return const Color(0xFFF0AE2D);
    case 4:
      return const Color(0xFF607EFC);
    case 5:
      return const Color(0xFFE95050);
    default:
      return Colors.black;
  }
}
