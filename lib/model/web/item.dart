class FirebaseItem {
  final String name;
  final String category;
  final double price;
  final String unit;
  final String description;

  FirebaseItem(
      this.name, this.category, this.price, this.unit, this.description);

  FirebaseItem.fromJson(Map<String?, dynamic> json)
      : name = json['name'] as String,
        category = json['category'] as String,
        price = json['price'] as double,
        unit = json['unit'] as String,
        description = json['description'] as String;

  Map<String, dynamic> toJson() => {
        'name': name,
        'category': category,
        'price': price,
        'unit': unit,
        'description': description
      };
}
