import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rhea_ai_website/ui_component/util/rhea_web_routes.dart';

import 'package:rhea_ai_website/ui_component/util/utils.dart';

class RheaWebFooter extends StatelessWidget {
  RheaWebFooter({super.key, required this.onEmailSubmit, required this.onPageNavigation});
  final VoidCallback onEmailSubmit;
  final ValueChanged<String>? onPageNavigation;

  //final Map<String, MaterialPageRoute> pageLinks = {'About': MaterialPageRoute(builder: (context) => ,)};
  final Map<String, String> pages = {
    'About': RheaWebRoutes.homePageRoute,
    'Features': RheaWebRoutes.featuresPageRoute,
    'FAQ': RheaWebRoutes.faqPageRoute,
    'Pricing': RheaWebRoutes.pricingPageRoute,
    'Privacy Policy': RheaWebRoutes.privacyPolicyPageRoute,
    'Terms of Service': RheaWebRoutes.termsPageRoute,
    'Join our team': RheaWebRoutes.teamPageRoute,
  };
  final List<String> socialMediaLinks = [
    RheaWebText.iconPathLinkedinLogo,
    RheaWebText.iconPathInstagramLogo,
    RheaWebText.iconPathFacebookLogo,
    RheaWebText.iconPathTiktokLogo
  ];

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 44),
      child: LayoutBuilder(builder: (context, constraints) {
        return Flex(
            direction: constraints.maxWidth < 1030 ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment:
                constraints.maxWidth > 1030 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Image.asset(RheaWebText.imagePathLogo, height: 37),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(RheaWebText.footerLogoSubtitle, style: RheaWebFont.smallFont),
                )
              ]),
              SizedBox(
                height: 350,
                width: 150,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: pages.length,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 22),
                    child: GestureDetector(
                        onTap: () => onPageNavigation!(pages.values.elementAt(index)),
                        child: Text(pages.keys.elementAt(index), style: RheaWebFont.regularFont)),
                  ),
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Contact Us', style: RheaWebFont.regularFont),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  child: Row(children: [
                    SvgPicture.asset(RheaWebText.iconPathEmail),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(RheaWebText.footerContactEmail, style: RheaWebFont.smallFont),
                    ),
                  ]),
                ),
                SizedBox(
                  width: 200,
                  height: 60,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: socialMediaLinks.length,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(right: 22),
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 22),
                            child: SvgPicture.asset(
                              socialMediaLinks[index],
                            ),
                          )),
                ),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Join Newsletter', style: RheaWebFont.regularFont),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  child: Text('Get notified about latest updates and releases.', style: RheaWebFont.smallFont),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(RheaWebBorder.buttonRadius),
                        color: RheaWebColor.cardBackgroundColor),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(32, 4, 4, 4),
                      child: Row(
                        children: [
                          SizedBox(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter your email',
                                    hintStyle: RheaWebFont.smallFont),
                              ),
                              width: 310),
                          GestureDetector(
                            onTap: onEmailSubmit,
                            child: Container(
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle, color: RheaWebColor.semanticWhiteColor),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset(RheaWebText.iconPathChevronRight,
                                    color: RheaWebColor.cardBackgroundColor),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ])
            ]);
      }),
    );
  }
}
