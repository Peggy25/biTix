import 'package:bitix/app/home/movie/movie_page.dart';
import 'package:bitix/app/home/ticket/ticket_page.dart';
import 'package:bitix/shared/color.dart';
import 'package:bitix/shared/font_style.dart';
import 'package:bitix/shared/preference_manager.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // bottom navigation
  int isSelectBottomNavBar = 0;
  void selectBottomNavbar(int index) {
    setState(() {
      isSelectBottomNavBar = index;
    });
  }

  // widget selectedPage bottom navbar
  Widget selectPage(int index) {
    switch (index) {
      case 0:
        return const MoviePage();
      case 1:
        return const TicketPage();
    }
    return const MoviePage();
  }

  @override
  void initState() {
    PreferenceManager.savePreferences(1, 'login');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.gray,
      body: selectPage(isSelectBottomNavBar),
      // create bottom navbar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorApp.darkColor,
        unselectedItemColor: ColorApp.gray,
        showUnselectedLabels: true,
        currentIndex: isSelectBottomNavBar,
        onTap: selectBottomNavbar,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: ColorApp.darkColor,
            ),
            title: Text(
              'Home',
              style: fontStyle,
            ),
            icon: const Icon(
              Icons.home,
              color: Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              'Tiket',
              style: fontStyle,
            ),
            activeIcon: Icon(
              Icons.movie_outlined,
              color: ColorApp.darkColor,
            ),
            icon: const Icon(
              Icons.movie_outlined,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
