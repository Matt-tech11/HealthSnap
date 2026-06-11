import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';

class SettingsRow extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPressed;
  const SettingsRow({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 35,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(icon, height: 15, width: 15, fit: BoxFit.contain),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 12,
                  //fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Image.asset(
              "assets/img/icon_arrow.png",
              height: 15,
              width: 15,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
