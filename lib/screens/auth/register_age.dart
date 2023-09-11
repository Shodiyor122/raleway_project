import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ralewayapp/bloc/register/register_bloc.dart';
import 'package:ralewayapp/cells/button.dart';
import 'package:ralewayapp/cells/text_field.dart';
import 'package:ralewayapp/constants.dart';
import 'package:ralewayapp/screens/auth/login_page.dart';
import 'package:ralewayapp/theme/style.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    CustomStaticShowToast.initFToast(context);

    super.initState();
  }
  //<---Methods---->

  void openLogin() => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const LoginPage()));

  void registerPhone() {
    String phoneIdentifier = "+998${_phoneController.text.replaceAll(" ", "")}";

    context.read<RegisterBloc>().add(RegisterUserEvent({
          "name": _nameController.text.trim(),
          "password": _passwordController.text.trim(),
          "username": _usernameController.text.trim(),
          "phone": phoneIdentifier,
        }));
    openLogin();
  }

  void checkRegister() {
    if (_nameController.text.isEmpty)
      return CustomStaticShowToast.showToast("Name field is required",
          isError: true);

    if (_passwordController.text.isEmpty)
      return CustomStaticShowToast.showToast("password field is required",
          isError: true);

    if (_passwordController.text.length < 8)
      return CustomStaticShowToast.showToast(
          "Make sure password is at least 8 characters long",
          isError: true);

    if (_usernameController.text.isEmpty)
      return CustomStaticShowToast.showToast("Username field is required",
          isError: true);

    if (_phoneController.text.length != 13)
      return CustomStaticShowToast.showToast(
          "Phone field should contain 12 digits",
          isError: true);

    registerPhone();
  }

  //<---Widgets---->

  Widget get textofLoginin => const Text("Register in",
      style: TextStyle(fontSize: 25, color: Colors.blue));

  Widget registerPrimaryTextField(
          TextEditingController controller, String title) =>
      TextInputField.primary(controller: controller, title: title);

  Widget registerPhoneTextField(
          TextEditingController controller, String title) =>
      TextInputField.phone(controller: controller, title: title);

  Widget get registerButton =>
      Button.primary(onPressed: checkRegister, text: "Register");

  Widget get view => Padding(
      padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
      child: ListView(children: [
        textofLoginin,
        const SizedBox(height: 16),
        registerPrimaryTextField(_nameController, "Name"),
        const SizedBox(height: 16),
        registerPrimaryTextField(_passwordController, "Password"),
        const SizedBox(height: 16),
        registerPrimaryTextField(_usernameController, "Username"),
        const SizedBox(height: 16),
        registerPhoneTextField(_phoneController, "Phone Nimber"),
        const SizedBox(height: 60),
        registerButton
      ]));

  PreferredSizeWidget get appBar =>
      AppBar(title: Text("Register Page", style: Style.body3w5));

  @override
  Widget build(BuildContext context) => Scaffold(appBar: appBar, body: view);
}
