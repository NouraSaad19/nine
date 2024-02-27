class Validation {
  static const String validationUppercase = r'[A-Z]';

  static const String validationLowercase = r'[a-z]';

  static const String validationDigit = r'[0-9]';

  static bool isValidEmailExtension(String email) {
    List<String> parts = email.split('@');
    if (parts.length != 2) {
      return false;
    }
    String allowedDomains = 'thegarage.sa';
    String domain = parts[1].toLowerCase();
    return allowedDomains.contains(domain);
  }
}
