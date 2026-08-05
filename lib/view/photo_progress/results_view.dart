import 'package:flutter/material.dart';
import 'package:healthsnap/common/color_extension.dart';

class ResultsView extends StatefulWidget {
  final DateTime date1;
  final DateTime date2;
  const ResultsView({super.key, required this.date1, required this.date2});

  @override
  State<ResultsView> createState() => _ResultsViewState();
}

class _ResultsViewState extends State<ResultsView> {
  int selectButton = 0;
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
            margin: const EdgeInsets.all(12),
            height: 60,
            width: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: TColor.LightGray,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              "assets/img/back_navs.png",
              color: Colors.black,
              width: 13,
              height: 13,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Results",
          style: TextStyle(
            color: TColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          //   InkWell(
          //     onTap: () {
          //       Navigator.pop(context);
          //     },
          //     child: Container(
          //       margin: const EdgeInsets.all(12),
          //       height: 60,
          //       width: 60,
          //       alignment: Alignment.center,
          //       decoration: BoxDecoration(
          //         color: TColor.LightGray,
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       child: Image.asset(
          //         "assets/img/back_navs.png",
          //         color: Colors.black,
          //         width: 13,
          //         height: 13,
          //         fit: BoxFit.contain,
          //       ),
          //     ),
          //   ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.all(12),
              height: 60,
              width: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: TColor.LightGray,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                "assets/img/share.png",
                color: Colors.black,
                width: 13,
                height: 13,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Container(
                height: 55,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: TColor.LightGray,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedContainer(
                      alignment: selectButton == 0
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        width: (media.width * 0.5) - 40,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: TColor.primaryG),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectButton = 0;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: TColor.LightGray,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  "Photo",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: selectButton == 0
                                        ? TColor.white
                                        : TColor.gray,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectButton = 1;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: TColor.LightGray,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  "Statistic",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: selectButton == 1
                                        ? TColor.white
                                        : TColor.gray,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              //Photo tab
              if (selectButton == 0)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),

              //Statistic tab
              if (selectButton == 1)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
