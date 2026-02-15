import 'package:flutter/material.dart';
import '../../../../domain/sdui/entities/onboarding_entities.dart';
import 'components/list_component.dart';
import 'components/english_journey_component.dart';

class AlchemistSDUI extends StatelessWidget {
  final OnboardingStep step;
  final Function(String optionId)? onOptionSelected;
  final VoidCallback? onContinue;

  const AlchemistSDUI({
    super.key,
    required this.step,
    this.onOptionSelected,
    this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    switch (step.componentType) {
      case 'list':
        return ListComponent(
          step: step,
          onOptionSelected: onOptionSelected,
        );
      case 'englishJourney':
        return EnglishJourneyComponent(
          step: step,
          onContinue: onContinue,
        );
      default:
        return Center(
          child: Text('Unknown component type: ${step.componentType}'),
        );
    }
  }
}
