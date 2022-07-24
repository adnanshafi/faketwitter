import 'package:formz/formz.dart';

enum NameInputError {
  empty,
  tooLong,
}

class NameInput extends FormzInput<String, NameInputError> {
  const NameInput.pure() : super.pure('');
  const NameInput.dirty([String value = '']) : super.dirty(value);

  @override
  NameInputError? validator(String value) {
    if (value.isEmpty) return NameInputError.empty;
    if (value.length > 15) return NameInputError.tooLong;

    return null;
  }
}
