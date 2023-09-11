class Product {
  int id;
  String? name;

  int? amount;
  String? size;
  String? price;

  Product({required this.id, this.name, this.amount, this.size, this.price});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json["id"],
      name: json["name"],
      amount: json["amount"],
      size: json["size"],
      price: json["price"]);
}
