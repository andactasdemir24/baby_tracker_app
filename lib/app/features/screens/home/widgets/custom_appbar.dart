import 'package:baby_tracker_app/app/core/constants/mediaquery_constants.dart';
import 'package:baby_tracker_app/app/core/constants/text_constants.dart';
import 'package:baby_tracker_app/app/features/theme/baby_icons.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(TextConstants.appbarText,
          style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500)),
      leading: GestureDetector(child: const Icon(Baby.settings, size: 50)),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: displayHeight(context) * 0.02),
          child: const Icon(Baby.calendar),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
