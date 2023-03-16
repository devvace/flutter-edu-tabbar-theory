import 'package:flutter/material.dart';
import 'package:tabbar_theory/const/tabs.dart';

class AppBarUsingController extends StatefulWidget {
  const AppBarUsingController({Key? key}) : super(key: key);

  @override
  State<AppBarUsingController> createState() => _AppBarUsingControllerState();
}

class _AppBarUsingControllerState extends State<AppBarUsingController>
    with TickerProviderStateMixin {
  // TickerProviderStateMixin: 1 Frame 당 효율적으로 Controller를 사용할 수 있도록 해준다.
  late final TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: TABS.length,
      vsync: this,
    );

    tabController.addListener(() {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar Using Controller'),
        bottom: TabBar(
          controller: tabController,
          tabs: TABS
              .map((e) => Tab(
                    icon: Icon(e.icon),
                    child: Text(e.label),
                  ))
              .toList(),
        ),
      ),
      body: TabBarView(
          controller: tabController,
          children: TABS
              .map(
                (e) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      e.icon,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if(tabController.index != 0)
                        ElevatedButton(
                            onPressed: () {
                              tabController.animateTo(
                                tabController.index - 1,
                              );
                            },
                            child: Text('이전')),
                        const SizedBox(
                          width: 16.0,
                        ),
                        if(tabController.index != TABS.length - 1)
                        ElevatedButton(onPressed: () {
                          tabController.animateTo(
                            tabController.index + 1,
                          );
                        }, child: Text('다음')),
                      ],
                    ),
                  ],
                ),
              )
              .toList()),
    );
  }
}
