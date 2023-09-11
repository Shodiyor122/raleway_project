import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ralewayapp/bloc/products/products_bloc.dart';
import 'package:ralewayapp/bloc/user/user_bloc.dart';
import 'package:ralewayapp/cells/activity_indicator.dart';
import 'package:ralewayapp/cells/button.dart';
import 'package:ralewayapp/cells/cards/product.dart';
import 'package:ralewayapp/cells/try_again.dart';
import 'package:ralewayapp/models/product.dart';
import 'package:ralewayapp/models/user.dart';
import 'package:ralewayapp/theme/style.dart';

class Dashboard extends StatefulWidget {
  final User user;
  const Dashboard({Key? key, required this.user}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //<----Life cycle---->

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  //<----Methods---->
  void logout() => context.read<UserBloc>().add(LogOutUserEvent());

  void fetchProducts() => context.read<ProductsBloc>().add(GetProductsEvent());

//<----Widgets---->

  Widget get textRecents =>
      const Text("Oxirgi o'zgarishlar tarixi", style: TextStyle(fontSize: 20));

  Widget productList(List<Product> products) => ListView.separated(
      itemCount: products.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => const SizedBox(height: 24),
      itemBuilder: (context, index) => ProductCard(product: products[index]));

  Widget get productListStateChecker =>
      BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
        if (state is ProductsCompliedState) return productList(state.products);
        if (state is ProductsFailedState)
          return TryAgain(onTapTryAgain: () => fetchProducts());
        return const ActivityIndicator();
      });

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

  Widget get view => SafeArea(
          child: ListView(padding: Style.padding16, children: [
        blogBox,
        const SizedBox(height: 10),
        textRecents,
        const SizedBox(height: 16),
        productListStateChecker
      ]));

  PreferredSizeWidget get appBar => AppBar(
      backgroundColor: const Color.fromARGB(255, 66, 141, 212),
      title: Text(widget.user.name ?? "",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold)));

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
        drawer: Drawer(child: drawerView),
      );
}
