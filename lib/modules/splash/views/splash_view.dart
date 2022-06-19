import 'package:flutter/material.dart';
import 'package:raja_mexico_app/shared/texts/styled_text.dart';
import 'package:raja_mexico_app/utils/constants/app_color.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('assets/logo.png'),
              height: 192,
              width: 128,
            ),
            StyledText(
              text: 'Cemara',
              color: AppColor.black,
              fontSize: 48,
            ),
          ],
        ),
      ),
    );
  }
}
