import 'package:flutter/material.dart';
import 'package:privateinsta/src/widgets/appbar,.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/homescreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PIAppBar(
        appBar: AppBar(),
      ),
      body: const Placeholder(),
    );
  }
}
