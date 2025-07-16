import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onItemTapped});

  final ValueChanged<int> onItemTapped;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState
    extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          currentIndex = index;
          widget.onItemTapped(index);
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
    );
  }
}
