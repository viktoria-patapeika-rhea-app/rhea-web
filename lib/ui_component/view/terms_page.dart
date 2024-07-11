import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rhea_ai_website/ui_component/util/utils.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 72),
        child: Text('This page is under development, check in later!', style: RheaWebFont.titleFont),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 72),
        child: SvgPicture.asset(RheaWebText.iconPathProgressIndicator),
      )
    ]);
  }
}