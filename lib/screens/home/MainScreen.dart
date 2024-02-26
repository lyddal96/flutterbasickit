import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kit/screens/beautiful/BeautifulScreen.dart';
import 'package:kit/screens/home/BaseScreen.dart';
import 'package:kit/screens/home/MenuScreen.dart';
import 'package:kit/utils/ColorUtils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// ==========================================================================
  /// Variables
  /// ==========================================================================

  int _selectedIndex = 0;
  PageController _pageController = PageController();
  final List<Widget> _screens = <Widget>[
    MenuScreen(),
    BeautifulScreen(),
    Container(color: ColorUtils.FF333333),
    BaseScreen(),
    Container(color: ColorLight.warning),
  ];

  /// ==========================================================================
  /// Functions
  /// ==========================================================================
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // _pageController.animateToPage(index,
      //     duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }

  /// ==========================================================================
  /// override
  /// ==========================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      // PageView(
      //   controller: _pageController,
      //   onPageChanged: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      //   children: _screens,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_tree_outlined), label: "기본 UI"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_chart_outlined), label: "화려한 UI"),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "API"),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: "기본"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "마이페이지"),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: ColorUtils.FF999999,
        selectedItemColor: ColorLight.info,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
