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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                Center(
                  child: GestureDetector(onTap: () {
                    calenderViewmodel.isSelected = !calenderViewmodel.isSelected;
                  }, child: Observer(builder: (context) {
                    return AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      width: displayWidth(context) * 0.8878,
                      height:
                          calenderViewmodel.isSelected ? displayHeight(context) * 0.1 : displayHeight(context) * 0.075,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: annualColor,
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: !calenderViewmodel.isSelected
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(Baby.feed, size: 30),
                                        Text('${calenderViewmodel.feedingList[index].amount.toString()} (ml)',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            )),
                                      ],
                                    ),
                                    Text(
                                        '${calenderViewmodel.feedingList[index].time?.hour.toString().padLeft(2, '0') ?? 'N/A'}:${calenderViewmodel.feedingList[index].time?.minute.toString().padLeft(2, '0') ?? 'N/A'}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ],
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(Baby.feed, size: 30),
                                              Text('${calenderViewmodel.feedingList[index].amount.toString()} (ml)',
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                            ],
                                          ),
                                          Text(
                                              '${calenderViewmodel.feedingList[index].time?.hour.toString().padLeft(2, '0') ?? 'N/A'}:${calenderViewmodel.feedingList[index].time?.minute.toString().padLeft(2, '0') ?? 'N/A'}',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              )),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text('Note: ${calenderViewmodel.feedingList[index].text.toString()}',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ))),
                                      )
                                    ],
                                  ),
                                )),
                    );
                  })),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
