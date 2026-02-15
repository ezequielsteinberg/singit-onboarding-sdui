import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/onboarding_provider.dart';
import '../../sdui/widgets/alchemist_sdui.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  @override
  void initState() {
    super.initState();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(onboardingProvider.notifier)
          .reducer(action: const OnboardingAction.loadFlow());
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _buildBody(state),
      ),
    );
  }

  Widget _buildBody(OnboardingState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return Center(child: Text('Error: ${state.error}'));
    }

    if (state.currentStep == null) {
      return const Center(child: Text('No step available'));
    }

    return AlchemistSDUI(
      step: state.currentStep!,
      onOptionSelected: (optionId) {
        ref.read(onboardingProvider.notifier).reducer(
            action:
                OnboardingAction.selectOption(state.currentStep!.id, optionId));
      },
      onContinue: () {
        ref
            .read(onboardingProvider.notifier)
            .reducer(action: const OnboardingAction.continueToNextStep());
      },
      onBack: () {
        if (state.history.isNotEmpty) {
          ref
              .read(onboardingProvider.notifier)
              .reducer(action: const OnboardingAction.goBack());
        } else {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        }
      },
    );
  }
}
