import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';
import 'package:healthsnap/common_widget/round_button.dart';

class PhotoProgressView extends StatefulWidget {
  const PhotoProgressView({super.key});

  @override
  State<PhotoProgressView> createState() => _PhotoProgressViewState();
}

class _PhotoProgressViewState extends State<PhotoProgressView> {
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Text(
                    "Your Schedule",
                    style: TextStyle(
                      color: TColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
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
          child: Icon(Icons.add, size: 20, color: TColor.white),
        ),
      ),
    );
  }
}
