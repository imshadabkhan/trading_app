import 'package:flutter/material.dart';

class InnerShadowPainter extends CustomPainter {
  final Color shadowColor;
  final double shadowBlurRadius;
  final Offset shadowOffset;

  InnerShadowPainter({
    this.shadowColor = Colors.orange,
    this.shadowBlurRadius = 8.0,
    this.shadowOffset = const Offset(0, 0),
  });

  @override
  void paint(Canvas canvas, Size size) {
    // We need to create a "hole" in the shadow
    // 1. Paint the entire container with the shadow color
    // 2. Erase the center part, leaving only the edges as shadow

    final rect = Offset.zero & size;
    final paint = Paint()
      ..color = shadowColor
      ..maskFilter = MaskFilter.blur(BlurStyle.outer, shadowBlurRadius);

    // Draw a larger rectangle with the blur, then erase the inner part
    // This creates the "inner" effect

    // Path for the outer shadow shape
    final Path outerPath = Path()..addRect(rect);

    // Path for the inner "hole"
    final Path innerPath = Path()
      ..addRect(
          rect.deflate(shadowBlurRadius)); // Deflate to create a frame effect

    canvas.saveLayer(rect, Paint()); // Use saveLayer to blend correctly

    // Draw the full shadow
    canvas.drawPath(outerPath, paint);

    // Use BlendMode.clear to cut a hole in the shadow
    // This effectively creates the inner shadow effect on the edges
    canvas.drawPath(innerPath, Paint()..blendMode = BlendMode.clear);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant InnerShadowPainter oldDelegate) {
    return oldDelegate.shadowColor != shadowColor ||
        oldDelegate.shadowBlurRadius != shadowBlurRadius ||
        oldDelegate.shadowOffset != shadowOffset;
  }
}

class InnerShadowContainer extends StatelessWidget {
  final Widget? child;
  final Color backgroundColor;
  final Color shadowColor;
  final double shadowBlurRadius;
  final Offset shadowOffset;
  final BorderRadius borderRadius;
  final double borderWidth; // Added for the border effect
  final Color borderColor; // Added for the border effect

  const InnerShadowContainer({
    super.key,
    this.child,
    this.backgroundColor = const Color(0xFF4A148C), // Default purple
    this.shadowColor = Colors.orange,
    this.shadowBlurRadius = 8.0,
    this.shadowOffset = const Offset(0, 0),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.borderWidth = 2.0, // Default border width
    this.borderColor = Colors.orange, // Default border color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border:
            Border.all(color: borderColor, width: borderWidth), // Outer border
      ),
      child: CustomPaint(
        painter: InnerShadowPainter(
          shadowColor: shadowColor,
          shadowBlurRadius: shadowBlurRadius,
          shadowOffset: shadowOffset,
        ),
        child: child,
      ),
    );
  }
}
