import 'package:baby_tracker_app/app/core/hive/model/symptomps_model.dart';
import 'package:baby_tracker_app/app/features/screens/symptomps/view/symptomps_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../../../theme/baby_icons.dart';
import '../viewmodel/calender_viewmodel.dart';

class CustomSymptompsListView extends StatelessWidget {
  const CustomSymptompsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final calenderViewmodel = locator.get<CalenderViewModel>();
    return Observer(builder: (context) {
      return ListView.builder(
        itemCount: calenderViewmodel.symptompsList.length,
        itemBuilder: (context, index) {
          var symptomps = calenderViewmodel.symptompsList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                Center(child: Observer(
                  builder: (context) {
                    return Dismissible(
                      key: Key(symptomps.id!),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20.0),
                        child: const Icon(Icons.delete, color: cwhite),
                      ),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        calenderViewmodel.deleteSymptomps(symptomps.id!);
                      },
                      child: GestureDetector(
                          onDoubleTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SymptompsPageEdit(
                                    id: symptomps.id!,
                                    symTime: symptomps.symTime!,
                                    sympList: symptomps.sympList!,
                                    note: symptomps.text!,
                                  ),
                                ));
                          },
                          onTap: () {
                            calenderViewmodel.toogleSelected2(index);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInCirc,
                            width: displayWidth(context) * 0.8878,
                            height:
                                symptomps.isSelected ? displayHeight(context) * 0.12 : displayHeight(context) * 0.075,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: annualColor,
                            ),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: !symptomps.isSelected ? notpress(symptomps) : whenipress(symptomps),
                            ),
                          )),
                    );
                  },
                )),
              ],
            ),
          );
        },
      );
    });
  }

  Observer notpress(Symptomps symptomps) {
    return Observer(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Baby.sleep, size: 30, color: mainIconColor),
              ...symptomps.sympList!.asMap().entries.map((entry) {
                int index = entry.key;
                String name = entry.value.name.toString();
                return Text(index < symptomps.sympList!.length - 1 ? '$name / ' : name,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainIconColor));
              }).toList(),
            ],
          ),
          Text(
              '${symptomps.symTime!.hour.toString().padLeft(2, '0')}:${symptomps.symTime!.minute.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      );
    });
  }

  Observer whenipress(Symptomps symptomps) {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Baby.sleep, size: 30, color: mainIconColor),
                    ...symptomps.sympList!.asMap().entries.map((entry) {
                      int index = entry.key;
                      String name = entry.value.name.toString();
                      return Text(index < symptomps.sympList!.length - 1 ? '$name / ' : name,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: mainIconColor));
                    }).toList(),
                  ],
                ),
                Text(
                    '${symptomps.symTime!.hour.toString().padLeft(2, '0')}:${symptomps.symTime!.minute.toString().padLeft(2, '0')}',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Note: ${symptomps.text.toString()}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ))),
            )
          ],
        ),
      );
    });
  }
}
