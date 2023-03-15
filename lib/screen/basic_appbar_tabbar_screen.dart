import 'package:flutter/material.dart';
import 'package:tabbar_theory/const/tabs.dart';

class BasicAppbarTabbarScreen extends StatelessWidget {
  const BasicAppbarTabbarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TABS.length, // Tab의 전체 길이
      child: Scaffold(
        appBar: AppBar(
          title: Text('BasicAppBarScreen'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80), // Appbar의 높이를 설정할 수 있
            child: Row( // PreferredSize가 Widget에 속하기 때문에 Row를 안에 넣어줄 수 있다.
              mainAxisAlignment: MainAxisAlignment.end, // UI를 조금 더 자유롭게 설정해줄 수 있다.
              children: [
                TabBar(
                  indicatorColor: Colors.red, // 탭 하단 색 변경
                  indicatorWeight: 4.0, // 탭 하단 굵기 설정
                  indicatorSize: TabBarIndicatorSize.tab, // 탭 하단 길이 설정, tab(default), label(탭 글자 크기만큼)을 넣을 수 있음,
                  isScrollable: true, // 탭이 스크롤이 가능하도록 함
                  labelColor: Colors.yellow, // 라벨 색 변경(글자색도 변경)
                  unselectedLabelColor: Colors.black, // 선택되지 않은 라벨 색 변경
                  labelStyle: TextStyle( // 폰트 굵기 변경
                    fontWeight: FontWeight.w700,
                  ),
                  unselectedLabelStyle: TextStyle( // 선택되지 않은 아이템의 폰트 굵기 변경
                    fontWeight: FontWeight.w100,
                  ),
                  tabs: TABS
                      .map(
                        (e) => Tab(
                      icon: Icon(e.icon),
                      child: Text(e.label),
                    ),
                  )
                      .toList(),
                ),
              ],
            )
          )
        ),
        body: TabBarView(
          //physics: NeverScrollableScrollPhysics(), // 좌, 우 화면 스크롤을 통해 넘기기 비활성화
          children: TABS
              .map(
                (e) => Center(
                  child: Icon(e.icon),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
