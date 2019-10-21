import 'package:flutter/widgets.dart';

class ClayblockStyle {
  EdgeInsetsGeometry padding =  EdgeInsets.symmetric(vertical: 8, horizontal: 16);
}

/// Singleton that allows the customization of Clayblock classes default appearance.
class TaipaTheme {
  TaipaTheme._();

  static TaipaTheme _instance;

  static TaipaTheme get instance {
    return _instance ??= TaipaTheme._();
  }
}
