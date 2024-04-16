import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhea_ai_website/blocs/app_bar_bloc/app_bar_bloc.dart';
import 'package:rhea_ai_website/repository/about_us_page_repository.dart';
import 'package:rhea_ai_website/repository/landing_page_repository.dart';
import 'package:rhea_ai_website/ui_component/view/app_page.dart';
import 'package:rhea_ai_website/ui_component/view/landing_page.dart';

class SimpleBlocObserver extends BlocObserver {
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }
}

void main() async {
  Bloc.observer = SimpleBlocObserver();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<RheaWebAppBarBloc>(
        create: (context) => RheaWebAppBarBloc(
          landingPageRepository: LandingPageRepository(),
          aboutUsPageRepository: AboutUsPageRepository(),
        )..add(AppStarted()),
        child: const AppPage(),
      ),
    );
  }
}
