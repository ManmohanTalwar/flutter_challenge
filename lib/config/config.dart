class Config {
  static String getJokes({
    String firstName,
    String lastName,
    String category = 'chuck norris',
    int limit = 10,
  }) =>
      'http://api.icndb.com/jokes/random/$limit?firstName=$firstName&lastName=$lastName';
}
