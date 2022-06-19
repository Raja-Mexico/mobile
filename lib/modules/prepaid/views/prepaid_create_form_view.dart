import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raja_mexico_app/modules/prepaid/prepaid_controller.dart';
import 'package:raja_mexico_app/shared/bars/_bars.dart';
import 'package:raja_mexico_app/shared/buttons/_buttons.dart';
import 'package:raja_mexico_app/shared/forms/_forms.dart';
import 'package:raja_mexico_app/shared/texts/_texts.dart';
import 'package:raja_mexico_app/utils/constants/_constants.dart';

class PrepaidCreateFormView extends StatelessWidget {
  PrepaidCreateFormView({Key? key}) : super(key: key);

  final _prepaidController = Get.find<PrepaidController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 32 + MediaQuery.of(context).viewPadding.top,
            bottom: 32,
            left: 24,
            right: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const StyledText(
                text: AppText.prepaidDetails,
                color: AppColor.primary,
                fontSize: 24,
              ),
              const StyledText(
                text: AppText.prepaidDetailsMessage,
                color: AppColor.black2,
                fontSize: 14,
              ),
              const SizedBox(height: 24),
              const StyledText(
                text: AppText.prepaidFormName,
                color: AppColor.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              CustomTextForm(
                readOnly: true,
                defaultValue:
                    _prepaidController.serviceId == 1 ? 'PLN' : 'Pulsa',
              ),
              const SizedBox(height: 16),
              const StyledText(
                text: AppText.prepaidFormResponsibility,
                color: AppColor.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              CustomTextForm(
                readOnly: true,
                defaultValue: _prepaidController.name,
              ),
              const SizedBox(height: 16),
              const StyledText(
                text: AppText.prepaidFormDue,
                color: AppColor.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              CustomTextForm(
                controller: _prepaidController.dueDateController,
                placeholder: AppText.prepaidFormDuePlaceholder,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              const StyledText(
                text: AppText.prepaidFormCustomerNumber,
                color: AppColor.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              CustomTextForm(
                controller: _prepaidController.customerNumberController,
                placeholder: AppText.prepaidFormCustomerNumberPlaceholder,
              ),
              const SizedBox(height: 16),
              const StyledText(
                text: AppText.prepaidFormAmount,
                color: AppColor.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              CustomTextForm(
                controller: _prepaidController.amountController,
                placeholder: AppText.prepaidFormAmountPlaceholder,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => {_prepaidController.savePrepaid()},
                      child: const StyledText(
                        text: AppText.prepaidFormSubmitSave,
                        color: AppColor.primary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomElevatedButton(
                      onPressed: () => {_prepaidController.payPrepaid()},
                      text: AppText.prepaidFormSubmitPay,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(currentIndex: -1),
    );
  }
}
