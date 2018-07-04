import 'dart:async';

class Bloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnable => _themeController.stream;
}

final bloc = Bloc();
