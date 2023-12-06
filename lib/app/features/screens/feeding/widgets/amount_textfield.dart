import 'package:flutter/material.dart';

import '../viewmodel/feeding_viewmodel.dart';

class AmountTextField extends StatelessWidget {
  const AmountTextField({
    super.key,
    required this.feedingViewmodel,
  });

  final FeedingViewModel feedingViewmodel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          controller: feedingViewmodel.amountController,
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffF3F3F3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              hintText: 'Amount (ml)',
              hintStyle: const TextStyle(color: Color(0xffC2C2C2))),
        ),
      ),
    );
  }
}
