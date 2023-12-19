import 'package:baby_tracker_app/app/core/components/custom_widgets/custom_appbar.dart';
import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import 'package:baby_tracker_app/app/core/constants/text_constants.dart';
import 'package:baby_tracker_app/app/features/screens/calender/viewmodel/calender_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/getIt/locator.dart';
import '../../../theme/baby_icons.dart';
import '../widgets/custom_datebutton.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final calenderViewmodel = locator.get<CalenderViewModel>();
    return Scaffold(
      appBar: const CustomAppbar(appbarText: calenderAppbar),
      body: Observer(builder: (context) {
        return Column(
          children: [
            DateButton(calenderViewmodel: calenderViewmodel),
            TabBar(
              controller: _tabController,
              dividerColor: cwhite,
              indicatorColor: buttonColor,
              labelColor: buttonColor,
              tabs: const <Widget>[
                Tab(
                  child: Text('All', style: TextStyle(fontSize: 20)),
                ),
                Tab(
                  icon: Icon(Baby.feed, size: 45),
                ),
                Tab(
                  icon: Icon(Baby.sleep, size: 45),
                ),
                Tab(
                  icon: Icon(Baby.symptoms, size: 45),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const <Widget>[
                  Center(
                    child: Text("It's cloudy here"),
                  ),
                  Center(
                    child: Text("It's cloudy here"),
                  ),
                  Center(
                    child: Text("It's rainy here"),
                  ),
                  Center(
                    child: Text("It's sunny here"),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
