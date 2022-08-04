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
  var _appBarText = 'HackDavis 2022';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Calendar(scaffoldKey: _scaffoldKey),
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
        items: <BottomBarItem>[
          BottomBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: AppVariables.aggieRecPool),
          BottomBarItem(
            icon: Icon(Icons.calendar_month_sharp),
            title: Text('Calendar'),
            activeColor: AppVariables.aggieGold,
          ),
          BottomBarItem(
            icon: Icon(Icons.check),
            title: Text('Check In'),
            activeColor: AppVariables.aggieArboretum,
          ),
          BottomBarItem(
            icon: Icon(Icons.card_giftcard_rounded),
            title: Text('Prizes'),
            activeColor: AppVariables.aggiePoppy,
          ),
          BottomBarItem(
            icon: Icon(Icons.person_outline),
            title: Text('Profile'),
            activeColor: AppVariables.aggieTahoe,
          ),
        ],
      ),
    );
  }
}
