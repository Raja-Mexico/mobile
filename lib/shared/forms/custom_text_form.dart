import 'package:flutter/material.dart';
import 'package:raja_mexico_app/utils/constants/app_color.dart';

class CustomTextForm extends StatelessWidget {
  final TextEditingController controller;
  final Icon? icon;
  final String? placeholder;

  const CustomTextForm({
    Key? key,
    required this.controller,
    this.icon,
    this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.primary.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          color: AppColor.black,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: placeholder,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
