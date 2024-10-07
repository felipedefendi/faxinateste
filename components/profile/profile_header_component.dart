import 'package:flutter/material.dart';

class ProfileHeader extends StatefulWidget {
  final String imagePath;
  final String userName;

  const ProfileHeader({
    super.key,
    required this.imagePath,
    required this.userName,
  });

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(widget.imagePath),
          ),
          const SizedBox(width: 10),
          Text(
            widget.userName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF28A745),
            ),
          ),
        ],
      ),
    );
  }
}
