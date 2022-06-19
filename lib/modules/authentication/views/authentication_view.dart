import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raja_mexico_app/modules/authentication/authentication_controller.dart';
import 'package:raja_mexico_app/shared/buttons/custom_elevated_button.dart';
import 'package:raja_mexico_app/shared/texts/_texts.dart';
import 'package:raja_mexico_app/utils/constants/_constants.dart';

class AuthenticationView extends StatelessWidget {
  AuthenticationView({Key? key}) : super(key: key);

  final _authController = Get.find<AuthenticationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/logo.png'),
              height: 192,
              width: 128,
            ),
            const StyledText(
              text: 'Cemara',
              color: AppColor.black,
              fontSize: 48,
            ),
            SizedBox(
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomElevatedButton(
                    onPressed: () => _authController.navToSignIn(),
                    text: 'Sign In',
                  ),
                  CustomElevatedButton(
                    onPressed: () => _authController.navToSignUp(),
                    text: 'Sign Up',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
