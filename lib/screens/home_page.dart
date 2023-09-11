import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ralewayapp/bloc/user/user_bloc.dart';
import 'package:ralewayapp/cells/button.dart';
import 'package:ralewayapp/cells/cards/product.dart';
import 'package:ralewayapp/models/product.dart';
import 'package:ralewayapp/models/user.dart';
import 'package:ralewayapp/theme/style.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //<----Methods---->
  void logout() => context.read<UserBloc>().add(LogOutUserEvent());

//<----Widgets---->

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

  Widget get blogText => Text("3 - BLOG",
      style: TextStyle(
          fontSize: 20, color: Colors.grey[700], fontWeight: FontWeight.bold));

  Widget get blogBox => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blue, width: 4)),
      child: blogText);

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

  Widget get idTitle => Text("ID: ${widget.user.name}", style: Style.body3w4);
  Widget get userName =>
      Text("Name: ${widget.user.name}", style: Style.body3w4);

  TextSpan drawerText(String text) =>
      TextSpan(text: text, style: Style.body2w4);

  Widget drawerTitle(String title, String text) => Text.rich(
      TextSpan(
          text: title,
          style: Style.body3w6.copyWith(color: Style.colors.grey8),
          children: [drawerText(text)]),
      textAlign: TextAlign.center);

  Widget get logOutButton => Button.text(
      onPressed: logout,
      padding: Style.padding0,
      minWidth: 0,
      text: "Log out",
      textColor: Style.colors.red);

  Widget get drawerView => SafeArea(
      child: Padding(
          padding: Style.padding8,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            drawerTitle("ID: ", widget.user.id?.toString() ?? ""),
            drawerTitle("Name: ", widget.user.name ?? ""),
            drawerTitle("Username: ", widget.user.username ?? ""),
            drawerTitle("Phone: ", widget.user.phone ?? ""),
            const SizedBox(height: 20),
            logOutButton
          ])));
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar,
        body: view,
        drawer: Drawer(
          child: drawerView,
        ),
      );
}
