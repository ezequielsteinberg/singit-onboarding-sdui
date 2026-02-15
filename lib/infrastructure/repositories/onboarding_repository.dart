import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/sdui/entities/onboarding_entities.dart';
import '../models/sdui/onboarding_dtos.dart';

final onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  return OnboardingRepositoryImpl();
});

abstract class OnboardingRepository {
  Future<OnboardingResponse> getOnboardingFlow();
}

class OnboardingRepositoryImpl implements OnboardingRepository {
  @override
  Future<OnboardingResponse> getOnboardingFlow() async {
    final String response =
        await rootBundle.loadString('assets/json/onboarding_response.json');
    final data = json.decode(response);
    return OnboardingResponseDto.fromJson(data).toEntity();
  }
}
