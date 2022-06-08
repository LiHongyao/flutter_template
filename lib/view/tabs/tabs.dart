import 'package:flutter/material.dart';
import 'package:flutter_template/generated/assets.dart';
import 'package:flutter_template/view/bookcase/bookcase_page.dart';
import 'package:flutter_template/view/home/home_page.dart';
import 'package:flutter_template/view/mine/mine_page.dart';
import 'package:flutter_template/view/ranking/ranking_page.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  /// properties
  int curIndex = 0;
  final List<Widget> _tabPages = const [Home(), Ranking(), Bookcase(), Mine()];

  @override
  initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // -- 获取路由参数
    var args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    curIndex = args?.isNotEmpty == true ? args!['index'] as int : 0;
  }

  /// methods
  _getBottomNavItem(String label, String icon, String selectedIcon, int index) {
    return BottomNavigationBarItem(
      icon: curIndex == index
          ? Image.asset(selectedIcon, width: 24)
          : Image.asset(icon, width: 24),
      label: label,
    );
  }

  /// events
  void _onBottomNavigationBarTapped(int index) {
    setState(() {
      curIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: curIndex,
        children: _tabPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: curIndex,
        selectedFontSize: 12,
        selectedItemColor: Colors.black,
        unselectedFontSize: 12,
        onTap: _onBottomNavigationBarTapped,
        items: [
          _getBottomNavItem(
              "首页", Assets.imagesNavbarIcon1, Assets.imagesNavbarIcon1Sel, 0),
          _getBottomNavItem(
              "排行", Assets.imagesNavbarIcon2, Assets.imagesNavbarIcon2Sel, 1),
          _getBottomNavItem(
              "书架", Assets.imagesNavbarIcon3, Assets.imagesNavbarIcon3Sel, 2),
          _getBottomNavItem(
              "我的", Assets.imagesNavbarIcon4, Assets.imagesNavbarIcon4Sel, 3),
        ],
      ),
    );
  }
}
