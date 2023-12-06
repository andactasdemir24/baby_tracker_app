import 'package:baby_tracker_app/app/core/constants/images_constants.dart';
import 'package:baby_tracker_app/app/features/screens/feeding/view/feeding_page.dart';
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
    return Scaffold(
        appBar: const CustomAppbar(),
        body: Column(
          children: [
            GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FeedingPage())),
                child: const CustomImageContainer(image: ImageConstants.homeImage1)),
            const CustomImageContainer(image: ImageConstants.homeImage2),
            const CustomImageContainer(image: ImageConstants.homeImage3),
          ],
        ));
  }
}
