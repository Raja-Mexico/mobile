import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raja_mexico_app/modules/family/_family.dart';
import 'package:raja_mexico_app/utils/constants/_constants.dart';
import 'package:raja_mexico_app/shared/texts/_texts.dart';
import 'package:raja_mexico_app/shared/forms/_forms.dart';
import 'package:raja_mexico_app/shared/buttons/_buttons.dart';
import 'package:raja_mexico_app/shared/bars/_bars.dart';

class FamilyJoinView extends StatelessWidget {
  FamilyJoinView({Key? key}) : super(key: key);

  final _familyController = Get.find<FamilyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: AppColor.background,
          padding: EdgeInsets.only(
            top: 32 + MediaQuery.of(context).viewPadding.top,
            bottom: 32,
            left: 24,
            right: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Image(
                image: AssetImage('assets/family_join_create_illustration.png'),
                height: 175,
                width: 140,
              ),
              const SizedBox(height: 42),
              const StyledText(
                text: AppText.familyServiceIsNotAlready,
                color: AppColor.primary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const StyledText(
                text: AppText.familyJoinAppeal,
                color: AppColor.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 52),
              CustomTextForm(
                controller: _familyController.codeController,
                placeholder: AppText.familyJoinFormPlaceholder,
              ),
              const SizedBox(height: 12),
              CustomElevatedButton(
                onPressed: () => {_familyController.join()},
                text: AppText.familyJoinText,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const StyledText(
                    text: AppText.familyCreateRedirectText,
                    color: AppColor.black,
                    fontSize: 12,
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => {_familyController.navToCreate()},
                    child: const StyledText(
                      text: AppText.createButton,
                      color: AppColor.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(currentIndex: 3),
    );
  }
}
