class SignUpException implements Exception {
  const SignUpException([
    this.message = "An unknown exception occurred.",
  ]);

  factory SignUpException.fromCode(String code) {
    switch (code) {
      case "invalid-email":
        return const SignUpException(
          "Email is not valid or badly formatted.",
        );
      case "user-disabled":
        return const SignUpException(
          "This user has been disabled. Please contact support for help.",
        );
      case "email-already-in-use":
        return const SignUpException(
          "An account already exists for that email.",
        );
      case "operation-not-allowed":
        return const SignUpException(
          "Operation is not allowed.  Please contact support.",
        );
      case "weak-password":
        return const SignUpException(
          "Please enter a stronger password.",
        );
      default:
        return const SignUpException();
    }
  }

  final String message;
}
