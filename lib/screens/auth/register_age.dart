import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  //<---Widgets---->

  Widget get textofLoginin => const Text("Register in",
      style: TextStyle(fontSize: 25, color: Colors.blue));

  Widget registerTextField(
          TextEditingController controller, String labelText) =>
      Container(
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(border: Border.all()),
          child: TextField(
              controller: controller,
              decoration: InputDecoration(labelText: labelText)));

  Widget get registerButtonBody => const Center(
      child: Text("Register",
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)));

  Widget get registerButton => Padding(
      padding: const EdgeInsets.only(top: 200.0),
      child: Container(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: registerButtonBody));

  Widget get view => Padding(
      padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
      child: Column(children: [
        textofLoginin,
        const SizedBox(height: 16),
        registerTextField(_nameController, "Name"),
        const SizedBox(height: 16),
        registerTextField(_passwordController, "Password"),
        const SizedBox(height: 16),
        registerTextField(_usernameController, "Username"),
        const SizedBox(height: 16),
        registerTextField(_phoneController, "Phone Nimber"),
        const SizedBox(height: 16),
        registerButton
      ]));

  PreferredSizeWidget get appBar => AppBar(
      backgroundColor: Colors.blue,
      title: const Text("Register Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)));

  @override
  Widget build(BuildContext context) => Scaffold(appBar: appBar, body: view);
}
