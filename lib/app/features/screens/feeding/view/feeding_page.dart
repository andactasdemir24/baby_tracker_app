import 'package:baby_tracker_app/app/core/components/costum_vidgets/custom_button.dart';
import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import 'package:baby_tracker_app/app/core/constants/mediaquery_constants.dart';
import 'package:baby_tracker_app/app/features/screens/feeding/viewmodel/feeding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/components/costum_vidgets/custom_appbar.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../../../../core/components/costum_vidgets/amount_textfield.dart';
import '../../../../core/components/costum_vidgets/note_textfield.dart';
import '../../../../core/components/costum_vidgets/time_picker.dart';

class FeedingPage extends StatelessWidget {
  const FeedingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final feedingViewmodel = locator.get<FeedingViewModel>();
    return Scaffold(
        appBar: const CustomAppbar(appbarText: feedingAppbar),
        body: SingleChildScrollView(child: Observer(
          builder: (context) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    feedingViewmodel.selectTime(context);
                    feedingViewmodel.changeVisible();
                  },
                  child: CustomTimePicker(
                    text: feedingViewmodel.time != null ? feedingViewmodel.time!.format(context) : time,
                    color: feedingViewmodel.time != null ? cblack : const Color(0xffC2C2C2),
                  ),
                ),
                AmountTextField(controller: feedingViewmodel.amountController),
                CustomNoteTextfield(
                  controller: feedingViewmodel.noteController,
                  onChanged: (p0) => feedingViewmodel.changeVisible(),
                ),
                SizedBox(height: displayHeight(context) * 0.2),
                Observer(
                  builder: (context) {
                    return Visibility(
                      visible: feedingViewmodel.isButtonVisible,
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
