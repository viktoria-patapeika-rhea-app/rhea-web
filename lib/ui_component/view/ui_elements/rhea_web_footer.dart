import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rhea_ai_website/ui_component/util/rhea_web_routes.dart';
import 'package:http/http.dart' as http;
import 'package:rhea_ai_website/ui_component/util/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class RheaWebFooter extends StatefulWidget {
  RheaWebFooter({super.key, required this.onEmailSubmit, required this.onPageNavigation});
  final VoidCallback onEmailSubmit;
  final ValueChanged<String>? onPageNavigation;

  @override
  State<RheaWebFooter> createState() => _RheaWebFooterState();
}

class _RheaWebFooterState extends State<RheaWebFooter> {
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

  final Map<String, String> socialMediaLinks = {
    RheaWebText.iconPathLinkedinLogo: 'https://www.linkedin.com/company/102444016/',
    RheaWebText.iconPathInstagramLogo:
        'https://www.instagram.com/rheaai.app?igsh=MXZrdjdjZmpkbzQ1eA%3D%3D&utm_source=qr',
    RheaWebText.iconPathFacebookLogo: '',
    RheaWebText.iconPathTiktokLogo: 'https://www.tiktok.com/@rheaai_?_t=8p1jkb8hcOn&_r=1'
  };

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  bool _isSubmitting = false;
  bool _isSubmittedSuccessfully = false;

  void onEmailSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      // Get the email from the controller
      final email = _emailController.text;

      // Your API Gateway endpoint
      final String apiUrl = 'https://55phj1v7dk.execute-api.eu-north-1.amazonaws.com/prod/SubsribeToNewsletter';

      try {
        // Make the HTTP POST request
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'email': email}),
        );
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        // Check if the request was successful
        if (response.statusCode == 200) {
          // Update the state to show success
          setState(() {
            _isSubmitting = false;
            _isSubmittedSuccessfully = true;
          });
        } else {
          setState(() {
            _isSubmitting = false;
          });
        }
      } on TimeoutException {
        setState(() {
          _isSubmitting = false;
        });
        print('Request timed out');
      } catch (e) {
        setState(() {
          _isSubmitting = false;
        });
        print('Failed to submit: $e');
      }
    }
  }

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
                Image.asset(RheaWebText.imagePathLogo, width: deviceSize.width <= 820 ? deviceSize.width * 0.2 : 156),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(RheaWebText.footerLogoSubtitle, style: RheaWebFont.smallFontBold),
                )
              ]),
              // SizedBox(
              //   height: 350,
              //   width: 150,
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: pages.length,
              //     physics: const NeverScrollableScrollPhysics(),
              //     scrollDirection: Axis.vertical,
              //     itemBuilder: (context, index) => Padding(
              //       padding: const EdgeInsets.only(bottom: 22),
              //       child: GestureDetector(
              //           onTap: () => onPageNavigation!(pages.values.elementAt(index)),
              //           child: Text(pages.keys.elementAt(index), style: RheaWebFont.regularFont)),
              //     ),
              //   ),
              // ),
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
                            child: GestureDetector(
                              onTap: () async {
                                if (!await launchUrl(Uri.parse(socialMediaLinks.values.elementAt(index)))) {
                                  throw Exception('Could not launch ${socialMediaLinks.values.elementAt(index)}');
                                }
                              },
                              child: SvgPicture.asset(
                                socialMediaLinks.keys.elementAt(index),
                              ),
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
                Form(
                  key: _formKey,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(RheaWebBorder.buttonRadius),
                              color: RheaWebColor.cardBackgroundColor),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(32, 4, 4, 4),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 310,
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter your email',
                                      hintStyle: RheaWebFont.smallFont,
                                    ),
                                    style: RheaWebFont.regularFont,
                                    validator: (value) {
                                      if (value == null || value.isEmpty || !value.contains('@')) {
                                        return 'Please enter a valid email';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                GestureDetector(
                                  onTap: _isSubmitting ? null : onEmailSubmit,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: RheaWebColor.semanticWhiteColor,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: _isSubmitting
                                          ? SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                                color: RheaWebColor.cardBackgroundColor,
                                              ),
                                            )
                                          : SvgPicture.asset(
                                              !_isSubmittedSuccessfully
                                                  ? RheaWebText.iconPathChevronRight
                                                  : RheaWebText.iconPathCheckSolo,
                                              colorFilter: const ColorFilter.mode(
                                                  RheaWebColor.cardBackgroundColor, BlendMode.srcIn),
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (_isSubmittedSuccessfully)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text('Submitted successfully!'),
                          ),
                      ],
                    ),
                  ),
                ),
              ])
            ]);
      }),
    );
  }
}
