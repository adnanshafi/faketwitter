import 'package:formz/formz.dart';

enum AvatarInputError {
  empty,
  invalid,
}

class AvatarInput extends FormzInput<String, AvatarInputError> {
  const AvatarInput.pure() : super.pure('');
  const AvatarInput.dirty([String value = '']) : super.dirty(value);

  @override
  AvatarInputError? validator(String value) {
    if (value.isEmpty) return AvatarInputError.empty;
    if (!_validAvatars.contains(value)) return AvatarInputError.invalid;
    return null;
  }
}

const List<String> _validAvatars = [
  'assets/avatar/01.png',
  'assets/avatar/02.png',
  'assets/avatar/03.png',
  'assets/avatar/04.png',
  'assets/avatar/05.png',
  'assets/avatar/06.png',
  'assets/avatar/07.png',
  'assets/avatar/08.png',
  'assets/avatar/09.png',
  'assets/avatar/10.png',
  'assets/avatar/11.png',
  'assets/avatar/12.png',
  'assets/avatar/13.png',
  'assets/avatar/14.png',
  'assets/avatar/15.png',
  'assets/avatar/16.png',
  'assets/avatar/17.png',
  'assets/avatar/18.png',
  'assets/avatar/19.png',
  'assets/avatar/20.png',
  'assets/avatar/21.png',
  'assets/avatar/22.png',
  'assets/avatar/23.png',
  'assets/avatar/24.png',
  'assets/avatar/25.png',
  'assets/avatar/26.png',
  'assets/avatar/27.png',
  'assets/avatar/28.png',
  'assets/avatar/29.png',
  'assets/avatar/30.png',
  'assets/avatar/31.png',
  'assets/avatar/32.png',
  'assets/avatar/33.png',
  'assets/avatar/34.png',
  'assets/avatar/35.png',
  'assets/avatar/36.png',
  'assets/avatar/37.png',
  'assets/avatar/38.png',
  'assets/avatar/39.png',
  'assets/avatar/40.png',
  'assets/avatar/41.png',
  'assets/avatar/42.png',
  'assets/avatar/43.png',
  'assets/avatar/44.png',
  'assets/avatar/45.png',
  'assets/avatar/46.png',
  'assets/avatar/47.png',
  'assets/avatar/48.png',
  'assets/avatar/49.png',
  'assets/avatar/50.png',
  'assets/avatar/51.png',
  'assets/avatar/52.png',
  'assets/avatar/53.png',
  'assets/avatar/54.png',
  'assets/avatar/55.png',
  'assets/avatar/56.png',
  'assets/avatar/57.png',
  'assets/avatar/58.png',
  'assets/avatar/59.png',
  'assets/avatar/60.png',
  'assets/avatar/61.png',
  'assets/avatar/62.png',
  'assets/avatar/63.png',
  'assets/avatar/64.png',
  'assets/avatar/65.png',
];
