import 'package:baby_tracker_app/app/features/screens/sleep/viewmodel/sleep_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/components/costum_vidgets/custom_appbar.dart';
import '../../../../core/components/costum_vidgets/custom_button.dart';
import '../../../../core/components/costum_vidgets/note_textfield.dart';
import '../../../../core/components/costum_vidgets/time_picker.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';

class SleepPage extends StatelessWidget {
  const SleepPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sleepViewmodel = locator.get<SleepViewModel>();

    return Scaffold(
        appBar: const CustomAppbar(appbarText: sleepAppbar),
        body: SingleChildScrollView(child: Observer(
          builder: (context) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    sleepViewmodel.selectTime1(context);
                    sleepViewmodel.changeVisible();
                  },
                  child: CustomTimePicker(
                    text: sleepViewmodel.time1 != null ? sleepViewmodel.time1!.format(context) : feelSleep,
                    color: sleepViewmodel.time1 != null ? cblack : const Color(0xffC2C2C2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: GestureDetector(
                    onTap: () {
                      sleepViewmodel.selectTime2(context);
                      sleepViewmodel.changeVisible();
                    },
                    child: CustomTimePicker(
                      text: sleepViewmodel.time2 != null ? sleepViewmodel.time2!.format(context) : wokeUp,
                      color: sleepViewmodel.time2 != null ? cblack : const Color(0xffC2C2C2),
                    ),
                  ),
                ),
                CustomNoteTextfield(
                  controller: sleepViewmodel.noteController,
                  onChanged: (p0) => sleepViewmodel.changeVisible(),
                ),
                SizedBox(height: displayHeight(context) * 0.2),
                Observer(
                  builder: (context) {
                    return Visibility(
                      visible: sleepViewmodel.isButtonVisible2,
                      child: CustomButton(
                        text: const Text(save, style: TextStyle(color: cwhite)),
                        onPressed: () {},
                      ),
                    );
                  },
                )
              ],
            );
          },
        )));
  }
}
