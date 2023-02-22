import 'package:flutter/material.dart';

class ItemPlanTile extends StatelessWidget {
  const ItemPlanTile({Key? key, required this.title, required this.icon})
      : super(key: key);
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.only(
        bottom: 0,
        top: 0,
      ),
      leading: Icon(icon, color: Colors.green, size: 16),
      title: Text(title),
    );
  }
}