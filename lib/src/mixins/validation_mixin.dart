class ValidationMixin {
  String validateEmail(String value) {
    //return null if valid, else error to user
    if (!value.contains('@')) {
      return 'Not a valid email address!!!';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length < 5) {
      return 'Must be at least 5 characters';
    }
    return null;
  }
}
