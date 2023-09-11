import 'package:flutter/material.dart';
import 'package:ralewayapp/screens/home_page.dart';

class RalewayApp extends StatelessWidget {
  const RalewayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      home: const HomePage(),
      debugShowCheckedModeBanner: false);
}
