class Entry {
  final int entryId;
  final String entryName;
  final String summary;
  final String imageURL;
  final String description; 
  bool isSelected;

  Entry(
      {required this.entryId,
      required this.entryName,
      required this.summary,
      required this.imageURL,
      required this.description,
      required this.isSelected});

  //List of Plants data
  static List<Entry> entryList = [
    Entry(
        entryId: 1,
        entryName: "Meals",
        summary: "xxx",
        imageURL: 'assets/images/recipes/broccoli_puree.jpg',
        description: "hello world",
        isSelected: false,
    ),
    Entry(
        entryId: 2,
        entryName: "Diapers",
        summary: "xxx",
        imageURL: 'assets/images/recipes/broccoli_puree.jpg',
        description: "hello world",
        isSelected: false,
        ),
    Entry(
        entryId: 3,
        entryName: "Sleep",
        summary: "xxx",
        imageURL: 'assets/images/recipes/broccoli_puree.jpg',
        description: "hello world",
        isSelected: false,
        ),
    ];
}