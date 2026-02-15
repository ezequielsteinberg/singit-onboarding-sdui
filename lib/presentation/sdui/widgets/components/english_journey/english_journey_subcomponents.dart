import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'english_journey_model.dart';
import 'english_journey_graph_painters.dart';

class JourneyHeader extends StatelessWidget {
  final VoidCallback? onBack;

  const JourneyHeader({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        children: [
          InkWell(
            onTap: onBack,
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
                        color: Colors.white.withOpacity(0.5),
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
                              color: const Color(0xFF6C63FF),
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

class JourneyGraphCard extends StatelessWidget {
  final EnglishJourneyModel model;
  final Animation<double> animation;
  final Color primaryColor;

  const JourneyGraphCard({
    super.key,
    required this.model,
    required this.animation,
    this.primaryColor = const Color(0xFF4AC3E0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.graphTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF133F58),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                child: Text(
                  model.label3,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    CustomPaint(
                      size: Size(constraints.maxWidth, constraints.maxHeight),
                      painter: GridPainter(),
                    ),
                    AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        return CustomPaint(
                          size:
                              Size(constraints.maxWidth, constraints.maxHeight),
                          painter: GraphPainter(
                            progress: animation.value,
                            color: primaryColor,
                          ),
                        );
                      },
                    ),
                    Positioned(
                      left: constraints.maxWidth * 0.1,
                      top: constraints.maxHeight * 0.55,
                      child: GraphTooltip(text: model.label1),
                    ),
                    Positioned(
                      left: constraints.maxWidth * 0.45,
                      top: constraints.maxHeight * 0.20,
                      child: GraphTooltip(text: model.label2),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.xAxisStart,
                style: TextStyle(color: Colors.grey.shade400),
              ),
              Text(
                model.xAxisEnd,
                style: TextStyle(color: Colors.grey.shade400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GraphTooltip extends StatelessWidget {
  final String text;
  const GraphTooltip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TooltipPainter(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        constraints: const BoxConstraints(maxWidth: 120),
        child: Text(
          text,
          style: GoogleFonts.nunito(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF999999),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class TooltipPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.08)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

    final path = Path();

    const radius = 4.0;
    const tailWidth = 6.0;
    const tailHeight = 4.0;

    // Start from top-left, going clockwise
    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.arcToPoint(
      Offset(size.width, radius),
      radius: const Radius.circular(radius),
    );
    path.lineTo(size.width, size.height - radius);
    path.arcToPoint(
      Offset(size.width - radius, size.height),
      radius: const Radius.circular(radius),
    );

    // Tail on bottom (pointing down)
    final tailCenter = size.width / 2;
    path.lineTo(tailCenter + tailWidth / 2, size.height);
    path.lineTo(tailCenter, size.height + tailHeight);
    path.lineTo(tailCenter - tailWidth / 2, size.height);

    path.lineTo(radius, size.height);
    path.arcToPoint(
      Offset(0, size.height - radius),
      radius: const Radius.circular(radius),
    );
    path.lineTo(0, radius);
    path.arcToPoint(
      const Offset(radius, 0),
      radius: const Radius.circular(radius),
    );
    path.close();

    // Draw shadow
    canvas.drawPath(path, shadowPaint);

    // Draw tooltip
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class JourneyContent extends StatelessWidget {
  final String title;
  final String description;
  final Color highlightColor;

  const JourneyContent({
    super.key,
    required this.title,
    required this.description,
    this.highlightColor = const Color(0xFF4AC3E0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF133F58),
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16),
          RichText(
            textAlign: TextAlign.left,
            text: _parseMarkdown(description),
          ),
        ],
      ),
    );
  }

  TextSpan _parseMarkdown(String text) {
    final List<TextSpan> spans = [];
    final RegExp exp = RegExp(r'\*(.*?)\*');
    int lastIndex = 0;

    for (final match in exp.allMatches(text)) {
      if (match.start > lastIndex) {
        spans.add(TextSpan(text: text.substring(lastIndex, match.start)));
      }
      spans.add(TextSpan(
        text: match.group(1),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: highlightColor,
        ),
      ));
      lastIndex = match.end;
    }

    if (lastIndex < text.length) {
      spans.add(TextSpan(text: text.substring(lastIndex)));
    }

    return TextSpan(
      style: const TextStyle(
        fontSize: 16,
        height: 1.5,
        color: Color(0xFF4A4A4A),
      ),
      children: spans,
    );
  }
}

class JourneyFooter extends StatelessWidget {
  final VoidCallback? onContinue;

  const JourneyFooter({super.key, this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ElevatedButton(
        onPressed: onContinue,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6C63FF),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: const Text(
          "CONTINUE",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}
