import 'package:flutter/material.dart';
import 'package:winkl_project/utils/values/icons.dart';
import 'package:winkl_project/utils/values/strings.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final void Function(int) onTap;
  final int currentIndex;

  const MyBottomNavigationBar(
      {Key? key, required this.onTap, required this.currentIndex})
      : super(key: key);

  _bottomNavigationBarItem({required IconData asset, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(asset),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blueGrey[900],
      onTap: onTap,
      currentIndex: currentIndex,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 12,
      items: [
        _bottomNavigationBarItem(
          label: Strings.home,
          asset: AppIcons.home,
        ),
        _bottomNavigationBarItem(
          label: Strings.favorites,
          asset: AppIcons.bookmark,
        ),
      ],
    );
  }
}
