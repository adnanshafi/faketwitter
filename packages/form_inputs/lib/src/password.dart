import 'package:formz/formz.dart';
import 'package:string_validator/string_validator.dart' as s_v;

enum PasswordInputError {
  empty,
  tooShort,
  tooLong,
  confirmError,
}

class PasswordInput extends FormzInput<String, PasswordInputError> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty) return PasswordInputError.empty;
    if (value.length < 6) return PasswordInputError.tooShort;
    if (value.length > 10) return PasswordInputError.tooLong;
    return null;
  }
}

class PasswordConfirmInput extends FormzInput<String, PasswordInputError> {
  const PasswordConfirmInput.pure({this.confirmValue = ''}) : super.pure('');
  const PasswordConfirmInput.dirty([String value = '', this.confirmValue = ''])
      : super.dirty(value);

  final String confirmValue;

  @override
  PasswordInputError? validator(String value) {
    if (confirmValue != value) return PasswordInputError.confirmError;
    if (value.isEmpty) return PasswordInputError.empty;
    if (value.length < 6) return PasswordInputError.tooShort;
    if (value.length > 10) return PasswordInputError.tooLong;

    return null;
  }
}
