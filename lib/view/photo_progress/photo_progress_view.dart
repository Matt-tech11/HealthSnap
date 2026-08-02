import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';
import 'package:healthsnap/common_widget/round_button.dart';
import 'package:image_picker/image_picker.dart';

class PhotoProgressView extends StatefulWidget {
  const PhotoProgressView({super.key});

  @override
  State<PhotoProgressView> createState() => _PhotoProgressViewState();
}

class _PhotoProgressViewState extends State<PhotoProgressView> {
  List photoArr = [
    {
      "time": "10 August",
      "photo": [
        "assets/img/G_1",
        "assets/img/G_2",
        "assets/img/G_3",
        "assets/img/G_4",
      ],
    },
    {
      "time": "20 August",
      "photo": [
        "assets/img/G_5",
        "assets/img/G_6",
        "assets/img/G_7",
        "assets/img/G_1",
      ],
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
        leadingWidth: 0,
        leading: const SizedBox(),
        title: Text(
          "Progress Photo",
          style: TextStyle(
            color: TColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        // actions: [
        //   InkWell(
        //     onTap: () {},
        //     child: Container(
        //       margin: const EdgeInsets.all(8),
        //       height: 40,
        //       width: 40,
        //       alignment: Alignment.center,
        //       decoration: BoxDecoration(
        //         color: TColor.LightGray,
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       child: Image.asset(
        //         "assets/img/more_nav.png",
        //         width: 13,
        //         height: 13,
        //         fit: BoxFit.contain,
        //       ),
        //     ),
        //   ),
        // ],
      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xffFFE5E5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: TColor.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 60,
                          height: 60,
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/img/reminder.png",
                            width: 30,
                            height: 30,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Reminder!",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Next Photos Fall On July 08",
                                style: TextStyle(
                                  color: TColor.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.close,
                              color: TColor.gray,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(20),
                    height: media.width * 0.4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          TColor.primaryColor2.withOpacity(0.4),
                          TColor.primaryColor1.withOpacity(0.4),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            Text(
                              "Track Your Progress Each\nMonth With Photo",
                              style: TextStyle(
                                color: TColor.black,
                                fontSize: 12,
                                // fontWeight: FontWeight.w700,
                              ),
                            ),
                            //const Spacer(),
                            SizedBox(height: media.width * 0.05),
                            SizedBox(
                              width: 110,
                              height: 35,
                              child: RoundButton(
                                title: "Learn More",
                                fontSize: 12,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        //const Spacer(),
                        Image.asset(
                          "assets/img/progress.png",
                          width: media.width * 0.35,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: media.width * 0.05),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    color: TColor.primaryColor2.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Compare my Photo",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 30,
                        child: RoundButton(
                          title: "Compare",
                          type: RoundButtonType.bgGradient,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         const ActivityTrackerView(),
                            //   ),
                            // );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Gallery",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "see more",
                          style: TextStyle(color: TColor.gray, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: photoArr.length,
                  itemBuilder: ((context, index) {
                    var pObj = photoArr[index] as Map? ?? {};
                    var imaArr = pObj["photo"] as List? ?? [];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            pObj["time"].toString(),
                            style: TextStyle(color: TColor.gray, fontSize: 12),
                          ),
                        ),
                        //const SizedBox(height: 4),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            // physics: NeverScrollableScrollPhysics(),
                            // shrinkWrap: true,
                            itemCount: photoArr.length,
                            itemBuilder: ((context, indexRow) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                width: 100,
                                decoration: BoxDecoration(
                                  color: TColor.LightGray,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    imaArr[indexRow] as String? ?? "",
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
            SizedBox(height: media.width * 0.05),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => AddAlarmView(date: _selectedDateAppBBar),
          //   ),
          // );
        },
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: TColor.secondaryG),
            borderRadius: BorderRadius.circular(27.5),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () async {
              final XFile? image = await ImagePicker().pickImage(
                source: ImageSource.camera,
              );
              if (image != null) {
                setState(() {
                  // store image.path or the XFile wherever you're tracking the progress photo
                });
              }
            },
            child: Icon(
              Icons.photo_camera,
              size: 20,
              color: TColor.secondaryColor1,
            ),
          ),
        ),
      ),
    );
  }
}
