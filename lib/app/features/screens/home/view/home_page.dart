import 'package:baby_tracker_app/app/core/constants/images_constants.dart';
import 'package:baby_tracker_app/app/features/screens/home/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePagetate();
}

class _HomePagetate extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppbar(),
        body: Column(
          children: [
            CustomImageContainer(image: ImageConstants.homeImage1),
            CustomImageContainer(image: ImageConstants.homeImage2),
            CustomImageContainer(image: ImageConstants.homeImage3),
          ],
        ));
  }
}
