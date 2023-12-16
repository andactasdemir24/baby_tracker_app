import 'package:baby_tracker_app/app/core/components/costum_vidgets/custom_button.dart';
import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/getIt/locator.dart';
import '../viewmodel/symptomps_viewmodel.dart';
import '../../../../core/components/costum_vidgets/custom_appbar.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../widgets/custom_symptomps_list.dart';
import 'symptomps_page.dart';

class SymptompsList extends StatefulWidget {
  const SymptompsList({Key? key}) : super(key: key);

  @override
  State<SymptompsList> createState() => _SymptompsListState();
}

class _SymptompsListState extends State<SymptompsList> {
  @override
  Widget build(BuildContext context) {
    final symptompsViewmodel = locator.get<SymptompsViewmodel>();
    return Scaffold(
      appBar: const CustomAppbar(appbarText: symptomos),
      body: Observer(
        builder: (context) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            physics: const AlwaysScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 170,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: displayHeight(context) * 0.02,
              mainAxisSpacing: displayWidth(context) * 0.03,
            ),
            shrinkWrap: true,
            itemCount: symptompsViewmodel.symptompsList.length,
            itemBuilder: (BuildContext context, index) {
              var symptomp = symptompsViewmodel.symptompsList[index];
              return Observer(builder: (_) {
                return CustomSymptompsListContainer(
                  symptompsViewmodel: symptompsViewmodel,
                  symptomp: symptomp,
                );
              });
            },
          );
        },
      ),
      floatingActionButton: Observer(builder: (_) {
        return Visibility(
          visible: symptompsViewmodel.selectedIndices.isNotEmpty,
          child: CustomButton(
            text: const Text(save, style: TextStyle(color: cwhite)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SymptompsPage(),
                  ));
            },
          ),
        );
      }),
    );
  }
}
