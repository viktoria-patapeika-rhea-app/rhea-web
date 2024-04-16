import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:rhea_ai_website/ui_component/util/rhea_web_routes.dart';

import 'package:rhea_ai_website/ui_component/util/utils.dart';
import 'package:rhea_ai_website/ui_component/view/about_us_page.dart';
import 'package:rhea_ai_website/ui_component/view/landing_page.dart';

enum RheaWebAppBarItem { home, aboutUs }

class RheaWebAppBar extends StatefulWidget {
  RheaWebAppBar({
    super.key,
    //this.appBarItem = RheaWebAppBarItem.home,
    required this.onButtonTap,
    this.onTap,
  });
  final ValueChanged<String>? onTap;
  final VoidCallback onButtonTap;

  @override
  State<RheaWebAppBar> createState() => _RheaWebAppBarState();
}

class _RheaWebAppBarState extends State<RheaWebAppBar> {
  RheaWebAppBarItem appBarItem = RheaWebAppBarItem.home;
  changePage(RheaWebAppBarItem item, String route) {
    setState(() {
      appBarItem = item;
    });
    widget.onTap!(route);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 44),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(RheaWebText.logo, style: RheaWebFont.logoFont),
        Row(children: [
          RheaWebAppBarItemContainer(
              appBarItem: RheaWebAppBarItem.home,
              itemTitle: 'Home',
              //  onTap: () => onTap!(RheaWebRoutes.homePageRoute),
              onTap: () => changePage(RheaWebAppBarItem.home, RheaWebRoutes.homePageRoute),
              isSelected: appBarItem == RheaWebAppBarItem.home),
          RheaWebAppBarItemContainer(
              appBarItem: RheaWebAppBarItem.aboutUs,
              itemTitle: 'About us',
              //  onTap: () => onTap!(RheaWebRoutes.aboutPageRoute),
              onTap: () => changePage(RheaWebAppBarItem.aboutUs, RheaWebRoutes.aboutPageRoute),
              isSelected: appBarItem == RheaWebAppBarItem.aboutUs),
          // GestureDetector(
          //   onTap: () => widget.onButtonTap(),
          //   child: Container(
          //     decoration: const BoxDecoration(
          //         color: RheaWebColor.semanticWhiteColor, borderRadius: BorderRadius.all(RheaWebBorder.buttonRadius)),
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          //       child: Row(children: [
          //         Text(RheaWebText.contactButtonTitle, style: RheaWebFont.regularFont),
          //         Padding(
          //           padding: const EdgeInsets.only(left: 12),
          //           child: SvgPicture.asset(RheaWebText.iconPathSpark, color: RheaWebColor.semanticWhiteColor),
          //         )
          //       ]),
          //     ),
          //   ),
          // ),
        ])
      ]),
    );
  }
}

class RheaWebAppBarItemContainer extends StatelessWidget {
  const RheaWebAppBarItemContainer(
      {super.key, required this.appBarItem, required this.onTap, required this.itemTitle, required this.isSelected});

  final RheaWebAppBarItem appBarItem;
  final String itemTitle;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 48),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: isSelected
              ? const BoxDecoration(
                  border: Border(bottom: BorderSide(color: RheaWebColor.semanticWhiteColor, width: 2)))
              : const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              itemTitle,
              style: RheaWebFont.regularFont.copyWith(color: RheaWebColor.semanticWhiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
