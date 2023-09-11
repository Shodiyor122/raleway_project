import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ralewayapp/bloc/login/login_bloc.dart';
import 'package:ralewayapp/bloc/register/register_bloc.dart';
import 'package:ralewayapp/bloc/user/user_bloc.dart';
import 'package:ralewayapp/switcher.dart';
import 'package:ralewayapp/theme/theme.dart';

class RalewayApp extends StatefulWidget {
  const RalewayApp({Key? key}) : super(key: key);

  @override
  State<RalewayApp> createState() => _RalewayAppState();
}

class _RalewayAppState extends State<RalewayApp> {
  Widget get materialApp => MaterialApp(
      title: 'Railway app',
      theme: theme,
      home: const Switcher(),
      debugShowCheckedModeBanner: false);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider(create: (_) => RegisterBloc()),
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => UserBloc())
      ], child: materialApp);
}
