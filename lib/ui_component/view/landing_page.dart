import 'dart:async';
import 'dart:convert';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' show pi;
import 'package:http/http.dart' as http;

import 'package:rhea_ai_website/ui_component/util/utils.dart';
import 'package:rhea_ai_website/ui_component/view/ui_elements/rhea_web_algorithm_illustration.dart';
import 'package:rhea_ai_website/ui_component/view/ui_elements/rhea_web_daily_updates_illustration.dart';
import 'package:rhea_ai_website/ui_component/view/ui_elements/rhea_web_health_metrics_illustration.dart';
import 'package:rhea_ai_website/ui_component/view/ui_elements/rhea_web_preferences_illustration.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final GlobalKey _jumpKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  bool _isSubmitting = false;
  bool _isSubmittedSuccessfully = false;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        _isSubmitting = true;
      });

      final data = {
        'name': _name,
        'email': _email,
      };

      try {
        final response = await http
            .post(
              Uri.parse('https://55phj1v7dk.execute-api.eu-north-1.amazonaws.com/'),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode(data),
            )
            .timeout(const Duration(seconds: 10));

        if (response.statusCode == 200) {
          setState(() {
            _isSubmitting = false;
            _isSubmittedSuccessfully = true;
          });
        } else {
          setState(() {
            _isSubmitting = false;
          });
          print('Failed to submit: ${response.statusCode}');
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
    double illustrationSize = deviceSize.width > 720 ? deviceSize.width * .3 : deviceSize.width * 0.6;

    List<Widget> illustrations = [
      RheaWebPreferencesIllustration(maxSize: illustrationSize),
      DailyUpdatesIllustration(maxSize: illustrationSize),
      AlgorithmIllustration(maxSize: illustrationSize),
      RheaWebHealthMetricsIllustration(maxSize: illustrationSize),
    ];

    return Material(
      color: RheaWebColor.backgroundColor,
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(alignment: AlignmentDirectional.centerStart, children: [
            Container(
                height: 720,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [RheaWebColor.semanticRedColor, RheaWebColor.backgroundColor],
                    ))),
            SizedBox(
              width: deviceSize.width * 0.8,
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
                        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Text('Become a Beta Tester',
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
              padding: EdgeInsets.only(bottom: deviceSize.width / 5),
              child: LandingFlowItem(
                direction: deviceSize.width > 760 ? Axis.horizontal : Axis.vertical,
                illustration: illustrations[index],
                title: RheaWebText.landingFlow.keys.elementAt(index),
                description: RheaWebText.landingFlow.values.elementAt(index),
                deviceSize: deviceSize,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 66),
            child: Container(
              key: _jumpKey,
              width: deviceSize.width * 0.6,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(RheaWebText.landingPageBetaTestTitle, style: RheaWebFont.titleSmallFont),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 66),
                      child: Text(RheaWebText.landingPageBetaTestDescription, style: RheaWebFont.regularFont),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Container(
                          decoration: BoxDecoration(
                              color: RheaWebColor.cardBackgroundColor, borderRadius: BorderRadius.circular(32)),
                          child: TextFormField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(32, 12, 4, 12),
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                label: Text('Enter your name', style: RheaWebFont.regularFont)),
                            style: RheaWebFont.regularFont,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _name = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: Container(
                            decoration: BoxDecoration(
                                color: RheaWebColor.cardBackgroundColor, borderRadius: BorderRadius.circular(32)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(32, 12, 4, 12),
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  label: Text('Enter your email', style: RheaWebFont.regularFont)),
                              style: RheaWebFont.regularFont,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _email = value;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32),
                          child: Text(
                            RheaWebText.landingPageBetaTestWarning,
                            style: GoogleFonts.openSans(
                                fontSize: 12,
                                color: RheaWebColor.regularTextColor,
                                fontWeight: RheaWebFont.lightFontWeight),
                          ),
                        ),
                        GestureDetector(
                          onTap: _isSubmitting ? null : _submitForm,
                          child: Container(
                            decoration: BoxDecoration(
                              color: _isSubmittedSuccessfully
                                  ? RheaWebColor.semanticGreenColor
                                  : _isSubmitting
                                      ? RheaWebColor.cardBackgroundColor
                                      : RheaWebColor.semanticRedColor,
                              borderRadius: BorderRadius.all(RheaWebBorder.buttonRadius),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Text(
                                        _isSubmittedSuccessfully
                                            ? 'Submitted!'
                                            : _isSubmitting
                                                ? 'Submitting...'
                                                : 'Join Beta Testers',
                                        style: RheaWebFont.regularFont.copyWith(color: RheaWebColor.regularTextColor),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ]),
            ),
          ),
        ]),
      ),
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
      crossAxisAlignment: direction == Axis.horizontal ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: direction == Axis.vertical ? 72 : 0),
          child: illustration,
        ),
        ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: direction == Axis.horizontal ? deviceSize.width * .4 : deviceSize.width * .7),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: RheaWebFont.titleSmallFont),
            Padding(
              padding: const EdgeInsets.only(top: 72),
              child: Text(description, style: RheaWebFont.regularFont),
            ),
          ]),
        ),
      ],
    );
  }
}
