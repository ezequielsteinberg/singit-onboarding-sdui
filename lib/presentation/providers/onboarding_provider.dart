import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/sdui/entities/onboarding_entities.dart';
import '../../infrastructure/repositories/onboarding_repository.dart';
import 'base_state_notifier.dart';

part 'onboarding_provider.freezed.dart';

final onboardingProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingState>((ref) {
  final repository = ref.watch(onboardingRepositoryProvider);
  return OnboardingNotifier(repository, ref);
});

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(false) bool isLoading,
    OnboardingFlow? flow,
    OnboardingStep? currentStep,
    @Default({}) Map<String, String> answers,
    @Default([]) List<OnboardingStep> history,
    String? error,
  }) = _OnboardingState;
}

@freezed
class OnboardingAction with _$OnboardingAction {
  const factory OnboardingAction.loadFlow() = _LoadFlow;
  const factory OnboardingAction.selectOption(String stepId, String optionId) =
      _SelectOption;
  const factory OnboardingAction.continueToNextStep() = _ContinueToNextStep;
  const factory OnboardingAction.goBack() = _GoBack;
}

class OnboardingNotifier
    extends BaseStateNotifier<OnboardingState, OnboardingAction> {
  final OnboardingRepository _repository;

  OnboardingNotifier(this._repository, Ref ref)
      : super(state: const OnboardingState(), ref: ref);

  @override
  void reducer({required OnboardingAction action}) {
    action.when(
      loadFlow: _loadFlow,
      selectOption: _selectOption,
      continueToNextStep: _continueToNextStep,
      goBack: _goBack,
    );
  }

  Future<void> _loadFlow() async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await _repository.getOnboardingFlow();

      final firstStep =
          response.onboardingFlow.steps.firstWhere((s) => s.stepIndex == 7);

      state = state.copyWith(
        isLoading: false,
        flow: response.onboardingFlow,
        currentStep: firstStep,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void _selectOption(String stepId, String optionId) {
    final newAnswers = Map<String, String>.from(state.answers);
    newAnswers[stepId] = optionId;

    state = state.copyWith(answers: newAnswers);
  }

  void _continueToNextStep() {
    if (state.currentStep != null) {
      _goToNextStep(state.currentStep!);
    }
  }

  void _goBack() {
    if (state.history.isNotEmpty) {
      final previousStep = state.history.last;
      final newHistory = List<OnboardingStep>.from(state.history)..removeLast();
      state = state.copyWith(currentStep: previousStep, history: newHistory);
    }
  }

  void _goToNextStep(OnboardingStep currentStep) {
    if (currentStep.nextSteps == null || currentStep.nextSteps!.isEmpty) {
      return;
    }

    String? nextStepId;

    for (final rule in currentStep.nextSteps!) {
      if (rule.conditions.isEmpty) {
        nextStepId = rule.nextStepId;
        break;
      }

      bool allConditionsMet = true;
      for (final condition in rule.conditions) {
        final userAnswer = state.answers[condition.stepId];
        if (userAnswer != condition.optionId) {
          allConditionsMet = false;
          break;
        }
      }

      if (allConditionsMet) {
        nextStepId = rule.nextStepId;
        break;
      }
    }

    if (nextStepId != null) {
      final nextStep = state.flow?.steps.firstWhere(
        (s) => s.id == nextStepId,
        orElse: () => currentStep,
      );
      if (nextStep != null) {
        final newHistory = List<OnboardingStep>.from(state.history)
          ..add(currentStep);
        state = state.copyWith(currentStep: nextStep, history: newHistory);
      }
    }
  }
}
