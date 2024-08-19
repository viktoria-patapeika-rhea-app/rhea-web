import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'dart:math' show pi;

import 'package:rhea_ai_website/ui_component/util/utils.dart';
import 'package:rhea_ai_website/ui_component/view/ui_elements/rhea_web_algorithm_illustration.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final GlobalKey _jumpKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    List<Widget> illustrations = [AlgorithmIllustration(maxSize: deviceSize.width * .3),AlgorithmIllustration(maxSize: deviceSize.width * .3),AlgorithmIllustration(maxSize: deviceSize.width * .3),AlgorithmIllustration(maxSize: deviceSize.width * .3),];

    return Material(
      color: RheaWebColor.backgroundColor,
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(alignment: AlignmentDirectional.centerStart, children: [
            Container(
                height: 720,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [RheaWebColor.semanticRedColor, RheaWebColor.backgroundColor],
                    ))),
            SizedBox(
              width: deviceSize.width * 0.5,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  RheaWebText.landingPageTitle,
                  style: RheaWebFont.titleFont,
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 44, bottom: 72),
                  child: SizedBox(
                      width: deviceSize.width * .6,
                      child: Text(RheaWebText.landingPageSubtitle,
                          style: RheaWebFont.regularFont, textAlign: TextAlign.start)),
                ),
                GestureDetector(
                    onTap: () {
                      Scrollable.ensureVisible(_jumpKey.currentContext!, duration: const Duration(seconds: 1));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: RheaWebColor.semanticRedColor,
                          borderRadius: BorderRadius.all(RheaWebBorder.buttonRadius)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(36, 12, 24, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Text('Discover',
                                  style: RheaWebFont.regularFont.copyWith(color: RheaWebColor.regularTextColor)),
                            ),
                            SvgPicture.asset(RheaWebText.iconPathChevronDown,
                                height: 24,
                                colorFilter: ColorFilter.mode(RheaWebColor.regularTextColor, BlendMode.srcIn))
                          ],
                        ),
                      ),
                    )),
              ]),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 72),
            child: Text(RheaWebText.landingPageFlowTitle, style: RheaWebFont.titleFont),
          ),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 72),
              child: LandingFlowItem(
                direction: deviceSize.width > 720 ? Axis.horizontal : Axis.vertical,
                illustration: illustrations[index],
                title: RheaWebText.landingFlow.keys.elementAt(index),
                description: RheaWebText.landingFlow.values.elementAt(index),
                deviceSize: deviceSize,
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class LandingFlowItem extends StatelessWidget {
  const LandingFlowItem(
      {super.key,
      required this.illustration,
      required this.title,
      required this.description,
      required this.direction,
      required this.deviceSize});

  final Axis direction;
  final Widget illustration;
  final String title;
  final String description;
  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: direction,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: direction == Axis.vertical ? 66 : 0),
          child: illustration,
        ),
        ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: direction == Axis.horizontal ? deviceSize.width * .4 : deviceSize.width * .7),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: RheaWebFont.titleSmallFont),
            Padding(
              padding: const EdgeInsets.only(top: 66),
              child: Text(description, style: RheaWebFont.regularFont),
            ),
          ]),
        ),
      ],
    );
  }
}
