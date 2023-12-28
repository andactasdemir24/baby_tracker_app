import 'package:baby_tracker_app/app/core/getIt/locator.dart';
import 'package:baby_tracker_app/app/core/hive/model/feeding_model.dart';
import 'package:baby_tracker_app/app/core/hive/model/sleep_model.dart';
import 'package:baby_tracker_app/app/core/hive/model/symptomps_model.dart';
import 'package:baby_tracker_app/app/features/screens/calender/viewmodel/calender_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../theme/baby_icons.dart';
import '../../feeding/view/feeding_edit_page.dart';
import '../../sleep/view/sleep_edit_page.dart';
import '../../symptomps/view/symptomps_edit_page.dart';

class CustomAllListview extends StatelessWidget {
  const CustomAllListview({super.key});

  @override
  Widget build(BuildContext context) {
    final allviewmodel = locator.get<CalenderViewModel>();
    return Scaffold(
      body: Observer(
        builder: (context) {
          return ListView.builder(
            itemCount: allviewmodel.allList.length,
            itemBuilder: (context, index) {
              var all = allviewmodel.allList[index];
              switch (all) {
                case Feeding():
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      children: [
                        Center(child: Observer(
                          builder: (context) {
                            return Dismissible(
                              key: Key(all.id!),
                              background: Container(
                                color: sleepIconColor,
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 20.0),
                                child: const Icon(Icons.delete, color: cwhite),
                              ),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                allviewmodel.deleteFeeding(all.id!);
                              },
                              child: GestureDetector(
                                  onDoubleTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => FeedingEdit(
                                              id: all.id!, time: all.time!, amount: all.amount!, note: all.text!),
                                        ));
                                  },
                                  child: Container(
                                    width: displayWidth(context) * 0.8878,
                                    height: displayHeight(context) * 0.11,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: annualColor,
                                    ),
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      const Icon(Baby.feed, size: 30, color: mainIconColor),
                                                      Text('${all.amount} (ml)',
                                                          style: const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.bold,
                                                              color: mainIconColor)),
                                                    ],
                                                  ),
                                                  Text(
                                                      '${all.time?.hour.toString().padLeft(2, '0') ?? 'N/A'}:${all.time?.minute.toString().padLeft(2, '0') ?? 'N/A'}',
                                                      style:
                                                          const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                child: Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text('Note: ${all.text.toString()}',
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w500,
                                                        ))),
                                              )
                                            ],
                                          ),
                                        )),
                                  )),
                            );
                          },
                        )),
                      ],
                    ),
                  );
                case Sleep():
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      children: [
                        Center(child: Observer(
                          builder: (context) {
                            return Dismissible(
                              key: Key(all.id!),
                              background: Container(
                                color: sleepIconColor,
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 20.0),
                                child: const Icon(Icons.delete, color: cwhite),
                              ),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                allviewmodel.deleteSleep(all.id!);
                              },
                              child: GestureDetector(
                                  onDoubleTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SleepPageEdit(
                                                id: all.id!,
                                                feelSleep: all.fellSleep!,
                                                wokeUp: all.wokeUp!,
                                                note: all.text!)));
                                  },
                                  child: Container(
                                    width: displayWidth(context) * 0.8878,
                                    height: displayHeight(context) * 0.11,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: annualColor,
                                    ),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(Baby.sleep, size: 30, color: mainIconColor),
                                                  Text('Feel sleep:',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.bold,
                                                          color: mainIconColor)),
                                                ],
                                              ),
                                              Text('${all.fellSleep!.hour}:${all.fellSleep!.minute}',
                                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(left: 30, bottom: 10),
                                                    child: Text('Woke up:',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.bold,
                                                            color: mainIconColor)),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                  '${all.wokeUp?.hour.toString().padLeft(2, '0') ?? 'N/A'}:${all.wokeUp?.minute.toString().padLeft(2, '0') ?? 'N/A'}',
                                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text('Note: ${all.text.toString()}',
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                    ))),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            );
                          },
                        )),
                      ],
                    ),
                  );
                case Symptomps():
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      children: [
                        Center(child: Observer(
                          builder: (context) {
                            return Dismissible(
                              key: Key(all.id!),
                              background: Container(
                                color: sleepIconColor,
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 20.0),
                                child: const Icon(Icons.delete, color: cwhite),
                              ),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                allviewmodel.deleteSymptomps(all.id!);
                              },
                              child: GestureDetector(
                                  onDoubleTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SymptompsPageEdit(
                                            id: all.id!,
                                            symTime: all.symTime!,
                                            sympList: all.sympList!,
                                            note: all.text!,
                                          ),
                                        ));
                                  },
                                  child: Container(
                                    width: displayWidth(context) * 0.8878,
                                    height: displayHeight(context) * 0.11,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: annualColor,
                                    ),
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      const Icon(Baby.symptoms, size: 30, color: mainIconColor),
                                                      ...all.sympList!.asMap().entries.map((entry) {
                                                        int index = entry.key;
                                                        String name = entry.value.name.toString();
                                                        return Text(
                                                            index < all.sympList!.length - 1 ? '$name / ' : name,
                                                            style: const TextStyle(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.bold,
                                                                color: mainIconColor));
                                                      }).toList(),
                                                    ],
                                                  ),
                                                  Text(
                                                      '${all.symTime!.hour.toString().padLeft(2, '0')}:${all.symTime!.minute.toString().padLeft(2, '0')}',
                                                      style:
                                                          const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text('Note: ${all.text.toString()}',
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w500,
                                                        ))),
                                              )
                                            ],
                                          ),
                                        )),
                                  )),
                            );
                          },
                        )),
                      ],
                    ),
                  );
              }

              return const Text('a');
            },
          );
        },
      ),
    );
  }
}
