import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raja_mexico_app/modules/authentication/authentication_controller.dart';
import 'package:raja_mexico_app/shared/buttons/_buttons.dart';
import 'package:raja_mexico_app/shared/forms/_forms.dart';
import 'package:raja_mexico_app/shared/texts/_texts.dart';
import 'package:raja_mexico_app/utils/constants/_constants.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _authController = Get.find<AuthenticationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: AppColor.background,
          padding: EdgeInsets.only(
            top: 32 + MediaQuery.of(context).viewPadding.top,
            bottom: 32,
            left: 48,
            right: 48,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Image(
                image: AssetImage('assets/logo.png'),
                height: 64,
                width: 40,
              ),
              const SizedBox(height: 24),
              const StyledText(
                text: AppText.appName,
                color: AppColor.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              const StyledText(
                text: AppText.tagLine,
                color: AppColor.black,
                fontSize: 18,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const Image(
                image: AssetImage('assets/auth_illustration.png'),
                height: 128,
                width: 128,
              ),
              const SizedBox(height: 24),
              CustomTextForm(
                controller: _authController.emailController,
                placeholder: AppText.emailFormMessage,
                icon: const Icon(Icons.email),
              ),
              const SizedBox(height: 8),
              CustomTextForm(
                controller: _authController.passwordController,
                placeholder: AppText.passwordFormMessage,
                icon: const Icon(Icons.password),
              ),
              const SizedBox(height: 24),
              CustomElevatedButton(
                onPressed: () => {_authController.signIn()},
                text: AppText.login,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const StyledText(
                    text: AppText.haveAccountFalse,
                    color: AppColor.black,
                    fontSize: 14,
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => {_authController.navToSignUp()},
                    child: const StyledText(
                      text: AppText.register,
                      color: AppColor.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
