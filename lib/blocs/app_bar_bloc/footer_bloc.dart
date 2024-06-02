import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rhea_ai_website/repository/faq_page_repository.dart';
import 'package:rhea_ai_website/repository/features_page_repository.dart';

import 'package:rhea_ai_website/repository/landing_page_repository.dart';
import 'package:rhea_ai_website/repository/pricing_page_repository.dart';
import 'package:rhea_ai_website/repository/privacy_policy_page_repository.dart';
import 'package:rhea_ai_website/repository/team_page_repository.dart';
import 'package:rhea_ai_website/repository/terms_page_repository.dart';
import 'package:rhea_ai_website/ui_component/util/rhea_web_routes.dart';

// Bloc

class RheaWebFooterBloc extends Bloc<RheaWebFooterEvent, RheaWebFooterState> {
  RheaWebFooterBloc(
      {required this.landingPageRepository,
      required this.featuresPageRepository,
      required this.faqPageRepository,
      required this.pricingPageRepository,
      required this.privacyPolicyPageRepository,
      required this.termsPageRepository,
      required this.teamPageRepository})
      : super(PageLoading()) {
    on<AppStarted>(_loadPages);
  }

  final LandingPageRepository landingPageRepository;
  final FeaturesPageRepository featuresPageRepository;
  final FAQPageRepository faqPageRepository;
  final PricingPageRepository pricingPageRepository;
  final PrivacyPagePageRepository privacyPolicyPageRepository;
  final TermsPageRepository termsPageRepository;
  final TeamPageRepository teamPageRepository;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  RheaWebFooterState get initialState => PageLoading();

  Future<void> _loadPages(RheaWebFooterEvent event, Emitter<RheaWebFooterState> emit) async {
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
        if (event.namedRoute == RheaWebRoutes.featuresPageRoute) {
          List<String> featuresPageData = _getFeaturesPageData();
          emit(FeaturesPageLoaded(messageData: featuresPageData));
        }
        if (event.namedRoute == RheaWebRoutes.faqPageRoute) {
          List<String> faqPageData = _getFAQPageData();
          emit(FAQPageLoaded(messageData: faqPageData));
        }
        if (event.namedRoute == RheaWebRoutes.pricingPageRoute) {
          List<String> pricingPageData = _getPricingPageData();
          emit(PricingPageLoaded(messageData: pricingPageData));
        }
        if (event.namedRoute == RheaWebRoutes.privacyPolicyPageRoute) {
          List<String> privacyPolicyPageData = _getPrivacyPolicyPageData();
          emit(PrivacyPolicyPageLoaded(messageData: privacyPolicyPageData));
        }
        if (event.namedRoute == RheaWebRoutes.termsPageRoute) {
          List<String> termsPageData = _getTermsPageData();
          emit(TermsPageLoaded(messageData: termsPageData));
        }
        if (event.namedRoute == RheaWebRoutes.teamPageRoute) {
          List<String> teamPageData = _getTeamPageData();
          emit(TeamPageLoaded(messageData: teamPageData));
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

  List<String> _getFeaturesPageData() {
    List<String> messageData = ['Features page message data'];
    return messageData;
  }

  List<String> _getFAQPageData() {
    List<String> messageData = ['FAQ page message data'];
    return messageData;
  }

  List<String> _getPricingPageData() {
    List<String> messageData = ['Pricing page message data'];
    return messageData;
  }

  List<String> _getPrivacyPolicyPageData() {
    List<String> messageData = ['Privacy Policy page message data'];
    return messageData;
  }

  List<String> _getTermsPageData() {
    List<String> messageData = ['Terms of Service page message data'];
    return messageData;
  }

  List<String> _getTeamPageData() {
    List<String> messageData = ['Team page message data'];
    return messageData;
  }
}

// Events

abstract class RheaWebFooterEvent extends Equatable {
  const RheaWebFooterEvent();
  @override
  List<Object> get props => [];
}

class AppStarted extends RheaWebFooterEvent {
  @override
  String toString() => 'AppStarted';
}

class PageTapped extends RheaWebFooterEvent {
  final String namedRoute;
  const PageTapped({required this.namedRoute});

  @override
  String toString() => 'PageTapped: ${namedRoute.toString()}';
}

// States

abstract class RheaWebFooterState extends Equatable {
  const RheaWebFooterState();

  @override
  List<Object> get props => [];
}

class CurrentPageChanged extends RheaWebFooterState {
  final GlobalKey<NavigatorState> navigatorKey;
  const CurrentPageChanged({required this.navigatorKey});

  @override
  String toString() => 'CurrentPageKeyChanged to ${navigatorKey.toString()}';
}

class PageLoading extends RheaWebFooterState {
  @override
  String toString() => 'PageLoading';
}

class LoadError extends RheaWebFooterState {
  final String error;
  const LoadError({required this.error});

  @override
  List<Object> get props => [];
}

class LandingPageLoaded extends RheaWebFooterState {
  const LandingPageLoaded({required this.messageData});
  final String messageData;

  @override
  String toString() => 'Landing Page loaded';
}

class FeaturesPageLoaded extends RheaWebFooterState {
  const FeaturesPageLoaded({required this.messageData});
  final List<String> messageData;

  @override
  String toString() => 'Features Page loaded';
}

class FAQPageLoaded extends RheaWebFooterState {
  const FAQPageLoaded({required this.messageData});
  final List<String> messageData;

  @override
  String toString() => 'FAQ Page loaded';
}

class PricingPageLoaded extends RheaWebFooterState {
  const PricingPageLoaded({required this.messageData});
  final List<String> messageData;

  @override
  String toString() => 'Pricing Page loaded';
}

class PrivacyPolicyPageLoaded extends RheaWebFooterState {
  const PrivacyPolicyPageLoaded({required this.messageData});
  final List<String> messageData;

  @override
  String toString() => 'Privacy Policy Page loaded';
}

class TermsPageLoaded extends RheaWebFooterState {
  const TermsPageLoaded({required this.messageData});
  final List<String> messageData;

  @override
  String toString() => 'Terms of Service Page loaded';
}

class TeamPageLoaded extends RheaWebFooterState {
  const TeamPageLoaded({required this.messageData});
  final List<String> messageData;

  @override
  String toString() => 'Team Page loaded';
}
