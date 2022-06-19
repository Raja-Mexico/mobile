import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raja_mexico_app/models/family.dart';
import 'package:raja_mexico_app/modules/family/_family.dart';
import 'package:raja_mexico_app/modules/family/views/family_join_view.dart';
import 'package:raja_mexico_app/shared/bars/bottom_bar.dart';
import 'package:raja_mexico_app/shared/cards/_cards.dart';
import 'package:raja_mexico_app/shared/texts/_texts.dart';
import 'package:raja_mexico_app/utils/constants/_constants.dart';
import 'package:raja_mexico_app/utils/helpers/currency_format.dart';
import 'package:raja_mexico_app/utils/routes/_routes.dart';

class FamilyView extends StatelessWidget {
  FamilyView({Key? key}) : super(key: key);

  final _familyController = Get.find<FamilyController>();

  Widget _buildFamilyDetails(Family family) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const StyledText(
                    text: AppText.familyBalance,
                    color: AppColor.black,
                    fontSize: 12,
                  ),
                  StyledText(
                    text: currencyFormat(family.balance ?? 0),
                    color: AppColor.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const StyledText(
                  text: AppText.familyCode,
                  color: AppColor.black,
                  fontSize: 14,
                ),
                HiddenText(text: family.code ?? '........'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        const StyledText(
          text: AppText.familyMemberList,
          color: AppColor.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        if (family.members == null) ...[
          const SizedBox(height: 8),
          MemberCard(
            member: FamilyMember(),
          ),
        ] else ...[
          for (final member in family.members!) ...[
            const SizedBox(height: 8),
            MemberCard(
              member: member,
            ),
          ],
        ],
      ],
    );
  }

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
                text: AppText.familyTitle,
                color: AppColor.primary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              const StyledText(
                text: AppText.familyMessage,
                color: AppColor.black2,
                fontSize: 14,
              ),
              const SizedBox(height: 24),
              FutureBuilder<Family>(
                future: _familyController.fetchFamily(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      if(snapshot.data!.name == "") {
                        Future.delayed(
                          const Duration(milliseconds: 1), 
                          () => Get.toNamed(AppRoutes.family + AppRoutes.family_join)
                        );
                        return Container();
                      }
                      else {
                        return _buildFamilyDetails(snapshot.data!);
                      }
                    } else {
                      return _buildFamilyDetails(Family(
                        code: '????????',
                        balance: 0,
                        members: [
                          FamilyMember(
                            name: 'Error',
                            balance: 0,
                          ),
                        ],
                      ));
                    }
                  } else {
                    return _buildFamilyDetails(Family());
                  }
                },
              ),
              const SizedBox(height: 24),
              const StyledText(
                text: AppText.familyRequestList,
                color: AppColor.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              // TODO: Fetch prepaids update request
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(currentIndex: 3),
    );
  }
}

class HiddenText extends StatefulWidget {
  final String text;

  const HiddenText({
    super.key,
    required this.text,
  });

  @override
  State<HiddenText> createState() => _HiddenTextState();
}

class _HiddenTextState extends State<HiddenText> {
  bool _isHidden = true;

  void _changeState() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StyledText(
          text: _isHidden ? '*' * widget.text.length : widget.text,
          color: AppColor.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () => {_changeState()},
          child: Icon(
            _isHidden
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            size: 18,
            color: AppColor.black,
          ),
        ),
      ],
    );
  }
}

class MemberCard extends StatelessWidget {
  final FamilyMember member;

  const MemberCard({
    super.key,
    required this.member,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 160,
            child: StyledText(
              text:
                  '${member.name ?? '...'}${(member.isSender == null || !member.isSender!) ? '' : AppText.familyYou}',
              color: AppColor.black,
              fontSize: 12,
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: AppText.familyMemberBalance,
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 12,
                    ),
                  ),
                  TextSpan(
                    text: currencyFormat(member.balance ?? 0),
                    style: const TextStyle(
                      color: AppColor.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Icon(
                Icons.create_outlined,
                color: (member.isAdmin == null || !member.isAdmin!)
                    ? AppColor.black3
                    : AppColor.primary,
                size: 24,
              ),
              StyledText(
                text: AppText.familyAdmin,
                color: (member.isAdmin == null || !member.isAdmin!)
                    ? AppColor.black3
                    : AppColor.primary,
                fontSize: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
