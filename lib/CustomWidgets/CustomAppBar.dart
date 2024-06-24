// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final VoidCallback onDrawerPressed;

  const CustomAppBar({
    required this.title,
    required this.actions,
    required this.onDrawerPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: actions,
      leading: IconButton(
        // Agregar IconButton para el Drawer
        icon: Icon(Icons.menu),
        onPressed: onDrawerPressed,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
