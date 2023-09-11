import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ralewayapp/bloc/user/user_bloc.dart';
import 'package:ralewayapp/cells/activity_indicator.dart';
import 'package:ralewayapp/screens/auth/login_page.dart';
import 'package:ralewayapp/screens/dashboard.dart';
import 'package:ralewayapp/theme/style.dart';

class Switcher extends StatefulWidget {
  const Switcher({Key? key}) : super(key: key);

  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  //<----Life cycle---->

  @override
  void initState() {
    fetchUserMe();
    super.initState();
  }

  //<----Methods---->

  void fetchUserMe() => context.read<UserBloc>().add(GetUserEvent());

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserLoadingState)
          return ActivityIndicator(color: Style.colors.white);
        if (state is UserCompliedState &&
            state.user != null &&
            state.user!.status != null &&
            state.user!.status!) return Dashboard(user: state.user!);

        return const LoginPage();
      });
}
