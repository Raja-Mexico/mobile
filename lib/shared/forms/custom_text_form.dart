import 'package:flutter/material.dart';
import 'package:raja_mexico_app/utils/constants/app_color.dart';

class CustomTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final Icon? icon;
  final String? placeholder;
  final bool? readOnly;
  final String? defaultValue;
  final TextInputType? keyboardType;

  const CustomTextForm({
    Key? key,
    this.controller,
    this.icon,
    this.placeholder,
    this.readOnly,
    this.defaultValue,
    this.keyboardType,
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
        readOnly: readOnly ?? false,
        initialValue: defaultValue,
        keyboardType: keyboardType,
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
