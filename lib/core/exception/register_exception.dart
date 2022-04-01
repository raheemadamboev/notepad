class RegisterException implements Exception {
  const RegisterException([
    this.message = "An unknown exception occurred.",
  ]);

  factory RegisterException.fromCode(String code) {
    switch (code) {
      case "invalid-email":
        return const RegisterException(
          "Email is not valid or badly formatted.",
        );
      case "user-disabled":
        return const RegisterException(
          "This user has been disabled. Please contact support for help.",
        );
      case "email-already-in-use":
        return const RegisterException(
          "An account already exists for that email.",
        );
      case "operation-not-allowed":
        return const RegisterException(
          "Operation is not allowed.  Please contact support.",
        );
      case "weak-password":
        return const RegisterException(
          "Please enter a stronger password.",
        );
      default:
        return const RegisterException();
    }
  }

  final String message;
}
