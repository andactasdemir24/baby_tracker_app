import 'package:baby_tracker_app/app/core/hive/model/feeding_model.dart';
import 'package:baby_tracker_app/app/features/screens/feeding/view/feeding_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../../../theme/baby_icons.dart';
import '../viewmodel/calender_viewmodel.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({super.key});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    final calenderViewmodel = locator.get<CalenderViewModel>();
    return Observer(builder: (context) {
      return ListView.builder(
        itemCount: calenderViewmodel.feedingList.length,
        itemBuilder: (context, index) {
          var feeding = calenderViewmodel.feedingList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                Center(child: Observer(
                  builder: (context) {
                    return Dismissible(
                      key: Key(feeding.id!),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20.0),
                        child: const Icon(Icons.delete, color: cwhite),
                      ),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        calenderViewmodel.deleteFeeding(feeding.id!);
                      },
                      child: GestureDetector(
                          onDoubleTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FeedingEdit(
                                      id: feeding.id!,
                                      time: feeding.time!,
                                      amount: feeding.amount!,
                                      note: feeding.text!),
                                ));
                          },
                          onTap: () {
                            calenderViewmodel.toggleSelected(index);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                            width: displayWidth(context) * 0.8878,
                            height: feeding.isSelected ? displayHeight(context) * 0.1 : displayHeight(context) * 0.075,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: annualColor,
                            ),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: !feeding.isSelected ? notpress(feeding) : whenipress(feeding),
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

  Row notpress(Feeding feeding) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Baby.feed, size: 30, color: mainIconColor),
            Text('${feeding.amount} (ml)',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainIconColor)),
          ],
        ),
        Text(
            '${feeding.time?.hour.toString().padLeft(2, '0') ?? 'N/A'}:${feeding.time?.minute.toString().padLeft(2, '0') ?? 'N/A'}',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Padding whenipress(Feeding feeding) {
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
                  const Icon(Baby.feed, size: 30, color: mainIconColor),
                  Text('${feeding.amount} (ml)',
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainIconColor)),
                ],
              ),
              Text(
                  '${feeding.time?.hour.toString().padLeft(2, '0') ?? 'N/A'}:${feeding.time?.minute.toString().padLeft(2, '0') ?? 'N/A'}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Note: ${feeding.text.toString()}',
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
