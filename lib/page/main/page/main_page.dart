import 'package:flutter/material.dart';
import 'package:simcodeapp/const/color/colors.dart';
import 'package:simcodeapp/page/home/page/home_page.dart';
import 'package:simcodeapp/page/profil/page/profil_page.dart';
import 'package:simcodeapp/page/search/page/search_page.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _pageController;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: _listOfWidget,
            ),
          ),
        ],
      ),
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: dfOnBackgroundColor,
        onButtonPressed: onButtonPressed,
        iconSize: 30,
        activeColor: dfColor,
        selectedIndex: selectedIndex,
        barItems: <BarItem>[
          BarItem(
            icon: Icons.event,
            title: 'Anasayfa',
          ),
          BarItem(
            icon: Icons.search_rounded,
            title: 'Ara',
          ),
          BarItem(
            icon: Icons.tune_rounded,
            title: 'Ayarlar',
          ),
        ],
      ),
    );
  }
}

List<Widget> _listOfWidget = <Widget>[
  const HomePage(),
  const SearchPage(),
  const ProfilPage()
];
