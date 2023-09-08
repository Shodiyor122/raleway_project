import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  //<---Widgets---->
  Widget get openRegisterPage => Padding(
      padding: const EdgeInsets.only(top: 200.0),
      child: Container(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: const Center(
              child: Text(
            "Register",
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ))));

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

  Widget get entringName => Expanded(
      flex: 0,
      child: Container(
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(border: Border.all()),
          child: TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ))));

  Widget get entringPhone => Expanded(
      flex: 0,
      child: Container(
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(border: Border.all()),
          child: TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Nimber',
              ))));

  Widget get textofLoginin => const Text("Register in",
      style: TextStyle(
        fontSize: 25,
        color: Colors.blue,
      ));

  PreferredSizeWidget get appBar => AppBar(
      backgroundColor: Colors.blue,
      title: const Text(
        "Register Page",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ));
  Widget get loginPage => Scaffold(
      appBar: appBar,
      body: Padding(
          padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
          child: Column(
            children: [
              textofLoginin,
              const SizedBox(height: 16),
              entringName,
              const SizedBox(height: 16),
              entringPassword,
              const SizedBox(height: 16),
              entringUsername,
              const SizedBox(height: 16),
              entringPhone,
              const SizedBox(height: 16),
              openRegisterPage
            ],
          )));
  @override
  Widget build(BuildContext context) => loginPage;
}
