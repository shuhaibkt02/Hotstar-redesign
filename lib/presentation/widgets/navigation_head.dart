import 'package:flutter/material.dart';

class NavigationHeader extends StatelessWidget {
  final bool? noPadding;
  final String label;
  final VoidCallback onpress;
  const NavigationHeader({
    super.key,
    required this.label,
    required this.onpress,
    this.noPadding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Padding(
        padding: (noPadding == true)
            ? const EdgeInsets.all(0.0)
            : const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const SizedBox(width: 5),
            Text(
              label,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 20,
              color: Colors.grey.shade400,
            )
          ],
        ),
      ),
    );
  }
}
