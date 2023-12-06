import 'package:baby_tracker_app/app/features/screens/feeding/viewmodel/feeding_viewmodel.dart';
import 'package:flutter/material.dart';
import '../../../../core/components/costum_vidgets/custom_appbar.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../widgets/amount_textfield.dart';
import '../widgets/time_picker.dart';

class FeedingPage extends StatefulWidget {
  const FeedingPage({Key? key}) : super(key: key);

  @override
  State<FeedingPage> createState() => _FeedingPageState();
}

class _FeedingPageState extends State<FeedingPage> {
  final feedingViewmodel = locator.get<FeedingViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(appbarText: feedingAppbar),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                feedingViewmodel.selectTime(context);
              },
              child: CustomTimePicker(feedingViewmodel: feedingViewmodel),
            ),
            AmountTextField(feedingViewmodel: feedingViewmodel),
          ],
        ));
  }
}
