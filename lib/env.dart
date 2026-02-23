import 'dart:math';

enum AppMode { free, premium }

/// Cloudinary account configuration
class CloudinaryAccount {
  final String cloudName;
  final String uploadPreset;

  const CloudinaryAccount({
    required this.cloudName,
    required this.uploadPreset,
  });
}

/// List of available Cloudinary accounts for load balancing
class CloudinaryConfig {
  static const List<CloudinaryAccount> accounts = [
    CloudinaryAccount(cloudName: 'dc4u5bphe', uploadPreset: 'uploads'),
    CloudinaryAccount(cloudName: 'dxppejhwt', uploadPreset: 'uploads'),
    CloudinaryAccount(cloudName: 'drd9jj3az', uploadPreset: 'uploads'),
    CloudinaryAccount(cloudName: 'dtcx8wuem', uploadPreset: 'uploads'),
    CloudinaryAccount(cloudName: 'duam6fuwk', uploadPreset: 'uploads'),
    CloudinaryAccount(cloudName: 'dhudibfxv', uploadPreset: 'uploads'),
  ];

  static int _currentIndex = 0;
  static final _random = Random();

  /// Get a random Cloudinary account
  static CloudinaryAccount getRandomAccount() {
    return accounts[_random.nextInt(accounts.length)];
  }

  /// Get next account in round-robin fashion
  static CloudinaryAccount getNextAccount() {
    final account = accounts[_currentIndex];
    _currentIndex = (_currentIndex + 1) % accounts.length;
    return account;
  }

  /// Get default account (first in list)
  static CloudinaryAccount get defaultAccount => accounts.first;

  /// Get cloud name from random account
  static String get cloudName => getRandomAccount().cloudName;

  /// Get upload preset from random account
  static String get uploadPreset => getRandomAccount().uploadPreset;
}

/// Voucher code with discount percentage
class VoucherCode {

  final String? id;
  final String code;
  final int discountPercent;
  final DateTime expiredAt;
  final bool isActive;

  const VoucherCode({
    this.id,
    required this.code,
    required this.discountPercent,
    required this.expiredAt,
    this.isActive = true,
  });

  bool get isExpired => DateTime.now().isAfter(expiredAt);
  bool get isValid => isActive && !isExpired;
}

class Env {
  static AppMode appMode = AppMode.free;
  static String referral = "";
  static int durationInMonth = 0;
  static DateTime expiredAt = DateTime(2024, 12, 31);

  /// Loaded voucher codes from Firestore
  static List<VoucherCode> _loadedVouchers = [];

  /// Flag to indicate if vouchers are loaded from Firestore
  static bool _vouchersLoaded = false;

  /// Fallback voucher codes (used if Firestore fails)
  static final List<VoucherCode> _fallbackVoucherCodes = [
    VoucherCode(
      code: 'DISKON',
      discountPercent: 20,
      expiredAt: DateTime(2090, 8, 1),
    ),
    VoucherCode(
      code: 'HEMATIN',
      discountPercent: 20,
      expiredAt: DateTime(2090, 8, 1),
    ),
    VoucherCode(
      code: 'DAMANG',
      discountPercent: 20,
      expiredAt: DateTime(2090, 8, 1),
    ),
    VoucherCode(
      code: 'NUHUN',
      discountPercent: 20,
      expiredAt: DateTime(2090, 8, 1),
    ),
    VoucherCode(
      code: 'ALPHAS',
      discountPercent: 20,
      expiredAt: DateTime(2090, 8, 1),
    ),
  ];

  /// Get all available voucher codes
  static List<VoucherCode> get voucherCodes {
    if (_vouchersLoaded && _loadedVouchers.isNotEmpty) {
      return _loadedVouchers;
    }
    return _fallbackVoucherCodes;
  }

  /// Load vouchers from Firestore
  static void loadVouchersFromFirestore(List<Map<String, dynamic>> vouchers) {
    _loadedVouchers = vouchers.map((v) {
      final endDateStr = v['endDate'] as String?;
      final endDate = endDateStr != null
          ? DateTime.tryParse(endDateStr) ?? DateTime(2099, 12, 31)
          : DateTime(2099, 12, 31);

      // Get discount value - support both percent and nominal type
      final type = v['type'] as String? ?? 'percent';
      final value = (v['value'] ?? 0).toDouble();
      final discountPercent = type == 'percent' ? value.toInt() : 0;

      return VoucherCode(
        id: v['id'] as String?,
        code: (v['code'] as String? ?? '').toUpperCase(),
        discountPercent: discountPercent,
        expiredAt: endDate,
        isActive: v['isActive'] as bool? ?? true,
      );
    }).toList();

    _vouchersLoaded = true;
  }

  /// Check if vouchers have been loaded from Firestore
  static bool get isVouchersLoaded => _vouchersLoaded;

  /// Get voucher by code (case-insensitive)
  static VoucherCode? getVoucher(String code) {
    final upperCode = code.toUpperCase().trim();
    try {
      return voucherCodes.firstWhere((v) => v.code == upperCode);
    } catch (_) {
      return null;
    }
  }

  /// Check if voucher code is valid (exists, active, and not expired)
  static bool isValidVoucher(String code) {
    final voucher = getVoucher(code);
    return voucher != null && voucher.isValid;
  }

  /// Get discount percentage for voucher code (0 if invalid or expired)
  static int getVoucherDiscount(String code) {
    final voucher = getVoucher(code);
    if (voucher == null || !voucher.isValid) return 0;
    return voucher.discountPercent;
  }
}
