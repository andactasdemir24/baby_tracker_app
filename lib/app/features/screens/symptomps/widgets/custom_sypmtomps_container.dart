import 'package:baby_tracker_app/app/features/screens/symptomps/view/symptomps_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../../../theme/baby_icons.dart';
import '../viewmodel/symptomps_viewmodel.dart';

class CustomSymptompsList extends StatelessWidget {
  const CustomSymptompsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final symptompsViewmodel = locator.get<SymptompsViewmodel>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SymptompsList(),
            ),
          );
        },
        child: Container(
          width: displayWidth(context) * 0.8878,
          height: displayHeight(context) * 0.082,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: annualColor,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.04),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Observer(
                    builder: (context) {
                      return Text(
                        symptompsViewmodel.selectedIndices.isEmpty
                            ? symptomos
                            : symptompsViewmodel.selectedIndices.map((index) => index.name).join(', '),
                        style: TextStyle(
                            fontSize: 15.5,
                            fontWeight: FontWeight.bold,
                            color: symptompsViewmodel.selectedIndices.isEmpty ? settingsIndex : Colors.black),
                      );
                    },
                  ),
                  const Icon(Baby.left, color: settingsIndex)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
