import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhea_ai_website/blocs/app_bar_bloc/footer_bloc.dart';
import 'package:rhea_ai_website/ui_component/util/rhea_web_color.dart';
import 'package:rhea_ai_website/ui_component/view/landing_page.dart';
import 'package:rhea_ai_website/ui_component/view/ui_elements/rhea_web_appbar.dart';
import 'package:rhea_ai_website/ui_component/view/ui_elements/rhea_web_footer.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
//  final ScrollController _scrollController = ScrollController();
  final GlobalKey _jumpKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double horizontalPadding = deviceSize.width > 720 ? 96 : 26;
    return Material(
      color: RheaWebColor.backgroundColor,
      child: SingleChildScrollView(
        //  controller: _scrollController,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 44, horizontal: horizontalPadding),
          child: Column(
            children: [
              RheaWebAppBar(
                onGetInvolvedTap: () {},
              ),
              LandingPage(),
              const Divider(height: 3, color: RheaWebColor.cardBackgroundColor),
              RheaWebFooter(
                onEmailSubmit: () {},
                onPageNavigation: (namedRoute) {
                  context.read<RheaWebFooterBloc>().add(PageTapped(namedRoute: namedRoute));
                  Scrollable.ensureVisible(_jumpKey.currentContext!, duration: const Duration(seconds: 1));
                  debugPrint('tapped ${namedRoute.toString()}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
