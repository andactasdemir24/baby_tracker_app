import 'package:baby_tracker_app/app/features/screens/sleep/view/sleep_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../../../../core/hive/model/sleep_model.dart';
import '../../../theme/baby_icons.dart';
import '../viewmodel/calender_viewmodel.dart';

class CustomSleepListView extends StatelessWidget {
  const CustomSleepListView({super.key});

  @override
  Widget build(BuildContext context) {
    final calenderViewmodel = locator.get<CalenderViewModel>();
    return Observer(builder: (context) {
      return ListView.builder(
        itemCount: calenderViewmodel.sleepList.length,
        itemBuilder: (context, index) {
          var sleep = calenderViewmodel.sleepList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                Center(child: Observer(
                  builder: (context) {
                    return Dismissible(
                      key: Key(sleep.id!),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20.0),
                        child: const Icon(Icons.delete, color: cwhite),
                      ),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        calenderViewmodel.deleteSleep(sleep.id!);
                      },
                      child: GestureDetector(
                          onDoubleTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SleepPageEdit(
                                        id: sleep.id!,
                                        feelSleep: sleep.fellSleep!,
                                        wokeUp: sleep.wokeUp!,
                                        note: sleep.text!)));
                          },
                          onTap: () {
                            calenderViewmodel.toggleSelected1(index);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInCirc,
                            width: displayWidth(context) * 0.8878,
                            height: sleep.isSelected ? displayHeight(context) * 0.13 : displayHeight(context) * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: annualColor,
                            ),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: !sleep.isSelected ? notpress(sleep) : whenipress(sleep),
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

  Column notpress(Sleep sleep) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Baby.sleep, size: 30, color: mainIconColor),
                Text('Feel sleep:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainIconColor)),
              ],
            ),
            Text('${sleep.fellSleep!.hour}:${sleep.fellSleep!.minute}',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30, bottom: 10),
              child:
                  Text('Woke up:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainIconColor)),
            ),
            Text(
                '${sleep.wokeUp?.hour.toString().padLeft(2, '0') ?? 'N/A'}:${sleep.wokeUp?.minute.toString().padLeft(2, '0') ?? 'N/A'}',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  SingleChildScrollView whenipress(Sleep sleep) {
    return SingleChildScrollView(
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
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainIconColor)),
                ],
              ),
              Text('${sleep.fellSleep!.hour}:${sleep.fellSleep!.minute}',
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
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainIconColor)),
                  ),
                ],
              ),
              Text(
                  '${sleep.wokeUp?.hour.toString().padLeft(2, '0') ?? 'N/A'}:${sleep.wokeUp?.minute.toString().padLeft(2, '0') ?? 'N/A'}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Note: ${sleep.text.toString()}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ))),
          )
        ],
      ),
    );
  }
}
