import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_entities.freezed.dart';

@freezed
class OnboardingResponse with _$OnboardingResponse {
  const factory OnboardingResponse({
    required String message,
    required String status,
    required OnboardingFlow onboardingFlow,
  }) = _OnboardingResponse;
}

@freezed
class OnboardingFlow with _$OnboardingFlow {
  const factory OnboardingFlow({
    required List<OnboardingStep> steps,
  }) = _OnboardingFlow;
}

@freezed
class OnboardingStep with _$OnboardingStep {
  const factory OnboardingStep({
    required String id,
    required int stepIndex,
    required String stepType,
    required String componentType,
    required Map<String, dynamic> content,
    Map<String, String>? assets,
    List<StepOption>? options,
    List<NextStepRule>? nextSteps,
  }) = _OnboardingStep;
}

@freezed
class StepOption with _$StepOption {
  const factory StepOption({
    required String id,
    required String value,
    String? imgUrl,
    required Map<String, dynamic> translations,
  }) = _StepOption;
}

@freezed
class NextStepRule with _$NextStepRule {
  const factory NextStepRule({
    required String nextStepId,
    required List<RuleCondition> conditions,
  }) = _NextStepRule;
}

@freezed
class RuleCondition with _$RuleCondition {
  const factory RuleCondition({
    required String stepId,
    required String optionId,
  }) = _RuleCondition;
}
