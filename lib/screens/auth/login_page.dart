import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ralewayapp/bloc/login/login_bloc.dart';
import 'package:ralewayapp/bloc/user/user_bloc.dart';
import 'package:ralewayapp/cells/button.dart';
import 'package:ralewayapp/cells/text_field.dart';
import 'package:ralewayapp/constants.dart';
import 'package:ralewayapp/screens/auth/register_age.dart';
import 'package:ralewayapp/theme/style.dart';
// api_service faylidan import qilingan

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //<----Life cycle---->

  @override
  void initState() {
    CustomStaticShowToast.initFToast(context);

    super.initState();
  }
  //<----Listeners---->

  void loginListener(_, state) {
    if (state is! LoginCompliedState) return;

    if (state.loginData.status == null) return;
    if (!state.loginData.status!) {
      openregister();
    } else {
      fetchUserMe();
    }
  }
  //<----Methods---->

  void fetchUserMe() => context.read<UserBloc>().add(GetUserEvent());

  void openregister() => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const RegisterPage()));

  void login() => context.read<LoginBloc>().add(LoginUserEvent(data: {
        "username": _usernameController.text.trim(),
        "password": _passwordController.text.trim()
      }));

  void checkLogin() {
    if (_usernameController.text.isEmpty)
      return CustomStaticShowToast.showToast("Username field is required",
          isError: true);

    if (_passwordController.text.isEmpty)
      return CustomStaticShowToast.showToast("password field is required",
          isError: true);

    if (_passwordController.text.length < 8)
      return CustomStaticShowToast.showToast(
          "Make sure password is at least 8 characters long",
          isError: true);

    login();
  }
  //<---Widgets---->

  Widget get loginTitle => Center(
      child: Text("Login in",
          style: Style.headline3w5.copyWith(color: Style.colors.primary)));

  Widget loginPrimaryTextField(
          TextEditingController controller, String title) =>
      TextInputField.primary(controller: controller, title: title);

  Widget get loginButton => BlocConsumer<LoginBloc, LoginState>(
      listener: loginListener,
      builder: (context, state) => Button.primary(
          onPressed: checkLogin,
          spinner: state is LoginLoadingState,
          text: "Login"));

  Widget get view => ListView(padding: Style.padding16, children: [
        const SizedBox(height: 32),
        loginTitle,
        const SizedBox(height: 16),
        loginPrimaryTextField(_usernameController, "Username"),
        const SizedBox(height: 16.0),
        loginPrimaryTextField(_passwordController, "Password"),
        const SizedBox(height: 450),
        loginButton
      ]);

  PreferredSizeWidget get appBar =>
      AppBar(title: Text("Login Page", style: Style.body3w5));

  @override
  Widget build(BuildContext context) => Scaffold(appBar: appBar, body: view);
}
