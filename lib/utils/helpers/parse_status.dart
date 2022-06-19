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
    default:
      return AppText.dueStatusLate;
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
    default:
      return 5;
  }
}
