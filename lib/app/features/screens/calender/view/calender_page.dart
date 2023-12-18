import 'package:baby_tracker_app/app/core/components/custom_widgets/custom_appbar.dart';
import 'package:baby_tracker_app/app/core/constants/text_constants.dart';
import 'package:baby_tracker_app/app/features/screens/calender/viewmodel/calender_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/getIt/locator.dart';
import '../widgets/custom_datebutton.dart';

class CalenderPage extends StatelessWidget {
  const CalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final calenderViewmodel = locator.get<CalenderViewModel>();
    return Scaffold(
      appBar: const CustomAppbar(appbarText: calenderAppbar),
      body: Observer(builder: (context) {
        return Column(
          children: [
            DateButton(calenderViewmodel: calenderViewmodel),
          ],
        );
      }),
    );
  }
}
