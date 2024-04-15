import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

import 'package:rhea_ai_website/ui_component/util/utils.dart';
import 'package:rhea_ai_website/ui_component/view/about_us_page.dart';

enum RheaWebAppBarItem { home, aboutUs }

class RheaWebAppBar extends StatelessWidget {
  const RheaWebAppBar({super.key, this.appBarItem = RheaWebAppBarItem.home});
  final RheaWebAppBarItem appBarItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 44),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(RheaWebText.logo, style: RheaWebFont.logoFont),
        Row(children: [
          Padding(
            padding: const EdgeInsets.only(right: 48),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutUsPage()));
                // TODO: add get_it to change UI
              },
              child: Container(
                decoration: appBarItem == RheaWebAppBarItem.aboutUs
                    ? const BoxDecoration(
                        border: Border(bottom: BorderSide(color: RheaWebColor.semanticWhiteColor, width: 2)))
                    : const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    'About us',
                    style: RheaWebFont.regularFont.copyWith(color: RheaWebColor.semanticWhiteColor),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: RheaWebColor.semanticWhiteColor, borderRadius: BorderRadius.all(RheaWebBorder.buttonRadius)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Row(children: [
                Text(RheaWebText.contactButtonTitle, style: RheaWebFont.regularFont),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: SvgPicture.asset(RheaWebText.iconPathArrowDiagonal, color: RheaWebColor.semanticWhiteColor),
                )
              ]),
            ),
          ),
        ])
      ]),
    );
  }
}
