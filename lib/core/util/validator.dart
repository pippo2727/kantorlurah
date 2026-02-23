import 'package:kasir_baik/l10n/app_localizations.dart';

/// Centralized validator class for form validation
/// Usage: validator: Validator.required(context)
/// Usage: validator: Validator.combine([Validator.required(context), Validator.email(context)])
class Validator {
  /// Optional field - no validation, always returns null
  /// Use this for fields that don't require validation
  static String? Function(String?) optional() {
    return (value) => null;
  }

  /// Optional field for typed validators (dropdown, etc.)
  /// Use this for dropdown fields that don't require validation
  static String? Function(T?) optionalTyped<T>() {
    return (value) => null;
  }

  /// Required field validator
  static String? Function(String?) required(S s, {String? fieldName}) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return fieldName != null
            ? '$fieldName ${s.validator_required}'
            : s.validator_required;
      }
      return null;
    };
  }

  /// Email validator
  static String? Function(String?) email(S s) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(value)) {
        return s.validator_invalidEmail;
      }
      return null;
    };
  }

  /// Phone number validator (Indonesian format)
  static String? Function(String?) phone(S s) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;
      // Remove spaces, dashes, and plus sign for validation
      final cleaned = value.replaceAll(RegExp(r'[\s\-\+]'), '');
      if (!RegExp(r'^[0-9]{8,15}$').hasMatch(cleaned)) {
        return s.validator_invalidPhone;
      }
      return null;
    };
  }

  /// Minimum length validator
  static String? Function(String?) minLength(S s, int length) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;
      if (value.length < length) {
        return s.validator_minLength(length);
      }
      return null;
    };
  }

  /// Maximum length validator
  static String? Function(String?) maxLength(S s, int length) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;
      if (value.length > length) {
        return s.validator_maxLength(length);
      }
      return null;
    };
  }

  /// Numeric only validator
  static String? Function(String?) numeric(S s) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;
      // Remove thousand separators for validation
      final cleaned = value.replaceAll(',', '').replaceAll('.', '');
      if (!RegExp(r'^[0-9]+$').hasMatch(cleaned)) {
        return s.validator_numericOnly;
      }
      return null;
    };
  }

  /// Minimum value validator (for numeric fields)
  /// Parses value with thousand separators (commas)
  static String? Function(String?) minValue(S s, double minVal) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;
      // Remove thousand separators and parse
      final cleaned = value.replaceAll(',', '');
      final parsed = double.tryParse(cleaned);
      if (parsed == null) {
        return s.validator_numericOnly;
      }
      if (parsed < minVal) {
        return s.validator_minValue(minVal.toInt());
      }
      return null;
    };
  }

  /// Maximum value validator (for numeric fields)
  static String? Function(String?) maxValue(S s, double maxVal) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;
      final cleaned = value.replaceAll(',', '');
      final parsed = double.tryParse(cleaned);
      if (parsed == null) {
        return s.validator_numericOnly;
      }
      if (parsed > maxVal) {
        return s.validator_maxValue(maxVal.toInt());
      }
      return null;
    };
  }

  /// Password validator (min 6 chars)
  static String? Function(String?) password(S s, {int minLength = 6}) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;
      if (value.length < minLength) {
        return s.validator_passwordMinLength(minLength);
      }
      return null;
    };
  }

  /// Confirm password validator
  static String? Function(String?) confirmPassword(
    S s,
    String Function() getPassword,
  ) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;
      if (value != getPassword()) {
        return s.validator_passwordMismatch;
      }
      return null;
    };
  }

  /// URL validator
  static String? Function(String?) url(S s) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;
      final urlRegex = RegExp(
        r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$',
        caseSensitive: false,
      );
      if (!urlRegex.hasMatch(value)) {
        return s.validator_invalidUrl;
      }
      return null;
    };
  }

  /// Barcode validator (alphanumeric, 4-20 chars)
  static String? Function(String?) barcode(S s) {
    return (value) {
      if (value == null || value.trim().isEmpty) return null;
      if (!RegExp(r'^[A-Za-z0-9]{4,20}$').hasMatch(value)) {
        return s.validator_invalidBarcode;
      }
      return null;
    };
  }

  /// Combine multiple validators
  /// Usage: validator: Validator.combine([Validator.required(s), Validator.email(s)])
  static String? Function(String?) combine(
    List<String? Function(String?)> validators,
  ) {
    return (value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }

  /// Custom validator with custom message
  static String? Function(String?) custom(
    bool Function(String?) condition,
    String message,
  ) {
    return (value) {
      if (!condition(value)) {
        return message;
      }
      return null;
    };
  }
}
