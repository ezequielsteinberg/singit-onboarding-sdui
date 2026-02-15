import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../domain/sdui/entities/onboarding_entities.dart';
import 'english_journey_model.dart';
import 'english_journey_subcomponents.dart';

class EnglishJourneyComponent extends StatefulWidget {
  final OnboardingStep step;
  final VoidCallback? onContinue;
  final VoidCallback? onBack;

  const EnglishJourneyComponent({
    super.key,
    required this.step,
    this.onContinue,
    this.onBack,
  });

  @override
  State<EnglishJourneyComponent> createState() =>
      _EnglishJourneyComponentState();
}

class _EnglishJourneyComponentState extends State<EnglishJourneyComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late EnglishJourneyModel _model;

  @override
  void initState() {
    super.initState();
    _model = EnglishJourneyModel.fromMap(widget.step.content['en'] ?? {});
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF4AC3E0),
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFF4AC3E0),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF4AC3E0),
                    Colors.white,
                  ],
                  stops: [0.0, 0.5],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                JourneyHeader(onBack: widget.onBack),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    height: 234,
                    child: JourneyGraphCard(
                      model: _model,
                      animation: _animation,
                    ),
                  ),
                ),
                const SizedBox(height: 104),
                JourneyContent(
                  title: _model.title,
                  description: _model.description,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 48),
                  child: JourneyFooter(onContinue: widget.onContinue),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
