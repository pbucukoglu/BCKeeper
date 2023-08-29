extension StringExtensions on String {
  String removeUnexpectedCharacters() {
    final regex = RegExp(r'[^a-zA-Z0-9\s\{\}\[\]:,".\-_]');
    return this.replaceAll(regex, '');
  }

  String removeControlCharacters() {
    final regex = RegExp(r'[\x00-\x1F\x7F]');
    return this.replaceAll(regex, '');
  }
}
