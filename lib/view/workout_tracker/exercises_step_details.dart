import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';
import 'package:healthsnap/common_widget/round_button.dart';
import 'package:healthsnap/common_widget/step_detail.dart';
import 'package:readmore/readmore.dart';

class ExercisesStepDetails extends StatefulWidget {
  final Map eObj;
  const ExercisesStepDetails({super.key, required this.eObj});

  @override
  State<ExercisesStepDetails> createState() => _ExercisesStepDetailsState();
}

class _ExercisesStepDetailsState extends State<ExercisesStepDetails> {
  List stepArr = [
    {
      "no": "01",
      "title": "Spread Your Arms",
      "details":
          "To make the gestures feel more relaxed, stretch your arms as you start this movement. No bending of hands.",
    },
    {
      "no": "02",
      "title": "Rest at The Toe",
      "details":
          "The basis of this movement is jumping. Now, what needs to be considered is that you have to use the tips of your feet",
    },
    {
      "no": "03",
      "title": "Adjust Foot Movement",
      "details":
          "Jumping Jack is not just an ordinary jump. But, you also have to pay close attention to leg movements.",
    },
    {
      "no": "04",
      "title": "Clapping Both Hands",
      "details":
          "This cannot be taken lightly. You see, without realizing it, the clapping of your hands helps you to keep your rhythm while doing the Jumping Jack",
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: TColor.LightGray,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              "assets/img/close.png",
              color: Colors.black,
              width: 15,
              height: 15,
            ),
          ),
        ),

        actions: [
          InkWell(
            onTap: () {
              //Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: TColor.LightGray,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                "assets/img/more_nav.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: media.width,
                    height: media.width * 0.43,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: TColor.primaryG),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      "assets/img/video.png",
                      width: media.width,
                      height: media.width * 0.43,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: media.width,
                    height: media.width * 0.43,
                    decoration: BoxDecoration(
                      color: TColor.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/img/play.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                widget.eObj["title"].toString(),
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Easy | 390 Calories Burn",
                style: TextStyle(color: TColor.gray, fontSize: 12),
              ),
              const SizedBox(height: 15),
              Text(
                "Description",
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              ReadMoreText(
                'A jumping jack, also known as a star jump and referred to as a side-straddle hop in the United States military, is a simple yet effective full-body exercise performed by repeatedly jumping from a standing position with the feet together and arms at the sides to a position where the legs are spread apart and the arms are raised overhead. The movement is then reversed by jumping back to the starting position. This rhythmic exercise engages multiple muscle groups simultaneously, including the legs, arms, shoulders, core, and cardiovascular system, making it a popular choice for warm-ups, aerobic workouts, and general fitness training. Jumping jacks help improve coordination, increase heart rate, enhance endurance, and promote overall physical conditioning without requiring any equipment',
                trimMode: TrimMode.Line,
                trimLines: 4,
                colorClickableText: TColor.black,
                trimCollapsedText: 'Read More',
                trimExpandedText: '...Read Less',
                moreStyle: TextStyle(
                  color: TColor.gray,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "How To Do It",
                    style: TextStyle(
                      color: TColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "${stepArr.length} Steps",
                      style: TextStyle(
                        color: TColor.gray,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: stepArr.length,
                itemBuilder: (context, index) {
                  var sObj = stepArr[index] as Map? ?? {};
                  return StepDetail(sObj: sObj, isLast: stepArr.last == sObj);
                },
              ),

              Text(
                "Custom Repetitions",
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 150,
                child: CupertinoPicker.builder(
                  itemExtent: 40,
                  selectionOverlay: Container(
                    width: double.maxFinite,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: TColor.gray.withOpacity(0.3),
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: TColor.gray.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  onSelectedItemChanged: (index) {},
                  childCount: 60,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/img/burn.png",
                          width: 15,
                          height: 15,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          " ${(index * 1) + 15} Calories Burn",
                          style: TextStyle(color: TColor.gray, fontSize: 10),
                        ),
                        Text(
                          " ${index + 1}",
                          style: TextStyle(
                            color: TColor.gray,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          " times",
                          style: TextStyle(color: TColor.gray, fontSize: 10),
                        ),
                      ],
                    );
                  },
                ),
              ),
              RoundButton(title: "Save", elevation: 0, onPressed: () {}),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
