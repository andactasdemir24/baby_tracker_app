import 'package:flutter/material.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/text_constants.dart';

class GetPremium extends StatelessWidget {
  const GetPremium({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(TextConstants.getPremium,
            style: TextStyle(
              fontSize: 27,
              color: ColorConstants.buttonColor,
              fontWeight: FontWeight.w600,
            )));
  }
}
