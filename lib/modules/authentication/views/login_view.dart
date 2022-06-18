import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raja_mexico_app/modules/authentication/authentication_controller.dart';
import 'package:raja_mexico_app/shared/buttons/custom_elevated_button.dart';
import 'package:raja_mexico_app/shared/texts/_texts.dart';
import 'package:raja_mexico_app/utils/constants/_constants.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _authController = Get.find<AuthenticationController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const StyledText(
          text: AppText.appName,
          color: AppColor.black,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        const StyledText(
          text: AppText.tagLine,
          color: AppColor.black,
          fontSize: 18,
        ),
        CustomElevatedButton(
          onPressed: () => {},
          text: AppText.login,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            StyledText(
              text: AppText.haveAccountFalse,
              color: AppColor.black,
              fontSize: 12,
            ),
            StyledText(
              text: AppText.register,
              color: AppColor.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ],
    );
  }
}
