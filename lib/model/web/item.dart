class FirebaseItem {
  final String itemId;
  final String category;
  final String productName;
  final String brandName;
  final String unit;
  final dynamic quantity;
  final dynamic price;
  final dynamic discount;
  final String image;
  final String description;

  FirebaseItem(
      this.itemId,
      this.category,
      this.productName,
      this.brandName,
      this.unit,
      this.quantity,
      this.price,
      this.discount,
      this.image,
      this.description);

  FirebaseItem.fromJson(Map<String?, dynamic> json)
      : itemId = json['itemId'] as String,
        category = json['category'] as String,
        productName = json['productName'] as String,
        brandName = json['brandName'] as String,
        unit = json['unit'] as String,
        quantity = json['quantity'] as dynamic,
        price = json['price'] as dynamic,
        discount = json['discount'] as dynamic,
        image = json['image'] as String,
        description = json['description'] as String;

  Map<String, dynamic> toJson() => {
        'itemId': itemId,
        'category': category,
        'productName': productName,
        'brandName': brandName,
        'unit': unit,
        'quantity': quantity,
        'price': price,
        'discount': discount,
        'image': image,
        'description': description
      };
}
