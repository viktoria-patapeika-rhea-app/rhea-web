import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhea_ai_website/blocs/app_bar_bloc/footer_bloc.dart';
import 'package:rhea_ai_website/ui_component/view/pricing_page.dart';
import 'package:rhea_ai_website/ui_component/util/rhea_web_color.dart';
import 'package:rhea_ai_website/ui_component/util/rhea_web_routes.dart';
import 'package:rhea_ai_website/ui_component/view/faq_page.dart';
import 'package:rhea_ai_website/ui_component/view/landing_page.dart';
import 'package:rhea_ai_website/ui_component/view/privacy_policy_page.dart';
import 'package:rhea_ai_website/ui_component/view/team_page.dart';
import 'package:rhea_ai_website/ui_component/view/terms_page.dart';
import 'package:rhea_ai_website/ui_component/view/ui_elements/rhea_web_appbar.dart';
import 'package:rhea_ai_website/ui_component/view/ui_elements/rhea_web_footer.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _jumpKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final RheaWebFooterBloc appBarBloc = BlocProvider.of<RheaWebFooterBloc>(context);
    return Material(
      color: RheaWebColor.backgroundColor,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 76, horizontal: 44),
          child: Column(
            children: [
              RheaWebAppBar(
                key: _jumpKey,
                onGetInvolvedTap: () {
                   context.read<RheaWebFooterBloc>().add(const PageTapped(namedRoute: RheaWebRoutes.teamPageRoute));
                },
              ),
              BlocBuilder<RheaWebFooterBloc, RheaWebFooterState>(
                  bloc: appBarBloc,
                  builder: (context, state) {
                    if (state is PageLoading) {
                      return const Center(child: CircularProgressIndicator(color: RheaWebColor.semanticWhiteColor));
                    }
                    if (state is LandingPageLoaded) {
                      debugPrint('landing loaded');
                      return const LandingPage();
                    }
                    if (state is FeaturesPageLoaded) {
                      debugPrint('features loaded');
                      return const LandingPage();
                    }
                    if (state is FAQPageLoaded) {
                      debugPrint('faq loaded');
                      return const FAQPage();
                    }
                    if (state is PricingPageLoaded) {
                      debugPrint('pricing loaded');
                      return  PricingPage();
                    }
                    if (state is PrivacyPolicyPageLoaded) {
                      debugPrint('privacy policy loaded');
                      return const PrivacyPolicyPage();
                    }
                    if (state is TermsPageLoaded) {
                      debugPrint('terms of service loaded');
                      return const TermsPage();
                    }
                    if (state is TeamPageLoaded) {
                      debugPrint('team loaded');
                      return const TeamPage();
                    }

                    return Container();
                  }),
              const Divider(height: 3, color: RheaWebColor.cardBackgroundColor),
              RheaWebFooter(
                onEmailSubmit: () {
                 
                },
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
