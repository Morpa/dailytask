import 'package:flutter/material.dart';
import 'package:dailytask/app/config/constants/app_constants.dart';

class UserProfileData {
  final ImageProvider image;
  final String name;
  final String jobDescription;

  const UserProfileData({
    required this.image,
    required this.name,
    required this.jobDescription,
  });
}

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
    required this.data,
    required this.onPressed,
  });

  final UserProfileData data;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(sBorderRadius),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              _buildImage(),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildName(),
                    _buildJobDescription(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return CircleAvatar(
      radius: 25,
      backgroundImage: data.image,
    );
  }

  Widget _buildName() {
    return Text(
      data.name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: FontColorPallets.black,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildJobDescription() {
    return Text(
      data.jobDescription,
      style: const TextStyle(
        fontWeight: FontWeight.w300,
        color: FontColorPallets.grey,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
