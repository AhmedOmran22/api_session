import 'package:api_session/features/home/presentation/views/home_view.dart';
import 'package:api_session/features/settings/presentation/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key});

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState
    extends State<BottomNavigationBarView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: currentIndex == 0,
        onPopInvokedWithResult: (didPop, result) {
          {
            setState(() {
              currentIndex = 0;
            });
          }
        },
        child: screens[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house, size: 20),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bagShopping, size: 20),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.cartArrowDown, size: 20),
            label: ' cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.gear, size: 20),
            label: 'More',
          ),
        ],
      ),
    );
  }

  List<Widget> screens = [
    const HomeView(),
    const SizedBox(),
    const SizedBox(),
    const SettingsView(),
  ];
}
