import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:singit_onboarding_sdui/config/theme/color_schema.dart';
import 'package:singit_onboarding_sdui/domain/sdui/entities/onboarding_entities.dart';
import 'bubble_painter.dart';

class ListHeader extends StatelessWidget {
  const ListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).canPop()
                ? Navigator.of(context).pop()
                : null,
            child:
                const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 32,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Center(
                    child: Container(
                      height: 12,
                      decoration: BoxDecoration(
                        color: AppColors.brandBlueLight,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Center(
                    child: FractionallySizedBox(
                      widthFactor: 1.0,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: 0.15,
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
                  Positioned(
                    right: 32,
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
    );
  }
}

class ListTitleBubble extends StatelessWidget {
  final String title;
  final String? imageUrl;

  const ListTitleBubble({
    super.key,
    required this.title,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imageUrl != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: 120,
                width: 100,
                child: SvgPicture.network(imageUrl!, fit: BoxFit.contain),
              ),
            ),
          const SizedBox(width: 4),
          Expanded(
            child: CustomPaint(
              painter: BubblePainter(
                color: Colors.white,
                borderColor: AppColors.brandBlueLight,
                shadowColor: Colors.black.withOpacity(0.05),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 28.0, right: 16.0, top: 16.0, bottom: 16.0),
                child: Text(
                  title,
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
    );
  }
}

class ListOptionItem extends StatelessWidget {
  final StepOption option;
  final bool isSelected;
  final VoidCallback onTap;

  const ListOptionItem({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const locale = 'en';
    final optionText = option.translations[locale] ?? '';
    final optionIcon = option.imgUrl;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.brandBlueLight.withOpacity(0.5)
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.brandBlue : AppColors.cardBorder,
            width: isSelected ? 2 : 1.25,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withOpacity(isSelected ? 0.3 : 0.2),
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
              ),
              const SizedBox(width: 16),
            ],
            Expanded(
              child: Text(
                optionText,
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? AppColors.brandBlue : AppColors.textMain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListContinueButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback? onPressed;

  const ListContinueButton({
    super.key,
    required this.isEnabled,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: isEnabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.brandBlue,
            disabledBackgroundColor: AppColors.brandBlue.withOpacity(0.5),
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
    );
  }
}
