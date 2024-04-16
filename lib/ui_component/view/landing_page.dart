import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

import 'package:rhea_ai_website/ui_component/util/utils.dart';
import 'package:rhea_ai_website/ui_component/view/ui_elements/rhea_web_app_bar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Material(
      color: RheaWebColor.semanticPurpleColor,
      child: Stack(children: [
        Positioned(
            bottom: 0,
            right: 0,
            child: Container(decoration: BoxDecoration(boxShadow: [RheaWebColor.logoShadow]), height: 1, width: 1)),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 72),
                child: Flex(
                    direction: deviceSize.width > 1280 ? Axis.horizontal : Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: deviceSize.width > 1280 ? 0 : 64, top: 44),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Container(height: 3, width: 36, color: RheaWebColor.semanticWhiteColor),
                            ),
                            Text(RheaWebText.teaserTitle,
                                style: RheaWebFont.lightFont
                                    .copyWith(color: RheaWebColor.semanticWhiteColor, fontWeight: FontWeight.w700)),
                          ]),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 48, top: 12),
                            child: SizedBox(
                              width: deviceSize.width * 0.4,
                              child: Text(RheaWebText.landingPageTitle,
                                  style: RheaWebFont.logoFont
                                      .copyWith(fontWeight: FontWeight.w600, fontSize: RheaWebFont.titleFontSize)),
                            ),
                          ),
                          SubmitEmailButton(onSubmited: () {
                            debugPrint('Email is submitted');
                          })
                        ]),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Image(image: AssetImage(RheaWebText.imagePathMock2), height: deviceSize.height * 0.5),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Image(image: AssetImage(RheaWebText.imagePathMock1), height: deviceSize.height * 0.7),
                        ),
                      ]),
                    ]),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}

// TODOo: change to get_it

class SubmitEmailButton extends StatefulWidget {
  const SubmitEmailButton({super.key, required this.onSubmited});
  final VoidCallback onSubmited;

  @override
  State<SubmitEmailButton> createState() => _SubmitEmailButtonState();
}

class _SubmitEmailButtonState extends State<SubmitEmailButton> {
  bool isSubmitted = false;
  String? email;

  final _formKey = GlobalKey<FormState>();

  void submitEmail() {
    widget.onSubmited();
    if (this._formKey.currentState!.validate()) {
      setState(() {
        this._formKey.currentState!.save();
        isSubmitted = true;
      });
    }
    // setState(() => isSubmitted = true);
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value) ? 'Enter a valid email address' : null;
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          color: RheaWebColor.semanticWhiteColor, borderRadius: BorderRadius.all(RheaWebBorder.buttonRadius)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(48, 4, 4, 4),
        child: Form(
          key: this._formKey,
          child: Row(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
            // Padding(
            //   padding: const EdgeInsets.only(right: 64),
            //   child: Text(RheaWebText.submitEmailHint, style: RheaWebFont.lightFont),
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 64),
              child: SizedBox(
                width: deviceSize.width * 0.25,
                child: TextFormField(
                  style: RheaWebFont.regularFont,
                  decoration: InputDecoration(hintText: RheaWebText.submitEmailHint, hintStyle: RheaWebFont.lightFont),
                  autovalidateMode: AutovalidateMode.disabled,
                  onSaved: (value) => this.email = value,
                  onChanged: (value) {
                    setState(() {
                      isSubmitted = false;
                    });
                  },
                  validator: validateEmail,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => submitEmail(),
              child: Container(
                  decoration: BoxDecoration(
                      color: !isSubmitted ? RheaWebColor.semanticRedColor : RheaWebColor.semanticGreenColor,
                      borderRadius: const BorderRadius.all(RheaWebBorder.buttonRadius)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                    child: Text(!isSubmitted ? RheaWebText.submitEmailTitle : RheaWebText.submittedEmailTitle,
                        style: RheaWebFont.regularFont.copyWith(color: RheaWebColor.accentTextColor)),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
