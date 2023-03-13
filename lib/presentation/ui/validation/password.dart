import 'package:formz/formz.dart';

enum PasswordValidationError {
  empty('VALIDATION.REQUIRED'),
  tooShort('VALIDATION.PASSWORD_TOO_SHORT');

  const PasswordValidationError(this.message);

  /// Hint message that is being associated with the error.
  final String message;
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String? value) {
    if (value?.isEmpty == true) {
      return PasswordValidationError.empty;
    } else if (value!.length < 3) {
      return PasswordValidationError.tooShort;
    } else {
      return null;
    }
  }
}
