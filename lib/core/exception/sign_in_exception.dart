class SignInException implements Exception {
  const SignInException([
    this.message = "An unknown exception occurred.",
  ]);

  factory SignInException.fromCode(String code) {
    switch (code) {
      case "invalid-email":
        return const SignInException(
          "Email is not valid or badly formatted.",
        );
      case "user-disabled":
        return const SignInException(
          "This user has been disabled. Please contact support for help.",
        );
      case "user-not-found":
        return const SignInException(
          "Email is not found, please create an account.",
        );
      case "wrong-password":
        return const SignInException(
          "Incorrect password, please try again.",
        );
      default:
        return const SignInException();
    }
  }

  final String message;
}
