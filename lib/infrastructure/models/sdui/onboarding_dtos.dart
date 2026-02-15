import '../../../domain/sdui/entities/onboarding_entities.dart';

class OnboardingResponseDto {
  final String message;
  final String status;
  final OnboardingFlowDto onboardingFlow;

  OnboardingResponseDto({
    required this.message,
    required this.status,
    required this.onboardingFlow,
  });

  factory OnboardingResponseDto.fromJson(Map<String, dynamic> json) {
    return OnboardingResponseDto(
      message: json['message'] as String,
      status: json['status'] as String,
      onboardingFlow: OnboardingFlowDto.fromJson(
          json['onboardingFlow'] as Map<String, dynamic>),
    );
  }

  OnboardingResponse toEntity() {
    return OnboardingResponse(
      message: message,
      status: status,
      onboardingFlow: onboardingFlow.toEntity(),
    );
  }
}

class OnboardingFlowDto {
  final List<OnboardingStepDto> steps;

  OnboardingFlowDto({required this.steps});

  factory OnboardingFlowDto.fromJson(Map<String, dynamic> json) {
    return OnboardingFlowDto(
      steps: (json['steps'] as List)
          .map((e) => OnboardingStepDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  OnboardingFlow toEntity() {
    return OnboardingFlow(
      steps: steps.map((e) => e.toEntity()).toList(),
    );
  }
}

class OnboardingStepDto {
  final String id;
  final int stepIndex;
  final String stepType;
  final String componentType;
  final Map<String, dynamic> content;
  final Map<String, String>? assets;
  final List<StepOptionDto>? options;
  final List<NextStepRuleDto>? nextSteps;

  OnboardingStepDto({
    required this.id,
    required this.stepIndex,
    required this.stepType,
    required this.componentType,
    required this.content,
    this.assets,
    this.options,
    this.nextSteps,
  });

  factory OnboardingStepDto.fromJson(Map<String, dynamic> json) {
    return OnboardingStepDto(
      id: json['_id'] as String, // Fix: Map _id to id
      stepIndex: json['stepIndex'] as int,
      stepType: json['stepType'] as String,
      componentType: json['componentType'] as String,
      content: json['content'] as Map<String, dynamic>,
      assets: (json['assets'] as Map<String, dynamic>?)?.map(
        (k, v) => MapEntry(k, v as String),
      ),
      options: (json['options'] as List?)
          ?.map((e) => StepOptionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextSteps: (json['nextSteps'] as List?)
          ?.map((e) => NextStepRuleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  OnboardingStep toEntity() {
    return OnboardingStep(
      id: id,
      stepIndex: stepIndex,
      stepType: stepType,
      componentType: componentType,
      content: content,
      assets: assets,
      options: options?.map((e) => e.toEntity()).toList(),
      nextSteps: nextSteps?.map((e) => e.toEntity()).toList(),
    );
  }
}

class StepOptionDto {
  final String id;
  final String value;
  final String? imgUrl;
  final Map<String, dynamic> translations;

  StepOptionDto({
    required this.id,
    required this.value,
    this.imgUrl,
    required this.translations,
  });

  factory StepOptionDto.fromJson(Map<String, dynamic> json) {
    return StepOptionDto(
      id: json['_id'] as String, // Fix: Map _id to id
      value: json['value'] as String,
      imgUrl: json['imgUrl'] as String?,
      translations: json['translations'] as Map<String, dynamic>,
    );
  }

  StepOption toEntity() {
    return StepOption(
      id: id,
      value: value,
      imgUrl: imgUrl,
      translations: translations,
    );
  }
}

class NextStepRuleDto {
  final String nextStepId;
  final List<RuleConditionDto> conditions;

  NextStepRuleDto({
    required this.nextStepId,
    required this.conditions,
  });

  factory NextStepRuleDto.fromJson(Map<String, dynamic> json) {
    return NextStepRuleDto(
      nextStepId: json['nextStepId'] as String,
      conditions: (json['conditions'] as List)
          .map((e) => RuleConditionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  NextStepRule toEntity() {
    return NextStepRule(
      nextStepId: nextStepId,
      conditions: conditions.map((e) => e.toEntity()).toList(),
    );
  }
}

class RuleConditionDto {
  final String stepId;
  final String optionId;

  RuleConditionDto({
    required this.stepId,
    required this.optionId,
  });

  factory RuleConditionDto.fromJson(Map<String, dynamic> json) {
    return RuleConditionDto(
      stepId: json['stepId'] as String,
      optionId: json['optionId'] as String,
    );
  }

  RuleCondition toEntity() {
    return RuleCondition(
      stepId: stepId,
      optionId: optionId,
    );
  }
}
