import 'package:baby_tracker_app/app/features/screens/home/view/home_page.dart';
import 'package:baby_tracker_app/app/features/screens/symptomps/viewmodel/symptomps_viewmodel.dart';
import 'package:baby_tracker_app/app/features/theme/baby_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/components/custom_widgets/custom_button.dart';
import '../../../../core/components/custom_widgets/note_textfield.dart';
import '../../../../core/components/custom_widgets/time_picker.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../widgets/custom_sypmtomps_container.dart';

class SymptompsPage extends StatefulWidget {
  const SymptompsPage({super.key});

  @override
  State<SymptompsPage> createState() => _SymptompsPageState();
}

class _SymptompsPageState extends State<SymptompsPage> {
  @override
  Widget build(BuildContext context) {
    final symptompsViewmodel = locator.get<SymptompsViewmodel>();
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(symptomos,
                style: TextStyle(
                    color: getPremiumTextColor, fontSize: 27, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
            leading: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                },
                icon: const Icon(Baby.right))),
        body: SingleChildScrollView(child: Observer(
          builder: (context) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    symptompsViewmodel.selectTime3(context);
                    symptompsViewmodel.changeVisible();
                  },
                  child: CustomTimePicker(
                      text: symptompsViewmodel.time3 != null ? symptompsViewmodel.time3!.format(context) : sympAppbar,
                      color: symptompsViewmodel.time3 != null ? cblack : settingsIndex),
                ),
                const CustomSymptompsList(),
                CustomNoteTextfield(
                  controller: symptompsViewmodel.noteController,
                  onChanged: (p0) => symptompsViewmodel.changeVisible(),
                ),
                SizedBox(height: displayHeight(context) * 0.2),
                Observer(
                  builder: (context) {
                    return Visibility(
                      visible: symptompsViewmodel.isButtonVisible3,
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
