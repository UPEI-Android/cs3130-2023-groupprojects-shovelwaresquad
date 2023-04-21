class ListItem {
  String title;
  final List<String> contents;

  ListItem(this.title, this.contents);

  @override
  bool operator ==(Object other) => other is ListItem && other.title == title;
}