import 'package:flutter/material.dart';

import '../../../../core/constants/mediaquery_constants.dart';
import '../../../theme/baby_icons.dart';

class CancelIcon extends StatelessWidget {
  const CancelIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: displayHeight(context) * 0.03),
      child: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          onPressed: () {},
          icon: Icon(Baby.cancel, size: displayHeight(context) * 0.06),
        ),
      ),
    );
  }
}
