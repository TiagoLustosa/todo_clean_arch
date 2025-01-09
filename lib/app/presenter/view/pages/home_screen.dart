import 'package:flutter/material.dart';
import 'package:todo_list/app/presenter/view/components/custom_bottom_nav_bar.dart';
import 'package:todo_list/app/presenter/view/components/menu_top.dart';
import 'package:todo_list/app/presenter/view/pages/create_todo.dart';
import 'package:todo_list/app/presenter/view/pages/done_todo.dart';
import 'package:todo_list/app/presenter/view/pages/search_todo.dart';
import 'package:todo_list/app/presenter/view/pages/todo_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const TodoView(),
    const CreateTodo(),
    const SearchTodo(),
    const DoneTodo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: MenuTop(),
      ),
      backgroundColor: Colors.white,
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
