import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//<----Widgets---->
class _HomePageState extends State<HomePage> {
  Widget listile(String firstText, String secondText, IconData icon,
          String thirdText, Color color) =>
      Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue, width: 2)),
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: Row(children: [
                Text(firstText),
                const SizedBox(width: 5),
                Text(secondText),
                const Spacer(),
                Icon(
                  icon,
                  color: color,
                ),
                Text(thirdText,
                    style: TextStyle(color: color, fontWeight: FontWeight.bold))
              ])));

  Widget get listviewOfRecents => Expanded(
          child: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
        listile("1", "Mix", Icons.arrow_outward, "25", Colors.green),
        const SizedBox(height: 10),
        listile("2", "Qum", Icons.arrow_outward, "25", Colors.green),
        const SizedBox(height: 10),
        listile("3", "Qum", Icons.arrow_outward, "25", Colors.red),
        const SizedBox(height: 10),
        listile("4", "Qum", Icons.arrow_outward, "25", Colors.red),
        const SizedBox(height: 10),
        listile("5", "G'isht", Icons.arrow_outward, "25", Colors.green),
      ]));

  Widget get textRecents => const Text(
        "Oxirgi o'zgarishlar tarixi",
        style: TextStyle(fontSize: 20),
      );

  Widget get buttonOfBlog => FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.logout_outlined),
      );

  Widget get textOfBlog => Text(
        "3 - BLOG",
        style: TextStyle(
            fontSize: 20, color: Colors.grey[700], fontWeight: FontWeight.bold),
      );

  Widget get blogOfContainer => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blue, width: 4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [textOfBlog, buttonOfBlog],
      ));

  PreferredSizeWidget get appBar => AppBar(
      backgroundColor: const Color.fromARGB(255, 66, 141, 212),
      title: const Text(
        "Nematov Xurishid",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ));

  Widget get homePage => Scaffold(
      appBar: appBar,
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                blogOfContainer,
                const SizedBox(height: 10),
                textRecents,
                listviewOfRecents
              ]))));
  @override
  Widget build(BuildContext context) => homePage;
}
