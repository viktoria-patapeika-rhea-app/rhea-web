import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rhea_ai_website/ui_component/util/utils.dart';

class RheaWebAppBar extends StatelessWidget {
  const RheaWebAppBar({super.key, required this.onGetInvolvedTap});
  final VoidCallback onGetInvolvedTap;

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(RheaWebText.imagePathLogo, width: deviceSize.width <= 820 ? deviceSize.width * 0.2 : 156),
        // GestureDetector(
        //   onTap: onGetInvolvedTap,
        //   child: Container(
        //     decoration: const BoxDecoration(
        //       color: RheaWebColor.cardBackgroundColor,
        //       borderRadius: BorderRadius.all(RheaWebBorder.buttonRadius),
        //     ),
        //     child: Padding(
        //       padding: EdgeInsets.symmetric(
        //           vertical: deviceSize.width >= 600 ? 12 : 10, horizontal: deviceSize.width >= 600 ? 24 : 20),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.only(right: 12),
        //             child: Text(RheaWebText.headerButtonTitle,
        //                 style: deviceSize.width >= 600 ? RheaWebFont.regularFont : RheaWebFont.smallFontBold),
        //           ),
        //           SvgPicture.asset(RheaWebText.iconPathGetInvolved, height: deviceSize.width >= 600 ? 20 : 14)
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
