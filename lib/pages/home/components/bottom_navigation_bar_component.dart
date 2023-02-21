import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNavigationBarComponent extends StatefulWidget {
  BottomNavigationBarComponent({Key? key, required this.currentIndex})
      : super(key: key);
  int currentIndex = 0;
  @override
  State<BottomNavigationBarComponent> createState() =>
      _BottomNavigationBarComponentState();
}

class _BottomNavigationBarComponentState
    extends State<BottomNavigationBarComponent> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.groups_outlined),
          label: 'Comunidade',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.chat_outlined,
          ),
          label: 'Chat',
        ),
      ],
      onTap: (value) {
        setState(() {
          widget.currentIndex = value;
        });
      },
    );
  }
}
