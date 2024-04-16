import 'package:rhea_ai_website/dto/rhea_web_question.dart';

class RheaWebText {
  // Assets
  // SVG
  static const String iconPathArrowDiagonal = 'assets/icons/arrow_diagonal.svg';
  static const String iconPathPlus = 'assets/icons/plus.svg';
  static const String iconPathMinus = 'assets/icons/minus.svg';
  // PNG
  static const String imagePathMock1 = 'assets/mock_1.png';
  static const String imagePathMock2 = 'assets/mock_2.png';
  // Text
  // Landing page
  static const String logo = 'Rhea.ai';
  static const String contactButtonTitle = 'Get involved';
  static const String teaserTitle = 'Coming Soon';
  static const String landingPageTitle = 'Get notified about updates and releases';
  static const String submitEmailTitle = 'Notify Me';
  static const String submitEmailHint = 'Enter your email address';
  static const String submittedEmailTitle = 'Subscribed!';
  static const String aboutUsPageSubtitle =
      'Empowering women to achieve fitness goals efficiently with personalized workout plans based on their menstrual cycle using AI.';
  static List<RheaWebQuestion> aboutUsQuestionList = [
    RheaWebQuestion(
        question: 'Why are we doing this?',
        answer:
            'This is a personal problem that we have faced ourselves, and we believe that there is a need for a solution that is both helpful and fair to women. Our goal is to create a platform that will provide women with the information and resources they need to take control of their health and well-being, and to empower them to live their best lives.'),
    RheaWebQuestion(
        question: 'Who is our app made for?',
        answer:
            'Unlike most fitness apps that cater to a general audience, Rhea.ai takes into account women\'s unique health problems, such as PCOS, and their workout preferences to provide a comprehensive fitness solution tailored to their individual requirements. We understand that women face many challenges when it comes to fitness, including the gender gap in workout applications, frustration when they can\'t keep up with their usual workout routine, and the impact of hormonal changes on their body.\n\nThat\'s why Rhea.ai was created to empower women by eliminating workout frustration and taking into account their unique needs. At Rhea.ai, we believe that every woman deserves to feel empowered and confident in her body.\n\nJoin us today and take the first step towards a healthier, happier you!'),
  ];
}
