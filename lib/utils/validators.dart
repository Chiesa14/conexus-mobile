class Validators {
  /// Validates email format
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email can't be empty";
    }
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!emailRegex.hasMatch(email)) {
      return "Enter a valid email address";
    }
    return null; // Valid email
  }

  /// Validates password strength
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password can't be empty";
    }
    if (password.length < 6) {
      return "Password must be at least 6 characters long";
    }
    final hasUppercase = RegExp(r'[A-Z]');
    final hasLowercase = RegExp(r'[a-z]');
    final hasDigit = RegExp(r'\d');

    if (!hasUppercase.hasMatch(password)) {
      return "No uppercase letter";
    }
    if (!hasLowercase.hasMatch(password)) {
      return "No lowercase letter";
    }
    if (!hasDigit.hasMatch(password)) {
      return "No number";
    }

    return null; // Valid password
  }

  static String? validateNames(String? name) {
    if (name == null || name.isEmpty) {
      return "Name can't be empty";
    }
    final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegex.hasMatch(name)) {
      return "Name should only contain letters";
    }
    return null;
  }

  static String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "Phone number can't be empty";
    }
    final phoneRegex = RegExp(r'^[0-9]{10}$');
    if (!phoneRegex.hasMatch(phone)) {
      return "Enter a valid 10-digit phone number";
    }
    return null;
  }
}
