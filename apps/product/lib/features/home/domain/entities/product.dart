class ProductToDisplay {
  late final String id;
  late final String category;
  late final String imageUrl;
  late final String name;
  late final double price;
  late final String? desciption;

  ProductToDisplay({
    required this.id,
    required this.category,
    required this.imageUrl,
    required this.name,
    required this.price,
    this.desciption,
  });
}
