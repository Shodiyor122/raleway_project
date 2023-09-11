import 'package:flutter/material.dart';
import 'package:ralewayapp/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  Widget get id => Text("id: ${product.id}",
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500));

  Widget get name => Expanded(
        child: Text("name: ${product.name}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
      );

  Widget get idAndName => Row(children: [id, const SizedBox(width: 16), name]);

  Widget get amount => Text("wieght: ${product.amount}",
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300));

  Widget get size => Text(product.size ?? "",
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300));

  Widget get amountAndSize =>
      Row(children: [amount, const SizedBox(width: 8), size]);

  Widget get price => Text("price: ${product.price} sum",
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w300));

  Widget get viewBody => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            idAndName,
            const SizedBox(height: 16),
            amountAndSize,
            const SizedBox(height: 16),
            price
          ]));

  Widget get viewBox => Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue, width: 2)),
      child: viewBody);

  @override
  Widget build(BuildContext context) => viewBox;
}
