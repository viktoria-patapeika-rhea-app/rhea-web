import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

import 'package:rhea_ai_website/ui_component/util/utils.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _jumpKey = GlobalKey();
  List<String> valueIconList = [
    RheaWebText.iconPathPersonalizatoin,
    // RheaWebText.iconPathEmpowerment,

    RheaWebText.iconPathPersonalizatoin,
    RheaWebText.iconPathTransparency,
    RheaWebText.iconPathPrivacy
  ];
  List<String> flowIconList = [
    RheaWebText.iconPathFlowStep1,
    RheaWebText.iconPathFlowStep2,
    RheaWebText.iconPathFlowStep3,
    RheaWebText.iconPathFlowStep4
  ];
  List<String> progressIconList = [
    RheaWebText.iconPathProgressDesign,
    RheaWebText.iconPathProgressDevelopment,
    RheaWebText.iconPathProgressTesting,
    RheaWebText.iconPathProgressRelease,
  ];
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    int cardsCrossAxisCount = deviceSize.width < 600
        ? 1
        : deviceSize.width >= 600 && deviceSize.width < 1024
            ? 2
            : 4;
    int imgCrossAxisCount = deviceSize.width < 600
        ? 2
        : deviceSize.width >= 600 && deviceSize.width < 1024
            ? 3
            : 5;
    return Material(
      color: RheaWebColor.backgroundColor,
      child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(alignment: AlignmentDirectional.center, children: [
                Container(
                    height: 720,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [RheaWebColor.semanticRedColor, RheaWebColor.backgroundColor],
                        ))),
                Column(children: [
                  Text(
                    RheaWebText.landingPageTitle,
                    style: RheaWebFont.titleFont,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 44, bottom: 72),
                    child: SizedBox(
                        width: deviceSize.width * .6,
                        child: Text(RheaWebText.landingPageSubtitle,
                            style: RheaWebFont.regularFont, textAlign: TextAlign.center)),
                  ),
                  GestureDetector(
                      onTap: () {
                        Scrollable.ensureVisible(_jumpKey.currentContext!, duration: const Duration(seconds: 1));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: RheaWebColor.backgroundColor,
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
                                    style: RheaWebFont.regularFont
                                        .copyWith(color: RheaWebColor.semanticRedColor.withOpacity(0.7))),
                              ),
                              SvgPicture.asset(RheaWebText.iconPathChevronDown,
                                  height: 24,
                                  colorFilter:
                                      ColorFilter.mode(RheaWebColor.semanticRedColor.withOpacity(0.7), BlendMode.srcIn))
                            ],
                          ),
                        ),
                      )),
                ]),
              ]),
              Stack(
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (imgCrossAxisCount == 5)
                          Padding(
                              padding: const EdgeInsets.only(top: 96),
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(RheaWebBorder.imageRadius),
                                  child: SvgPicture.asset(RheaWebText.imagePathMock1,
                                      width: deviceSize.width / (imgCrossAxisCount + 2)))),
                        ClipRRect(
                            borderRadius: const BorderRadius.all(RheaWebBorder.imageRadius),
                            child: SvgPicture.asset(RheaWebText.imagePathMock2,
                                width: deviceSize.width / (imgCrossAxisCount + 2))),
                        if (imgCrossAxisCount == 5)
                          Padding(
                            padding: const EdgeInsets.only(top: 96),
                            child: ClipRRect(
                                borderRadius: const BorderRadius.all(RheaWebBorder.imageRadius),
                                child: SvgPicture.asset(RheaWebText.imagePathMock3,
                                    width: deviceSize.width / (imgCrossAxisCount + 2))),
                          ),
                        if (imgCrossAxisCount == 5 || imgCrossAxisCount == 3)
                          ClipRRect(
                              borderRadius: const BorderRadius.all(RheaWebBorder.imageRadius),
                              child: SvgPicture.asset(RheaWebText.imagePathMock4,
                                  width: deviceSize.width / (imgCrossAxisCount + 2))),
                        Padding(
                          padding: imgCrossAxisCount == 5 ? const EdgeInsets.only(top: 96) : EdgeInsets.zero,
                          child: ClipRRect(
                              borderRadius: const BorderRadius.all(RheaWebBorder.imageRadius),
                              child: SvgPicture.asset(RheaWebText.imagePathMock5,
                                  width: deviceSize.width / (imgCrossAxisCount + 2))),
                        ),
                      ]),
                  Container(
                    width: deviceSize.width,
                    height: deviceSize.width * .7,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [RheaWebColor.backgroundColor.withOpacity(0), RheaWebColor.backgroundColor],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0, 0.7]),
                    ),
                  ),
                ],
              ),
              Text(key: _jumpKey, RheaWebText.landingPageFlowTitle, style: RheaWebFont.titleFont),
              Padding(
                padding: const EdgeInsets.only(top: 72, bottom: 96),
                child: GridView.count(
                    crossAxisCount: cardsCrossAxisCount,
                    crossAxisSpacing: 44,
                    mainAxisSpacing: 44,
                    childAspectRatio: 0.65,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      LandingPageCard(
                        cardTitle: RheaWebText.landingPageFlowText.keys.elementAt(0).toString(),
                        cardIcon: flowIconList[0],
                        cardDescription: RheaWebText.landingPageFlowText.values.elementAt(0).toString(),
                      ),
                      LandingPageCard(
                        cardTitle: RheaWebText.landingPageFlowText.keys.elementAt(2).toString(),
                        cardIcon: flowIconList[2],
                        cardDescription: RheaWebText.landingPageFlowText.values.elementAt(2).toString(),
                      ),
                      LandingPageCard(
                        cardTitle: RheaWebText.landingPageFlowText.keys.elementAt(1).toString(),
                        cardIcon: flowIconList[1],
                        cardDescription: RheaWebText.landingPageFlowText.values.elementAt(1).toString(),
                      ),
                      LandingPageCard(
                        cardTitle: RheaWebText.landingPageFlowText.keys.elementAt(3).toString(),
                        cardIcon: flowIconList[3],
                        cardDescription: RheaWebText.landingPageFlowText.values.elementAt(3).toString(),
                      ),
                    ]),
              ),
              Stack(alignment: AlignmentDirectional.center, children: [
                Container(
                    height: 340,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [RheaWebColor.semanticGreenColor.withOpacity(0.5), RheaWebColor.backgroundColor],
                        ))),
                Column(children: [
                  Text(RheaWebText.landingPageMissonTitle, style: RheaWebFont.titleFont),
                  Padding(
                    padding: const EdgeInsets.only(top: 44, bottom: 72),
                    child: SizedBox(
                        width: deviceSize.width * .6,
                        child: Text(
                          RheaWebText.landingPageMissionSubtitle,
                          style: RheaWebFont.regularFont,
                          textAlign: TextAlign.center,
                        )),
                  ),
                ]),
              ]),
              Text(RheaWebText.landingPageValuesTitle, style: RheaWebFont.titleFont),
              Padding(
                padding: const EdgeInsets.only(top: 72, bottom: 96),
                child: GridView.count(
                    crossAxisCount: cardsCrossAxisCount,
                    crossAxisSpacing: 44,
                    mainAxisSpacing: 44,
                    childAspectRatio: 0.65,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      LandingPageCard(
                        cardTitle: RheaWebText.landingPageValuesText.keys.elementAt(0).toString(),
                        cardIcon: valueIconList[0],
                        cardDescription: RheaWebText.landingPageValuesText.values.elementAt(0).toString(),
                      ),
                      LandingPageCard(
                        cardTitle: RheaWebText.landingPageValuesText.keys.elementAt(2).toString(),
                        cardIcon: valueIconList[2],
                        cardDescription: RheaWebText.landingPageValuesText.values.elementAt(2).toString(),
                      ),
                      LandingPageCard(
                        cardTitle: RheaWebText.landingPageValuesText.keys.elementAt(1).toString(),
                        cardIcon: valueIconList[1],
                        cardDescription: RheaWebText.landingPageValuesText.values.elementAt(1).toString(),
                      ),
                      LandingPageCard(
                        cardTitle: RheaWebText.landingPageValuesText.keys.elementAt(3).toString(),
                        cardIcon: valueIconList[3],
                        cardDescription: RheaWebText.landingPageValuesText.values.elementAt(3).toString(),
                      ),
                    ]),
              ),
              Text(
                RheaWebText.landingPageProgressTitle,
                style: RheaWebFont.titleFont,
                textAlign: TextAlign.center,
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 44, bottom: 72),
                  child: SizedBox(
                      width: deviceSize.width * .6,
                      child: Text(RheaWebText.landingPageProgressSubtitle,
                          style: RheaWebFont.regularFont, textAlign: TextAlign.center))),
              Padding(
                padding: const EdgeInsets.only(bottom: 72),
                child: Stack(children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        deviceSize.width < 600
                            ? 36
                            : deviceSize.width < 1300
                                ? 116
                                : 216,
                        132,
                        deviceSize.width < 600
                            ? 36
                            : deviceSize.width < 1300
                                ? 116
                                : 216,
                        0),
                    child: Divider(
                      height: 3,
                      color: RheaWebColor.semanticWhiteColor,
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LandingPageProgressItem(
                          itemTitle: RheaWebText.landingPageProgressList.keys.elementAt(0).toString(),
                          itemDescription: RheaWebText.landingPageProgressList.values.elementAt(0).toString(),
                          itemIcon: progressIconList[0],
                          isDone: true,
                        ),
                        LandingPageProgressItem(
                          itemTitle: RheaWebText.landingPageProgressList.keys.elementAt(1).toString(),
                          itemDescription: RheaWebText.landingPageProgressList.values.elementAt(1).toString(),
                          itemIcon: progressIconList[1],
                          isDone: true,
                        ),
                        LandingPageProgressItem(
                          itemTitle: RheaWebText.landingPageProgressList.keys.elementAt(2).toString(),
                          itemDescription: RheaWebText.landingPageProgressList.values.elementAt(2).toString(),
                          itemIcon: progressIconList[2],
                          isDone: false,
                        ),
                        LandingPageProgressItem(
                          itemTitle: RheaWebText.landingPageProgressList.keys.elementAt(3).toString(),
                          itemDescription: RheaWebText.landingPageProgressList.values.elementAt(3).toString(),
                          itemIcon: progressIconList[3],
                          isDone: false,
                        ),
                      ]),
                ]),
              ),
            ],
          )),
    );
  }
}

class LandingPageProgressItem extends StatelessWidget {
  const LandingPageProgressItem(
      {super.key,
      required this.itemTitle,
      required this.itemIcon,
      required this.itemDescription,
      required this.isDone});
  final String itemTitle;
  final String itemIcon;
  final String itemDescription;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 22),
          child: Text(itemTitle, style: RheaWebFont.regularFont),
        ),
        SvgPicture.asset(itemIcon),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 22),
          child: Container(
              height: 72,
              width: 72,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [
                    isDone ? RheaWebColor.semanticGreenColor : RheaWebColor.semanticRedColor,
                    RheaWebColor.backgroundColor
                  ]))),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 220),
          child: Text(
            itemDescription,
            style: RheaWebFont.smallFont,
            textAlign: TextAlign.center,
            maxLines: null,
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
      ]),
    );
  }
}

class LandingPageCard extends StatefulWidget {
  const LandingPageCard({super.key, required this.cardTitle, required this.cardIcon, required this.cardDescription});
  final String cardTitle;
  final String cardIcon;
  final String cardDescription;

  @override
  State<LandingPageCard> createState() => _LandingPageCardState();
}

class _LandingPageCardState extends State<LandingPageCard> {
  @override
  Widget build(BuildContext context) {
    // bool isCardHoveredOn = false;
    return IntrinsicHeight(
      child: Container(
        decoration: const BoxDecoration(
            color: RheaWebColor.cardBackgroundColor,
            borderRadius: BorderRadius.all(RheaWebBorder.buttonRadius),
            boxShadow: [
              BoxShadow(color: Colors.transparent, blurRadius: 4, offset: Offset(0, 4)),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(widget.cardTitle, style: RheaWebFont.regularFont, textAlign: TextAlign.center),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: SvgPicture.asset(widget.cardIcon),
            ),
            Flexible(
                child: Text(
              widget.cardDescription,
              style: RheaWebFont.smallFont,
              textAlign: TextAlign.center,
              maxLines: null,
              softWrap: true,
              overflow: TextOverflow.visible,
            )),
          ]),
        ),
      ),
    );
  }
}
