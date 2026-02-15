import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../domain/sdui/entities/onboarding_entities.dart';

class EnglishJourneyComponent extends StatelessWidget {
  final OnboardingStep step;
  final VoidCallback? onContinue;

  const EnglishJourneyComponent({
    super.key,
    required this.step,
    this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    const locale = 'en';
    final content = step.content[locale] ?? {};
    final title = content['text1'] ?? '';
    final description = content['text2'] ?? ''; // Contains markdown like *bold*
    final journeyTitle = content['text3'] ?? '';
    final imageUrl = step.assets?['image1']; // The graph

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          // Simple rich text parser for *bold*
          RichText(
            textAlign: TextAlign.center,
            text: _parseMarkdown(description, context),
          ),
          const SizedBox(height: 32),
          Text(
            journeyTitle.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          if (imageUrl != null)
            Expanded(
              child: SvgPicture.network(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: onContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Theme.of(context).colorScheme.primary, // Accent color
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
            ),
            child: Text(
              "Continue", // Should ideally come from 'defaults.ctaText' in JSON
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  TextSpan _parseMarkdown(String text, BuildContext context) {
    final List<TextSpan> spans = [];
    final RegExp exp = RegExp(r'\*(.*?)\*');
    int lastIndex = 0;

    // Base body style
    final bodyStyle = Theme.of(context).textTheme.bodyLarge;
    final boldStyle = bodyStyle?.copyWith(fontWeight: FontWeight.bold);

    for (final match in exp.allMatches(text)) {
      if (match.start > lastIndex) {
        spans.add(TextSpan(text: text.substring(lastIndex, match.start)));
      }
      spans.add(TextSpan(
        text: match.group(1),
        style: boldStyle,
      ));
      lastIndex = match.end;
    }

    if (lastIndex < text.length) {
      spans.add(TextSpan(text: text.substring(lastIndex)));
    }

    return TextSpan(
      style: bodyStyle,
      children: spans,
    );
  }
}
