import 'package:baby_tracker_app/app/core/constants/text_constants.dart';
import 'package:flutter/material.dart';

import '../../../features/screens/feeding/viewmodel/feeding_viewmodel.dart';
import '../../constants/color_constants.dart';
import '../../constants/mediaquery_constants.dart';
import '../../getIt/locator.dart';

class CustomNoteTextfield extends StatelessWidget {
  final TextEditingController controller;
  const CustomNoteTextfield({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final feedingViewmodel = locator.get<FeedingViewModel>();

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.06),
        child: TextField(
          onChanged: (value) {
            feedingViewmodel.changeVisible();
          },
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 8,
          controller: controller,
          decoration: InputDecoration(
              filled: true,
              fillColor: annualColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              hintText: note,
              hintStyle: const TextStyle(color: settingsIndex)),
        ),
      ),
    );
  }
}
