import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:singit_onboarding_sdui/domain/sdui/entities/onboarding_entities.dart';
import 'package:singit_onboarding_sdui/config/theme/color_schema.dart';

class ListComponent extends StatelessWidget {
  final OnboardingStep step;
  final Function(String optionId)? onOptionSelected;

  const ListComponent({
    super.key,
    required this.step,
    this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Assuming 'en' locale for now, should come from context/provider
    const locale = 'en';
    final title = step.content[locale]?['text1'] ?? '';
    final imageUrl = step.assets?['image1']; // Character Image

    return Column(
      children: [
        // 1. Header with Back Arrow, Progress, Gift (Overlapping)
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
          child: Row(
            children: [
              InkWell(
                onTap: () => Navigator.of(context).canPop()
                    ? Navigator.of(context).pop()
                    : null,
                child: const Icon(Icons.arrow_back_ios,
                    size: 20, color: Colors.black),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 32, // Height enough for Gift overflows
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      // Track (Vertically centered)
                      Center(
                        child: Container(
                          height: 12,
                          decoration: BoxDecoration(
                            color: AppColors.brandBlueLight,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      // Progress Fill (Mocked as ~15%)
                      Center(
                        child: FractionallySizedBox(
                          widthFactor: 1.0,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: FractionallySizedBox(
                              widthFactor:
                                  0.15, // Matches the small blue segment in crop
                              child: Container(
                                height: 12,
                                decoration: BoxDecoration(
                                  color: AppColors.brandBlue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Gift Icon (Positioned on the track, slightly inset from right)
                      Positioned(
                        right: 32, // Gap to right edge
                        top: 0,
                        bottom: 0,
                        child: SvgPicture.asset(
                          'assets/images/Gift.svg',
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // 2. Character + Speech Bubble with Arrow
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Character
              if (imageUrl != null)
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0), // Align slightly down relative to bubble top?
                  child: SizedBox(
                    height: 120,
                    width: 100,
                    child: SvgPicture.network(imageUrl, fit: BoxFit.contain),
                  ),
                ),
              const SizedBox(width: 4),

              // Speech Bubble
              Expanded(
                child: CustomPaint(
                  painter: BubblePainter(
                    color: Colors.white,
                    borderColor: AppColors.brandBlueLight,
                    shadowColor: Colors.black.withOpacity(0.05),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 28.0,
                        right: 16.0,
                        top: 16.0,
                        bottom: 16.0), // Left 28 = 12 (Tail) + 16 (Padding)
                    child: Text(
                      title, // "What is your English level?"
                      style: GoogleFonts.nunito(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textTitle,
                        height: 1.3,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // 3. Options List
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: step.options?.length ?? 0,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final option = step.options![index];
              final optionText = option.translations[locale] ?? '';
              final optionIcon = option.imgUrl;

              // Mock selected state for visual fidelity (3rd option selected in mockup)
              final isSelected = index == 2;

              return InkWell(
                onTap: () => onOptionSelected?.call(option.id),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.brandBlueLight.withOpacity(0.5)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.brandBlue
                          : AppColors.cardBorder,
                      width: isSelected ? 2 : 1.25,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowColor
                            .withOpacity(isSelected ? 0.3 : 0.2),
                        blurRadius: 23,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      if (optionIcon != null) ...[
                        SvgPicture.network(
                          optionIcon,
                          width: 24,
                          height: 24,
                          // NO ColorFilter applied to preserve internal active/inactive bar states
                        ),
                        const SizedBox(width: 16),
                      ],
                      Expanded(
                        child: Text(
                          optionText,
                          style: GoogleFonts.nunito(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? AppColors.brandBlue
                                : AppColors.textMain, // Blue text when selected
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // 4. Continue Button
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                // In a real app, this would use the selected ID
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.brandBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: Text(
                'CONTINUE',
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BubblePainter extends CustomPainter {
  final Color color;
  final Color borderColor;
  final Color shadowColor;

  BubblePainter({
    required this.color,
    required this.borderColor,
    required this.shadowColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final shadowPaint = Paint()
      ..color = shadowColor
      ..maskFilter =
          const MaskFilter.blur(BlurStyle.normal, 8); // Softer shadow

    const tailWidth = 12.0;
    const tailHeight = 12.0; // Height of the triangle
    const radius = 16.0;

    final path = Path();

    // Check if height is enough for radius (it should be)
    final h = size.height;
    final w = size.width;

    // Top Left (after tail width)
    path.moveTo(tailWidth + radius, 0);
    // Top Edge
    path.lineTo(w - radius, 0);
    // Top Right
    path.quadraticBezierTo(w, 0, w, radius);
    // Right Edge
    path.lineTo(w, h - radius);
    // Bottom Right
    path.quadraticBezierTo(w, h, w - radius, h);
    // Bottom Edge
    path.lineTo(tailWidth + radius, h);
    // Bottom Left (box)
    path.quadraticBezierTo(tailWidth, h, tailWidth, h - radius);

    // Left Edge (Bottom part)
    final centerY = h / 2;
    path.lineTo(tailWidth, centerY + (tailHeight / 2));

    // Tail Tip
    path.lineTo(0, centerY);

    // Tail Top part
    path.lineTo(tailWidth, centerY - (tailHeight / 2));

    // Left Edge (Top part)
    path.lineTo(tailWidth, radius);
    // Top Left
    path.quadraticBezierTo(tailWidth, 0, tailWidth + radius, 0);

    path.close();

    // Draw Shadow
    canvas.drawPath(path, shadowPaint); // Simple shadow drawing

    // Draw Fill
    canvas.drawPath(path, paint);

    // Draw Border
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
