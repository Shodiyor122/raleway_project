import 'package:flutter/material.dart';
import 'package:ralewayapp/cells/cards/product.dart';
import 'package:ralewayapp/models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

//<----Widgets---->
class _HomePageState extends State<HomePage> {
  Widget get textRecents =>
      const Text("Oxirgi o'zgarishlar tarixi", style: TextStyle(fontSize: 20));

  Widget get listviewOfRecents => Expanded(
          child: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
        ProductCard(
            product: Product(
                id: 0,
                name: "Aluminy",
                amount: 3232,
                size: "kg",
                price: "3003"))
      ]));

  Widget get blogButton => FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.blue,
      child: const Icon(Icons.logout_outlined));

  Widget get blogText => Text("3 - BLOG",
      style: TextStyle(
          fontSize: 20, color: Colors.grey[700], fontWeight: FontWeight.bold));

  Widget get blogBox => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blue, width: 4)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [blogText, blogButton]));

  Widget get view => Padding(
      padding: const EdgeInsets.all(16.0),
      child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            blogBox,
            const SizedBox(height: 10),
            textRecents,
            listviewOfRecents
          ])));

  PreferredSizeWidget get appBar => AppBar(
      backgroundColor: const Color.fromARGB(255, 66, 141, 212),
      title: const Text("Nematov Xurishid",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)));

  @override
  Widget build(BuildContext context) => Scaffold(appBar: appBar, body: view);
}
