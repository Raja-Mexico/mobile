import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raja_mexico_app/modules/authentication/authentication_controller.dart';
import 'package:raja_mexico_app/shared/buttons/custom_elevated_button.dart';

class AuthenticationView extends StatelessWidget {
  AuthenticationView({Key? key}) : super(key: key);

  final _authController = Get.find<AuthenticationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
    );
  }
}
