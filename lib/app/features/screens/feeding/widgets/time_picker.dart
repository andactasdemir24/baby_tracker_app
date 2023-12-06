import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/constants/mediaquery_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../viewmodel/feeding_viewmodel.dart';

class CustomTimePicker extends StatelessWidget {
  const CustomTimePicker({
    super.key,
    required this.feedingViewmodel,
  });

  final FeedingViewModel feedingViewmodel;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Container(
          width: displayWidth(context) * 0.8878,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xfff3f3f3),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                feedingViewmodel.time != null ? feedingViewmodel.time!.format(context) : time,
                style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.bold, color: Color(0xffC2C2C2)),
              ),
            ),
          ),
        );
      },
    );
  }
}
