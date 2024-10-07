import 'package:flutter/material.dart';

class BuildMenuItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const BuildMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  State<BuildMenuItem> createState() => _BuildMenuItemState();
}

class _BuildMenuItemState extends State<BuildMenuItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Icon(widget.icon, color: const Color.fromARGB(255, 85, 85, 85)),
          const SizedBox(width: 5),
          Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 85, 85, 85),
            ),
          ),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: widget.onTap,
    );
  }
}
