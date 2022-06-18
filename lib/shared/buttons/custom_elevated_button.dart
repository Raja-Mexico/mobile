import 'package:flutter/material.dart';
import 'package:raja_mexico_app/utils/constants/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final String text;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: AppColor.primary,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColor.white,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
