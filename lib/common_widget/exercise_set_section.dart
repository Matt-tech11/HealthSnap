import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';
import 'package:healthsnap/common_widget/exercise_row.dart';

class ExerciseSetSection extends StatelessWidget {
  final Map sObj;
  final void Function(Map eObj)? onPressed;
  const ExerciseSetSection({super.key, required this.sObj, this.onPressed});

  @override
  Widget build(BuildContext context) {
    var exerciseArr = sObj["exercise"] as List? ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          sObj["name"].toString(),
          style: TextStyle(color: TColor.gray, fontSize: 8),
        ),
        const SizedBox(height: 8),

        ListView.builder(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: exerciseArr.length,
          itemBuilder: (context, index) {
            var eObj = exerciseArr[index] as Map? ?? {};
            return ExerciseRow(
              eObj: eObj,
              onPressed: () {
                onPressed?.call(eObj);
              },
            );
          },
        ),
      ],
    );
  }
}
