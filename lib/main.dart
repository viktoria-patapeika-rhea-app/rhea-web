import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rhea_ai_website/ui_component/view/app_page.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }
}

void main() async {
  // usePathUrlStrategy();
  Bloc.observer = SimpleBlocObserver();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rhea',
      debugShowCheckedModeBanner: false,
      home: AppPage(),
    );
  }
}
