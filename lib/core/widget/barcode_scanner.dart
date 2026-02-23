import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kantor_lurah/core/theme/theme.dart';
import 'package:kantor_lurah/core/util/validator.dart';
import 'package:kantor_lurah/core/widget/textfield.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

/// Result from barcode scan
class BarcodeScanResult {
  final String code;
  final BarcodeFormat format;

  BarcodeScanResult({required this.code, required this.format});

  bool get isQR => format == BarcodeFormat.qrCode;
  bool get isBarcode => !isQR;
}

/// Reusable barcode scanner widget with two modes:
/// - Default (icon): renders as IconButton for AppBar actions
/// - Field mode (.field): renders as QTextField with scan button as suffix icon
class QBarcodeScanner extends StatefulWidget {
  /// Called when barcode is scanned successfully
  final void Function(BarcodeScanResult result)? onScanned;

  /// Called when text value changes (typing or scan). Field mode only.
  final void Function(String value)? onChanged;

  /// Barcode formats to detect
  final List<BarcodeFormat>? formats;

  /// Tooltip for scan button
  final String tooltip;

  /// Whether this is field mode
  final bool _isFieldMode;

  /// Icon to display on scan button
  final IconData icon;

  /// Icon color
  final Color? iconColor;

  /// Icon size
  final double iconSize;

  /// Text field label (field mode only)
  final String? label;

  /// Text field hint (field mode only)
  final String? hint;

  /// Initial value for text field (field mode only)
  final String? initialValue;

  /// Validator for text field (field mode only)
  final String? Function(String?)? validator;

  /// Prefix icon for text field (field mode only)
  final Icon? prefixIcon;

  /// Icon mode - renders as IconButton (for AppBar actions, etc.)
  const QBarcodeScanner({
    super.key,
    required this.onScanned,
    this.icon = Icons.qr_code_scanner,
    this.iconColor,
    this.iconSize = 24,
    this.tooltip = 'Scan Barcode/QR',
    this.formats,
  })  : _isFieldMode = false,
        onChanged = null,
        label = null,
        hint = null,
        initialValue = null,
        validator = null,
        prefixIcon = null;

  /// Field mode - renders as QTextField with scan button as suffix
  const QBarcodeScanner.field({
    super.key,
    required this.onChanged,
    this.onScanned,
    this.label,
    this.hint,
    this.initialValue,
    this.validator,
    this.prefixIcon,
    this.icon = Icons.qr_code_scanner,
    this.iconColor,
    this.iconSize = 24,
    this.tooltip = 'Scan Barcode/QR',
    this.formats,
  }) : _isFieldMode = true;

  @override
  State<QBarcodeScanner> createState() => _QBarcodeScannerState();
}

class _QBarcodeScannerState extends State<QBarcodeScanner> {
  Key _fieldKey = UniqueKey();
  String _currentValue = '';

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue ?? '';
  }

  @override
  void didUpdateWidget(QBarcodeScanner oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget._isFieldMode &&
        widget.initialValue != oldWidget.initialValue) {
      _currentValue = widget.initialValue ?? '';
      _fieldKey = UniqueKey();
    }
  }

  void _openScanner() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _BarcodeScannerView(
          onScanned: (result) {
            Navigator.of(context).pop();
            if (widget._isFieldMode) {
              setState(() {
                _currentValue = result.code;
                _fieldKey = UniqueKey();
              });
              widget.onChanged?.call(result.code);
            }
            widget.onScanned?.call(result);
          },
          formats: widget.formats,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!widget._isFieldMode) {
      return IconButton(
        icon: Icon(widget.icon, size: widget.iconSize),
        color: widget.iconColor,
        tooltip: widget.tooltip,
        onPressed: _openScanner,
      );
    }

    // Field mode
    return QTextField(
      key: _fieldKey,
      initialValue: _currentValue,
      label: widget.label ?? '',
      hint: widget.hint,
      prefixIcon: widget.prefixIcon ?? const Icon(Icons.qr_code),
      suffixIcon: Container(
        margin: const EdgeInsets.only(right: 4),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconButton(
          icon: Icon(widget.icon, color: Colors.white, size: 20),
          onPressed: _openScanner,
          tooltip: widget.tooltip,
          constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          padding: EdgeInsets.zero,
        ),
      ),
      onChanged: (v) {
        _currentValue = v;
        widget.onChanged?.call(v);
      },
      validator: widget.validator ?? Validator.optional(),
    );
  }
}

/// Full screen barcode scanner view
class _BarcodeScannerView extends StatefulWidget {
  final void Function(BarcodeScanResult result) onScanned;
  final List<BarcodeFormat>? formats;

  const _BarcodeScannerView({required this.onScanned, this.formats});

  @override
  State<_BarcodeScannerView> createState() => _BarcodeScannerViewState();
}

class _BarcodeScannerViewState extends State<_BarcodeScannerView> {
  late MobileScannerController _controller;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _hasScanned = false;
  bool _torchEnabled = false;

  @override
  void initState() {
    super.initState();
    _controller = MobileScannerController(
      formats: widget.formats ?? const [],
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
      torchEnabled: false,
    );
  }

  @override
  void dispose() {
    // Delay audio player disposal to allow beep to finish playing
    final player = _audioPlayer;
    Future.delayed(const Duration(seconds: 2), () => player.dispose());
    _controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_hasScanned) return;

    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isEmpty) return;

    final barcode = barcodes.first;
    if (barcode.rawValue == null) return;

    setState(() => _hasScanned = true);

    _audioPlayer.play(AssetSource('audio/barcode_beep.mp3'));

    widget.onScanned(
      BarcodeScanResult(code: barcode.rawValue!, format: barcode.format),
    );
  }

  void _toggleTorch() {
    _controller.toggleTorch();
    setState(() => _torchEnabled = !_torchEnabled);
  }

  void _switchCamera() {
    _controller.switchCamera();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scanAreaSize = screenWidth * 0.7;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Scan Barcode'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              _torchEnabled ? Icons.flash_on : Icons.flash_off,
              color: _torchEnabled ? Colors.yellow : Colors.white,
            ),
            onPressed: _toggleTorch,
            tooltip: 'Toggle Flash',
          ),
          IconButton(
            icon: const Icon(Icons.cameraswitch, color: Colors.white),
            onPressed: _switchCamera,
            tooltip: 'Switch Camera',
          ),
        ],
      ),
      body: Stack(
        children: [
          // Camera preview
          MobileScanner(controller: _controller, onDetect: _onDetect),

          // Scan overlay
          Container(
            decoration: ShapeDecoration(
              shape: _ScannerOverlayShape(
                borderColor: Colors.deepPurple,
                borderWidth: 3,
                overlayColor: Colors.black.withValues(alpha: 0.5),
                borderRadius: 16,
                borderLength: 40,
                cutOutSize: scanAreaSize,
              ),
            ),
          ),

          // Instructions
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Arahkan kamera ke barcode/QR code',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom shape for scanner overlay with cutout
class _ScannerOverlayShape extends ShapeBorder {
  final Color borderColor;
  final double borderWidth;
  final Color overlayColor;
  final double borderRadius;
  final double borderLength;
  final double cutOutSize;

  const _ScannerOverlayShape({
    this.borderColor = Colors.white,
    this.borderWidth = 3.0,
    this.overlayColor = const Color(0x88000000),
    this.borderRadius = 12,
    this.borderLength = 40,
    this.cutOutSize = 250,
  });

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: rect.center,
          width: cutOutSize,
          height: cutOutSize,
        ),
        Radius.circular(borderRadius),
      ),
    );
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRect(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final cutOutRect = Rect.fromCenter(
      center: rect.center,
      width: cutOutSize,
      height: cutOutSize,
    );

    // Draw overlay
    final overlayPath = Path()
      ..addRect(rect)
      ..addRRect(
        RRect.fromRectAndRadius(cutOutRect, Radius.circular(borderRadius)),
      );

    canvas.drawPath(
      overlayPath,
      Paint()
        ..color = overlayColor
        ..style = PaintingStyle.fill
        ..blendMode = BlendMode.srcOver,
    );

    // Draw corner borders
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..strokeCap = StrokeCap.round;

    // Top-left corner
    canvas.drawPath(
      Path()
        ..moveTo(cutOutRect.left, cutOutRect.top + borderRadius + borderLength)
        ..lineTo(cutOutRect.left, cutOutRect.top + borderRadius)
        ..arcToPoint(
          Offset(cutOutRect.left + borderRadius, cutOutRect.top),
          radius: Radius.circular(borderRadius),
        )
        ..lineTo(cutOutRect.left + borderRadius + borderLength, cutOutRect.top),
      borderPaint,
    );

    // Top-right corner
    canvas.drawPath(
      Path()
        ..moveTo(cutOutRect.right - borderRadius - borderLength, cutOutRect.top)
        ..lineTo(cutOutRect.right - borderRadius, cutOutRect.top)
        ..arcToPoint(
          Offset(cutOutRect.right, cutOutRect.top + borderRadius),
          radius: Radius.circular(borderRadius),
        )
        ..lineTo(
          cutOutRect.right,
          cutOutRect.top + borderRadius + borderLength,
        ),
      borderPaint,
    );

    // Bottom-right corner
    canvas.drawPath(
      Path()
        ..moveTo(
          cutOutRect.right,
          cutOutRect.bottom - borderRadius - borderLength,
        )
        ..lineTo(cutOutRect.right, cutOutRect.bottom - borderRadius)
        ..arcToPoint(
          Offset(cutOutRect.right - borderRadius, cutOutRect.bottom),
          radius: Radius.circular(borderRadius),
        )
        ..lineTo(
          cutOutRect.right - borderRadius - borderLength,
          cutOutRect.bottom,
        ),
      borderPaint,
    );

    // Bottom-left corner
    canvas.drawPath(
      Path()
        ..moveTo(
          cutOutRect.left + borderRadius + borderLength,
          cutOutRect.bottom,
        )
        ..lineTo(cutOutRect.left + borderRadius, cutOutRect.bottom)
        ..arcToPoint(
          Offset(cutOutRect.left, cutOutRect.bottom - borderRadius),
          radius: Radius.circular(borderRadius),
        )
        ..lineTo(
          cutOutRect.left,
          cutOutRect.bottom - borderRadius - borderLength,
        ),
      borderPaint,
    );
  }

  @override
  ShapeBorder scale(double t) {
    return _ScannerOverlayShape(
      borderColor: borderColor,
      borderWidth: borderWidth * t,
      overlayColor: overlayColor,
      borderRadius: borderRadius * t,
      borderLength: borderLength * t,
      cutOutSize: cutOutSize * t,
    );
  }
}

/// Helper function to show barcode scanner as dialog
Future<BarcodeScanResult?> showBarcodeScanner(
  BuildContext context, {
  List<BarcodeFormat>? formats,
}) async {
  return Navigator.of(context).push<BarcodeScanResult>(
    MaterialPageRoute(
      builder: (context) => _BarcodeScannerView(
        onScanned: (result) {
          Navigator.of(context).pop(result);
        },
        formats: formats,
      ),
    ),
  );
}
