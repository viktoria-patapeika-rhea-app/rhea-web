import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhea_ai_website/blocs/app_bar_bloc/app_bar_bloc.dart';
import 'package:rhea_ai_website/ui_component/util/rhea_web_color.dart';
import 'package:rhea_ai_website/ui_component/view/landing_page.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    final RheaWebAppBarBloc appBarBloc = BlocProvider.of<RheaWebAppBarBloc>(context);
    return Material(
      color: RheaWebColor.backgroundColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 44),
          child: Column(
            children: [
              // RheaWebAppBar(
              //   onTap: (namedRoute) {
              //     context.read<RheaWebAppBarBloc>().add(PageTapped(namedRoute: namedRoute));
              //     debugPrint('tapped ${namedRoute.toString()}');
              //   },
              //   onButtonTap: () {
              //     debugPrint('button tap tap');
              //   },
              // ),
              BlocBuilder<RheaWebAppBarBloc, RheaWebAppBarState>(
                  bloc: appBarBloc,
                  builder: (context, state) {
                    if (state is PageLoading) {
                      return const Center(child: CircularProgressIndicator(color: RheaWebColor.semanticWhiteColor));
                    }
                    if (state is LandingPageLoaded) {
                      debugPrint('landing loaded');
                      return const LandingPage();
                    }
                    
                    return Container();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
