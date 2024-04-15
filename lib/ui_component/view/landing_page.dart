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
    return Scaffold(
      backgroundColor: RheaWebColor.semanticPurpleColor,
      body: Stack(children: [
        Container(decoration: BoxDecoration(boxShadow: [RheaWebColor.logoShadow]), height: 1, width: 1),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(44, 0, 44, 0),
            child: Column(children: [
              RheaWebAppBar(),
              Flex(
                  direction: deviceSize.width > 1280 ? Axis.horizontal : Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: deviceSize.width > 1280 ? 0 : 64, top: 44),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Container(height: 3, width: 36, color: RheaWebColor.semanticPinkColor),
                            ),
                            Text(RheaWebText.teaserTitle,
                                style: RheaWebFont.lightFont
                                    .copyWith(color: RheaWebColor.semanticPinkColor, fontWeight: FontWeight.w700)),
                          ],
                        ),
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
                          debugPrint('Emailis submitted');
                        })
                      ]),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Image(image: AssetImage(RheaWebText.imagePathMock2), height: deviceSize.height * 0.6),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Image(image: AssetImage(RheaWebText.imagePathMock1), height: deviceSize.height * 0.8),
                      ),
                    ]),
                  ]),
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

  void submitEmail() {
    widget.onSubmited();
    setState(() => isSubmitted = true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: RheaWebColor.semanticWhiteColor, borderRadius: BorderRadius.all(RheaWebBorder.buttonRadius)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(48, 4, 4, 4),
        child: Row(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(right: 64),
            child: Text(RheaWebText.submitEmailHint, style: RheaWebFont.lightFont),
          ),
          GestureDetector(
            onTap: () => submitEmail(),
            child: Container(
                decoration: const BoxDecoration(
                    color: RheaWebColor.semanticRedColor, borderRadius: BorderRadius.all(RheaWebBorder.buttonRadius)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                  child: Text(RheaWebText.submitEmailTitle,
                      style: RheaWebFont.regularFont.copyWith(color: RheaWebColor.accentTextColor)),
                )),
          )
        ]),
      ),
    );
  }
}
