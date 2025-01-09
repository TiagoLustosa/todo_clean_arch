import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(0, -2),
            blurRadius: 8,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/todo_icon_bottom.svg',
                colorFilter: ColorFilter.mode(
                  currentIndex == 0 ? Colors.blue : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Todo',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/todo_create_bottom.svg',
                colorFilter: ColorFilter.mode(
                  currentIndex == 1 ? Colors.blue : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Create',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/todo_search_bottom.svg',
                colorFilter: ColorFilter.mode(
                  currentIndex == 2 ? Colors.blue : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/todo_done_bottom.svg',
                colorFilter: ColorFilter.mode(
                  currentIndex == 3 ? Colors.blue : Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Done',
            ),
          ],
        ),
      ),
    );
  }
}
