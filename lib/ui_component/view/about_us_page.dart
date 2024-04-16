import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rhea_ai_website/dto/rhea_web_question.dart';
import 'package:rhea_ai_website/ui_component/util/rhea_web_color.dart';
import 'package:rhea_ai_website/ui_component/util/utils.dart';
import 'package:rhea_ai_website/ui_component/view/ui_elements/rhea_web_app_bar.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

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
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 44),
                child: Text('About us', style: RheaWebFont.logoFont),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 44),
                child: Text(RheaWebText.aboutUsPageSubtitle,
                    style: RheaWebFont.regularFont.copyWith(color: RheaWebColor.semanticWhiteColor)),
              ),
              ListView.builder(
                  itemCount: RheaWebText.aboutUsQuestionList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, int) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 44),
                      child: RheaWebQuestionContainer(question: RheaWebText.aboutUsQuestionList[int]),
                    );
                  })
            ]),
          ),
        ),
      ]),
    );
  }
}

class RheaWebQuestionContainer extends StatefulWidget {
  const RheaWebQuestionContainer({super.key, required this.question});
  final RheaWebQuestion question;

  @override
  State<RheaWebQuestionContainer> createState() => _RheaWebQuestionContainerState();
}

class _RheaWebQuestionContainerState extends State<RheaWebQuestionContainer> {
  bool isQuestionOpen = false;
  void updateQuestionState() {
    setState(() => isQuestionOpen = !isQuestionOpen);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onTap: updateQuestionState,
        child: Container(
          decoration:
              const BoxDecoration(border: Border(bottom: BorderSide(color: RheaWebColor.semanticWhiteColor, width: 2))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.question.question!,
                      style: RheaWebFont.regularFont.copyWith(color: RheaWebColor.semanticWhiteColor)),
                  SvgPicture.asset(isQuestionOpen ? RheaWebText.iconPathMinus : RheaWebText.iconPathPlus),
                ]),
          ),
        ),
      ),
      if (isQuestionOpen)
        Padding(
          padding: const EdgeInsets.only(top: 44),
          child: SizedBox(
              child: Text(widget.question.answer!,
                  style: RheaWebFont.lightFont.copyWith(color: RheaWebColor.semanticWhiteColor))),
        ),
    ]);
  }
}
