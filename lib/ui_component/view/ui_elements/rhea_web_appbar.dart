import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rhea_ai_website/ui_component/util/utils.dart';

class RheaWebAppBar extends StatelessWidget {
  const RheaWebAppBar({super.key, required this.onGetInvolvedTap});
  final VoidCallback onGetInvolvedTap;

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(RheaWebText.imagePathLogo, width: deviceSize.width <= 820 ? deviceSize.width * 0.2 : 156),
        GestureDetector(
          onTap: onGetInvolvedTap,
          child: Container(
            decoration: const BoxDecoration(
              color: RheaWebColor.cardBackgroundColor,
              borderRadius: BorderRadius.all(RheaWebBorder.buttonRadius),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(RheaWebText.headerButtonTitle, style: RheaWebFont.regularFont),
                  ),
                  SvgPicture.asset(RheaWebText.iconPathGetInvolved)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
