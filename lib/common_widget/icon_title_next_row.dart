import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';

class IconTitleNextRow extends StatelessWidget {
  final String title;
  final String icon;
  final String time;
  final VoidCallback? onPressed;
  final Color color;
  const IconTitleNextRow({
    super.key,
    required this.title,
    required this.icon,
    required this.time,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 25,
              height: 25,
              alignment: Alignment.center,
              child: Image.asset(
                icon,
                width: 12,
                height: 12,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: TextStyle(color: TColor.gray, fontSize: 12),
              ),
            ),
            SizedBox(
              width: 120,
              child: Text(
                time,
                textAlign: TextAlign.right,
                style: TextStyle(color: TColor.gray, fontSize: 12),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 25,
              height: 25,
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 25,
                  height: 25,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/img/arrow_right.png",
                    width: 12,
                    height: 12,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
