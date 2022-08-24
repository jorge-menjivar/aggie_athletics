import 'package:aggie_athletics/pages/home.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'app_variables.dart';
import 'pages/calendar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  BottomNavState createState() => BottomNavState();
}

class BottomNavState extends State<BottomNav> {
  int _currentPage = 0;
  final _pageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aggie Athletics'),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Home(scaffoldKey: _scaffoldKey),
          Calendar(scaffoldKey: _scaffoldKey),
          // TODO: Rewards(scaffoldKey: _scaffoldKey)
          // TODO: Profile(scaffoldKey: _scaffoldKey)
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentPage,
        showActiveBackgroundColor: true,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: const <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: AppVariables.aggieRecPool,
          ),
          BottomBarItem(
            icon: Icon(Icons.calendar_month),
            title: Text('Calendar'),
            activeColor: AppVariables.aggieGold,
          ),
          BottomBarItem(
            icon: Icon(Icons.emoji_events),
            title: Text('Prizes'),
            activeColor: AppVariables.aggiePoppy,
          ),
          BottomBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            activeColor: AppVariables.aggieTahoe,
          ),
        ],
      ),
    );
  }
}
