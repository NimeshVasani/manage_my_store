class FirebaseItem {
  final String category;
  final String productName;
  final String brandName;
  final String unit;
  final double quantity;
  final double price;
  final double discount;
  final String description;

  FirebaseItem(this.category, this.productName, this.brandName, this.unit,
      this.quantity, this.price, this.discount, this.description);

  FirebaseItem.fromJson(Map<String?, dynamic> json)
      : category = json['category'] as String,
        productName = json['productName'] as String,
        brandName = json['brandName'] as String,
        unit = json['unit'] as String,
        quantity = json['quantity'] as double,
        price = json['price'] as double,
        discount = json['discount'] as double,
        description = json['description'] as String;

  Map<String, dynamic> toJson() => {
        'category': category,
        'productName': productName,
        'brandName': brandName,
        'unit': unit,
        'quantity': quantity,
        'price': price,
        'discount': discount,
        'description': description
      };
}
