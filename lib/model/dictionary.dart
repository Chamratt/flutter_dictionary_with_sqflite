class Dictionary {
  String? word;
  String? wordtype;
  String? definition;

  String? get getWord => word;

  String? get getWordtype => wordtype;

  String? get getDefinition => definition;
  Dictionary(this.word, this.wordtype, this.definition);
  Dictionary.fromMapObject(Map<String, dynamic> map) {
    word = map['word'];
    wordtype = map['wordtype'];
    definition = map['definition'];
  }
}
