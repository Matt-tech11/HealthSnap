import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';

class StepDetail extends StatelessWidget {
  final Map sObj;
  final bool isLast;

  const StepDetail({super.key, required this.sObj, required this.isLast});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: TColor.secondaryColor1.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
              ),
            ),

            if (!isLast)
              DottedDashedLine(
                height: media.width * 0.078,
                width: 0,
                dashColor: TColor.secondaryColor1.withOpacity(0.5),
                axis: Axis.vertical,
              ),
          ],
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sObj["title"].toString(),
                style: TextStyle(color: TColor.black, fontSize: 14),
              ),
              Text(
                sObj["details"].toString(),
                style: TextStyle(color: TColor.gray, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
