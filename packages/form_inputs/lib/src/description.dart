import 'package:formz/formz.dart';

enum DescriptionInputError {
  empty,
  tooLong,
}

class DescriptionInput extends FormzInput<String, DescriptionInputError> {
  const DescriptionInput.pure() : super.pure('');
  const DescriptionInput.dirty([String value = '']) : super.dirty(value);

  @override
  DescriptionInputError? validator(String value) {
    if (value.isEmpty) return DescriptionInputError.empty;
    if (value.length > 100) return DescriptionInputError.tooLong;

    return null;
  }
}
