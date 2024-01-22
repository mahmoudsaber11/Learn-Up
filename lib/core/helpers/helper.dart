class Helper {
  static String? uId = '';

  static String? validatePasswordField(String? value) {
    if (value!.isEmpty) {
      return 'Please enter password';
    } else if (value.length < 6) {
      return "Password must be more than 5 characters";
    }

    return null;
  }

  static String? validateEmailField(String? value) {
    if (value!.isEmpty) {
      return 'email must not be empty';
    }
    if (!value.contains('@')) {
      return "email should contains @";
    }
    return null;
  }
}
