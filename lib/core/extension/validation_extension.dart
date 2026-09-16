extension Validation on String {
  bool get isValidPhone {
    final RegExp phoneRegex = RegExp(
      r'^(?:(?:00963|963|\+963|0)?9[3-9][0-9]{7}|(?:00966|966|\+966|0)?5[0-9]{8})$',
    );
    return phoneRegex.hasMatch(this);
  }

  bool get isValidEmail {
    final RegExp emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(this);
  }
}
