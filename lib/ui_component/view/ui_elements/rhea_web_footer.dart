import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
    RheaWebText.iconPathLinkedinLogo: 'https://www.linkedin.com/company/rhea-app/',
    RheaWebText.iconPathInstagramLogo: 'https://www.instagram.com/rhea.app?igsh=MTlic2Y0azZrcXhwMg==',
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
      final String apiUrl = 'https://55phj1v7dk.execute-api.eu-north-1.amazonaws.com/prod/SubmitBetaTester';

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
    final screenWidth = deviceSize.width;
    final titleFontSize = screenWidth < 900 ? 28.0 : 36.0;
    final descriptionFontSize = screenWidth < 900 ? 14.0 : 18.0;
    final inputLabelFontSize = screenWidth < 900 ? 14.0 : 18.0;
    final buttonFontSize = screenWidth < 900 ? 14.0 : 18.0;
    final logoFontSize = screenWidth < 900 ? 28.0 : 36.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('JOIN NEWSLETTER',
            style: GoogleFonts.orbitron(color: Colors.white, fontSize: titleFontSize, fontWeight: FontWeight.w300)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            'Get notified about our latest updates and releases.',
            style: GoogleFonts.exo2(color: Colors.white, fontSize: descriptionFontSize, fontWeight: FontWeight.w200),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: SizedBox(
            width: screenWidth < 900 ? deviceSize.width * 0.6 : deviceSize.width * 0.4,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 12, 4, 12),
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        label: Text('Enter your email',
                            style: GoogleFonts.exo2(
                                color: Colors.white, fontSize: inputLabelFontSize, fontWeight: FontWeight.w200))),
                    style: GoogleFonts.exo2(
                        color: Colors.white, fontSize: inputLabelFontSize, fontWeight: FontWeight.w200),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    // onSaved: (value) {
                    //   _email = value;
                    // },
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: _isSubmitting ? null : onEmailSubmit,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff0D1B3C),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
              child: Row(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _isSubmittedSuccessfully ? 'Subscribed!' : 'Subscribe',
                    style: GoogleFonts.exo2(color: Colors.white, fontSize: buttonFontSize, fontWeight: FontWeight.w200),
                  ),
                ),
              ]),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 44),
          child: LayoutBuilder(builder: (context, constraints) {
            return Flex(
                direction: constraints.maxWidth < 720 ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment:
                    constraints.maxWidth > 720 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text('RHEA', style: GoogleFonts.orbitron(color: Colors.white, fontSize: logoFontSize)),
                    ),
                    Row(children: [
                      SvgPicture.asset(RheaWebText.iconPathEmail),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          RheaWebText.footerContactEmail,
                          style: GoogleFonts.exo2(
                              color: Colors.white, fontSize: descriptionFontSize, fontWeight: FontWeight.w200),
                        ),
                      ),
                    ]),
                  ]),
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
                ]);
          }),
        ),
      ],
    );
  }
}
