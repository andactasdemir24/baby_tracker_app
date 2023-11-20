import 'package:baby_tracker_app/app/features/screens/home/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePagetate();
}

class _HomePagetate extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: CustomAppbar());
  }
}
