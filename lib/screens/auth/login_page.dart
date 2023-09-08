import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ralewayapp/screens/auth/register_age.dart';
// api_service faylidan import qilingan

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //<----Methods---->

  Future<void> login(BuildContext context) async {
    try {
      Response response = await post(
        Uri.parse("https://e-work.up.railway.app/auth/login"),
        body: {
          "username": _usernameController.text.toString(),
          'password': _passwordController.text.toString()
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterPage()),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Xatolik'),
              content: const Text('Username yokida Password xato'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Yopish'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //<---Widgets---->

  Widget get openRegisterPage => GestureDetector(
      onTap: () {
        login(context);
      },
      child: Padding(
          padding: const EdgeInsets.only(top: 350.0),
          child: Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                  child: Text("Login",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ))))));

  Widget get entringPassword => Expanded(
      flex: 0,
      child: Container(
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(border: Border.all()),
          child: TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ))));

  Widget get entringUsername => Expanded(
      flex: 0,
      child: Container(
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(border: Border.all()),
          child: TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ))));

  Widget get textofLoginin => const Text("Login in",
      style: TextStyle(
        fontSize: 25,
        color: Colors.blue,
      ));

  PreferredSizeWidget get appBar => AppBar(
      backgroundColor: Colors.blue,
      title: const Text("Login Page",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )));

  Widget get loginPage => Scaffold(
      appBar: appBar,
      body: Padding(
          padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
          child: Column(children: [
            textofLoginin,
            const SizedBox(height: 20),
            entringUsername,
            const SizedBox(height: 16.0),
            entringPassword,
            const SizedBox(height: 20),
            openRegisterPage,
          ])));

  @override
  Widget build(BuildContext context) => loginPage;
}
