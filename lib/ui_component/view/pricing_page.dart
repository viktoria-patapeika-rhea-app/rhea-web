import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rhea_ai_website/ui_component/util/rhea_web_color.dart';
import 'package:rhea_ai_website/ui_component/util/rhea_web_font.dart';
import 'package:rhea_ai_website/ui_component/util/utils.dart';

class PricingPage extends StatelessWidget {
  PricingPage({super.key});

  final Map<String, Map<bool, bool>> features = {
    'Basic generated plans': {true: true},
    'Access to articles and content': {true: true},
    'Cycle insights': {true: true},
    'Cycle prediction up to 3 months': {true: true},
    'Cycle prediction up to 6 months': {false: true},
    'Workout regeneration': {false: true},
    'Custom workout creating': {false: true},
  };

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 72),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 22),
          child: Text('What plans will we offer?', textAlign: TextAlign.center, style: RheaWebFont.titleFont),
        ),
        SizedBox(
            width: deviceSize.width * .6,
            child: Text(
              'Whether you\'re just starting out or looking to unlock all the features, we\'ve got a plan that\'s perfect for your fitness journey. Choose the plan that suits you best and get ready to crush your goals!',
              textAlign: TextAlign.center,
              style: RheaWebFont.regularFont,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 44),
          child: Container(
            decoration: const BoxDecoration(
                color: RheaWebColor.cardBackgroundColor, borderRadius: BorderRadius.all(RheaWebBorder.buttonRadius)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 44),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('Feature', style: RheaWebFont.regularFont),
                    Row(children: [
                      Text('Freemium', style: RheaWebFont.regularFont),
                      Padding(
                        padding: const EdgeInsets.only(left: 72),
                        child: Text('Premium', style: RheaWebFont.regularFont),
                      ),
                    ]),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 44),
                    child: SizedBox(
                      width: deviceSize.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: features.length,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 22),
                          child: PricingPageFeatureComparison(
                            featureTitle: features.keys.elementAt(index).toString(),
                            avaiability: features.values.elementAt(index),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class PricingPageFeatureComparison extends StatelessWidget {
  const PricingPageFeatureComparison({super.key, required this.featureTitle, required this.avaiability});
  final String featureTitle;
  final Map<bool, bool> avaiability;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(featureTitle, style: RheaWebFont.smallFont),
        Row(children: [
          SvgPicture.asset(avaiability.keys.elementAt(0) ? RheaWebText.iconPathCheck : RheaWebText.iconPathClose,
              color: avaiability.keys.elementAt(0) == true
                  ? RheaWebColor.semanticGreenColor
                  : RheaWebColor.semanticRedColor),
          Padding(
            padding: const EdgeInsets.only(left: 126),
            child: SvgPicture.asset(
                avaiability.values.elementAt(0) ? RheaWebText.iconPathCheck : RheaWebText.iconPathClose,
                color: avaiability.values.elementAt(0) == true
                    ? RheaWebColor.semanticGreenColor
                    : RheaWebColor.semanticRedColor),
          )
        ]),
      ],
    );
  }
}
