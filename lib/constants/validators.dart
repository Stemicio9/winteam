String? notEmptyValidate(String? value) {
  if (value != null) {
    if (value.isEmpty) {
      return 'Campo obbligatorio';
    }
  }
  return null;
}


String? validatePassword(String? value) {
  if (value != null) {
    if (value.isEmpty) {
      return 'Campo obbligatorio';
    }
    if (value.length < 6) {
      return 'La password deve contenere almeno 6 caratteri';
    }
  }
  return null;
}

String? validateEmail(String? value) {
  if (value != null) {
    if (value.isEmpty) {
      return 'Campo obbligatorio';
    }
    if (!value.isValidEmail()) {
      return "Inserire un indirizzo email valido";
    }
  }
  return null;
}

String? defaultValidator(String? text) {
  return "";
}


String? validateIsEmail(String? value) {
  if (value != null) {
    if (value.isEmpty) {
      return null;
    }
    if (!value.isValidEmail()) {
      return "Inserire un indirizzo email valido";
    }
  }
  return null;
}



extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
