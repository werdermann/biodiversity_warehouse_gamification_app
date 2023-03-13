import 'package:formz/formz.dart';

enum UsernameValidationError {
  empty('VALIDATION.REQUIRED');

  const UsernameValidationError(this.message);

  /// Hint message that is being associated with the error.
  final String message;
}

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');
  const Username.dirty([String value = '']) : super.dirty(value);

  @override
  UsernameValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : UsernameValidationError.empty;
  }
}
