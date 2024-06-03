import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rhea_ai_website/ui_component/util/rhea_web_color.dart';
import 'package:rhea_ai_website/ui_component/util/rhea_web_font.dart';
import 'package:rhea_ai_website/ui_component/util/rhea_web_text.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 72),
      child: Column(children: [
        Text('General questions', style: RheaWebFont.titleFont),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 44),
          child: SizedBox(
            width: deviceSize.width,
            child: ListView.builder(
                itemCount: RheaWebText.faqGeneral.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => FAQBox(
                    question: RheaWebText.faqGeneral.keys.elementAt(index),
                    answer: RheaWebText.faqGeneral.values.elementAt(index))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 44),
          child: Text('Technical Support', style: RheaWebFont.titleFont),
        ),
        SizedBox(
          width: deviceSize.width,
          child: ListView.builder(
              itemCount: RheaWebText.faqTechnicalSupport.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => FAQBox(
                  question: RheaWebText.faqTechnicalSupport.keys.elementAt(index),
                  answer: RheaWebText.faqTechnicalSupport.values.elementAt(index))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 44),
          child: Text('Additional Questions', style: RheaWebFont.titleFont),
        ),
        SizedBox(
          width: deviceSize.width,
          child: ListView.builder(
              itemCount: RheaWebText.faqAdditional.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => FAQBox(
                  question: RheaWebText.faqAdditional.keys.elementAt(index),
                  answer: RheaWebText.faqAdditional.values.elementAt(index))),
        ),
      ]),
    );
  }
}

class FAQBox extends StatefulWidget {
  const FAQBox({super.key, required this.question, required this.answer});
  final String question;
  final String answer;

  @override
  State<FAQBox> createState() => _FAQBoxState();
}

class _FAQBoxState extends State<FAQBox> {
  bool isOpen = false;
  void changeQuestionState() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: changeQuestionState,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.question,
                  style: RheaWebFont.regularFont, overflow: TextOverflow.fade, maxLines: null, softWrap: true),
              SvgPicture.asset(!isOpen ? RheaWebText.iconPathArrowDown : RheaWebText.iconPathArrowUp),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 22),
          child: Divider(height: 3, color: RheaWebColor.cardBackgroundColor),
        ),
        if (isOpen)
          Padding(
            padding: const EdgeInsets.only(bottom: 44),
            child: Text(widget.answer, style: RheaWebFont.smallFont, textAlign: TextAlign.start),
          ),
      ],
    );
  }
}
