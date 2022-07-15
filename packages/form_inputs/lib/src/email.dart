import 'package:formz/formz.dart';
import 'package:string_validator/string_validator.dart' as s_v;

enum EmailInputError {
  empty,
  invalid,
}

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty([String value = '']) : super.dirty(value);

  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty) return EmailInputError.empty;
    if (!s_v.isEmail(value)) return EmailInputError.invalid;

    return null;
  }
}
