class Place{
  final String name;
  final String description;
  final String id;
  final String type;
  final List<String> images;
  bool isFavorite;

  Place({
    required this.name,
    required this.description,
    required this.id,
    required this.type,
    required this.images,
    this.isFavorite = false,
  });
}