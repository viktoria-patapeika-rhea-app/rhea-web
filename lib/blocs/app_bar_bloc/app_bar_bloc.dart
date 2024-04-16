import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:rhea_ai_website/repository/about_us_page_repository.dart';
import 'package:rhea_ai_website/repository/landing_page_repository.dart';
import 'package:rhea_ai_website/ui_component/util/rhea_web_routes.dart';

// Bloc

class RheaWebAppBarBloc extends Bloc<RheaWebAppBarEvent, RheaWebAppBarState> {
  RheaWebAppBarBloc({required this.landingPageRepository, required this.aboutUsPageRepository}) : super(PageLoading()) {
    on<AppStarted>(_loadPages);
  }

  final LandingPageRepository landingPageRepository;
  final AboutUsPageRepository aboutUsPageRepository;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  RheaWebAppBarState get initialState => PageLoading();

  Future<void> _loadPages(RheaWebAppBarEvent event, Emitter<RheaWebAppBarState> emit) async {
    try {
      emit(PageLoading());

      String landingPageData = _getLandingPageData();
      emit(LandingPageLoaded(messageData: landingPageData));
      on<PageTapped>((event, emit) {
        emit(PageLoading());
        navigatorKey.currentState?.pushNamed(event.namedRoute);
        if (event.namedRoute == RheaWebRoutes.homePageRoute) {
          String landingPageData = _getLandingPageData();
          emit(LandingPageLoaded(messageData: landingPageData));
        }
        if (event.namedRoute == RheaWebRoutes.aboutPageRoute) {
          List<String> aboutUsPageData = _getAboutUsPageData();
          emit(AboutUsPageLoaded(messageData: aboutUsPageData));
        }
      });
    } catch (e) {
      emit(LoadError(error: 'Failed to fetch a page: $e'));
    }
  }

  String _getLandingPageData() {
    String messageData = 'Landing page message data';
    return messageData;
  }

  List<String> _getAboutUsPageData() {
    List<String> messageData = ['About Us page message data'];
    return messageData;
  }
}

// Events

abstract class RheaWebAppBarEvent extends Equatable {
  const RheaWebAppBarEvent();
  @override
  List<Object> get props => [];
}

class AppStarted extends RheaWebAppBarEvent {
  @override
  String toString() => 'AppStarted';
}

class PageTapped extends RheaWebAppBarEvent {
  final String namedRoute;
  const PageTapped({required this.namedRoute});

  @override
  String toString() => 'PageTapped: ${namedRoute.toString()}';
}

// States

abstract class RheaWebAppBarState extends Equatable {
  const RheaWebAppBarState();

  @override
  List<Object> get props => [];
}

class CurrentPageChanged extends RheaWebAppBarState {
  final GlobalKey<NavigatorState> navigatorKey;
  const CurrentPageChanged({required this.navigatorKey});

  @override
  String toString() => 'CurrentPageKeyChanged to ${navigatorKey.toString()}';
}

class PageLoading extends RheaWebAppBarState {
  @override
  String toString() => 'PageLoading';
}

class LoadError extends RheaWebAppBarState {
  final String error;
  const LoadError({required this.error});

  @override
  List<Object> get props => [];
}

class LandingPageLoaded extends RheaWebAppBarState {
  const LandingPageLoaded({required this.messageData});
  final String messageData;

  @override
  String toString() => 'Landing Page loaded';
}

class AboutUsPageLoaded extends RheaWebAppBarState {
  const AboutUsPageLoaded({required this.messageData});
  final List<String> messageData;

  @override
  String toString() => 'AboutUs Page loaded';
}
