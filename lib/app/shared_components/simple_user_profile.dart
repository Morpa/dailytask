import 'package:flutter/material.dart';
import 'package:dailytask/app/config/constants/app_constants.dart';
import 'package:dailytask/app/utils/helpers/app_helpers.dart';

class SimpleUserProfile extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const SimpleUserProfile({
    super.key,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _buildAvatar(),
      title: _buildName(),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.more_horiz),
        splashRadius: 20,
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.orange.withOpacity(0.2),
      child: Text(
        name.getInitialName(),
        style: const TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildName() {
    return Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: FontColorPallets.black,
        fontSize: 13,
      ),
    );
  }
}
