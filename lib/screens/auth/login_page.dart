import 'package:flutter/material.dart';
// api_service faylidan import qilingan

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //<----Methods---->

  // void showFailDialog() => showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //           title: const Text('Xatolik'),
  //           content: const Text('Username yokida Password xato'),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: const Text('Yopish'),
  //             )
  //           ]);
  //     });

  void login() {}
  //<---Widgets---->

  Widget get loginButtonBody => const Center(
      child: Text("Login",
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)));

  Widget get loginButton => GestureDetector(
      onTap: login,
      child: Padding(
          padding: const EdgeInsets.only(top: 350.0),
          child: Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: loginButtonBody)));

  Widget loginTextField(TextEditingController controller, String labelText) =>
      Container(
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(border: Border.all()),
          child: TextField(
              controller: controller,
              decoration: InputDecoration(labelText: labelText)));

  Widget get loginInTitle => const Text("Login in",
      style: TextStyle(fontSize: 25, color: Colors.blue));

  Widget get view => Padding(
      padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
      child: Column(children: [
        loginInTitle,
        const SizedBox(height: 20),
        loginTextField(_usernameController, "Username"),
        const SizedBox(height: 16.0),
        loginTextField(_passwordController, "Password"),
        const SizedBox(height: 20),
        loginButton
      ]));

  PreferredSizeWidget get appBar => AppBar(
      backgroundColor: Colors.blue,
      title: const Text("Login Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)));

  @override
  Widget build(BuildContext context) => Scaffold(appBar: appBar, body: view);
}
