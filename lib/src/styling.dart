class Stylizable {

}

/// Singleton that allows the customization of Clayblock classes default appearance.
class TaipaTheme {
  TaipaTheme._();

  static TaipaTheme _instance;

  static TaipaTheme get instance {
    return _instance ??= TaipaTheme._();
  }
}
