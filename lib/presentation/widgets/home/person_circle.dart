import 'package:flutter/material.dart';

class PersonAvatar extends StatelessWidget {
  final String user;
  final bool? noName;
  final String? userImage;
  final double? radius;
  final VoidCallback? onpress;
  const PersonAvatar({
    super.key,
    required this.user,
    this.userImage,
    this.radius,
    this.onpress,
    this.noName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress ?? () async {},
      child: Column(
        children: [
          CircleAvatar(
            radius: radius ?? 25,
            backgroundImage: AssetImage(userImage ?? ''),
          ),
          const SizedBox(height: 5),
          (noName == true)
              ? const SizedBox()
              : Text(
                  user,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
        ],
      ),
    );
  }
}
