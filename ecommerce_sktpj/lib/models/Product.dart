class Product {
  final String name;
  final String description;
  final String type;
  final int harga;
  final String imageAsset;
  bool isFavorite;

  Product({
    required this.name,
    required this.description,
    required this.type,
    required this.harga,
    required this.imageAsset,
    this.isFavorite = false,
  });

}

