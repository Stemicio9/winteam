class AutocompleteElement {

  final String name;
  final String imageLink;

  AutocompleteElement({
    required this.name,
    required this.imageLink,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AutocompleteElement &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}
