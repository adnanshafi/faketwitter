import 'package:formz/formz.dart';
import 'package:string_validator/string_validator.dart' as s_v;

enum UsernameInputError {
  empty,
  notAlpha,
  tooShort,
  tooLong,
}

class UsernameInput extends FormzInput<String, UsernameInputError> {
  const UsernameInput.pure() : super.pure('');
  const UsernameInput.dirty([String value = '']) : super.dirty(value);

  @override
  UsernameInputError? validator(String value) {
    if (value.isEmpty) return UsernameInputError.empty;
    if (value.length < 3) return UsernameInputError.tooShort;
    if (value.length > 9) return UsernameInputError.tooLong;
    if (!s_v.isAlpha(value)) return UsernameInputError.notAlpha;

    return null;
  }
}
