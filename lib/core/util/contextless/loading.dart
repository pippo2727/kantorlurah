import 'package:kasir_baik/core/util/contextless/navigation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AppLoading {
  static OverlayEntry? _overlayEntry;
  static bool _isShowing = false;

  /// Show a loading overlay
  static void show({String? message}) {
    if (_isShowing) return;

    final overlay = Nav.navigatorKey.currentState?.overlay;
    if (overlay == null) return;

    _isShowing = true;
    _overlayEntry = OverlayEntry(
      builder: (context) => _LoadingOverlay(message: message),
    );

    overlay.insert(_overlayEntry!);
  }

  /// Hide the loading overlay
  static void hide() {
    if (!_isShowing) return;

    _overlayEntry?.remove();
    _overlayEntry = null;
    _isShowing = false;
  }

  /// Check if loading is currently showing
  static bool get isShowing => _isShowing;

  /// Execute an async function with loading indicator
  static Future<T> wrap<T>(
    Future<T> Function() asyncFunction, {
    String? message,
  }) async {
    try {
      show(message: message);
      return await asyncFunction();
    } finally {
      hide();
    }
  }
}

class _LoadingOverlay extends StatefulWidget {
  final String? message;

  const _LoadingOverlay({this.message});

  @override
  State<_LoadingOverlay> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<_LoadingOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Material(
        color: Colors.black.withValues(alpha: 0.4),
        child: GestureDetector(
          onTap: () {}, // Block taps from propagating
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withValues(alpha: 0.15),
                    blurRadius: 30,
                    offset: const Offset(0, 15),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Animated Loading Spinner
                  SizedBox(
                    width: 64,
                    height: 64,
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return CustomPaint(
                          painter: _LoadingPainter(progress: _controller.value),
                        );
                      },
                    ),
                  ),
                  if (widget.message != null) ...[
                    const SizedBox(height: 20),
                    Text(
                      widget.message!,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadingPainter extends CustomPainter {
  final double progress;

  _LoadingPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;

    // Background circle
    final bgPaint = Paint()
      ..color = Colors.deepPurple.shade50
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, bgPaint);

    // Animated arc with gradient effect
    final gradient = SweepGradient(
      startAngle: 0,
      endAngle: math.pi * 2,
      colors: [
        Colors.deepPurple.shade200,
        Colors.deepPurple.shade400,
        Colors.purple.shade500,
        Colors.deepPurple.shade600,
      ],
      transform: GradientRotation(progress * math.pi * 2),
    );

    final arcPaint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(center: center, radius: radius),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    final startAngle = -math.pi / 2 + (progress * math.pi * 2);
    const sweepAngle = math.pi * 1.2;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      arcPaint,
    );

    // Animated dots
    for (int i = 0; i < 3; i++) {
      final dotAngle = startAngle + sweepAngle - (i * 0.3);
      final dotRadius = 4.0 - (i * 0.8);
      final dotCenter = Offset(
        center.dx + radius * math.cos(dotAngle),
        center.dy + radius * math.sin(dotAngle),
      );

      final dotPaint = Paint()
        ..color = Colors.deepPurple.shade600.withValues(alpha: 1.0 - (i * 0.25))
        ..style = PaintingStyle.fill;

      canvas.drawCircle(dotCenter, dotRadius, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _LoadingPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

// Global functions for convenience
void showLoading({String? message}) => AppLoading.show(message: message);
void hideLoading() => AppLoading.hide();
