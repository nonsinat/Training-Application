import 'dart:convert';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:training_application_flutter/video_info.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? info;
  _initData() async {
    // DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
    //   info = json.decode(value);
    // });
    String data = await rootBundle.loadString('json/info.json');
    info = json.decode(data);
    print(info);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await _initData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Training",
                      style: TextStyle(
                        fontSize: 24,
                        color: color.AppColor.homePageSubtitle,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: color.AppColor.homePageIcons,
                          ),
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 20,
                            color: color.AppColor.homePageIcons,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: color.AppColor.homePageIcons,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your program",
                      style: TextStyle(
                        color: color.AppColor.homePageSubtitle,
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Details",
                            style: TextStyle(
                              color: color.AppColor.homePageDetail,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => VideoInfo());
                            },
                            child: Icon(
                              Icons.arrow_forward,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      color: color.AppColor.secondPageTopIconColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          color.AppColor.gradientFirst.withOpacity(0.8),
                          color.AppColor.gradientSecond.withOpacity(0.8),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(10, 10),
                          blurRadius: 20,
                          color: color.AppColor.gradientSecond.withOpacity(0.2),
                        ),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Next workout",
                        style: TextStyle(
                          color: color.AppColor.secondPageTitleColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Legs Toning",
                        style: TextStyle(
                          color: color.AppColor.secondPageTitleColor,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "and Glutes Workout",
                        style: TextStyle(
                          color: color.AppColor.secondPageTitleColor,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  size: 20,
                                  color:
                                      color.AppColor.homePageContainerTextBig,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "60 min",
                                  style: TextStyle(
                                    color: color
                                        .AppColor.homePageContainerTextSmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print("Play videos");
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: color.AppColor.homePageBackground,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(10, 10),
                                    blurRadius: 20,
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(.9),
                                  ),
                                ],
                              ),
                              child: Icon(Icons.play_arrow),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(4, 4),
                              color: Colors.blue.withOpacity(0.2),
                              blurRadius: 3,
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage("assets/card.jpg"),
                          ),
                        ),
                      ),
                      Container(
                        child: Image.asset("assets/figure.png"),
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 100,
                        // color: Colors.redAccent.withOpacity(0.3),
                        margin: EdgeInsets.only(left: 120, top: 40),
                        child: Column(
                          children: [
                            Text(
                              "You are doing great!",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: color.AppColor.homePageDetail,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Area of focus",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: color.AppColor.homePageTitle,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,

                  child: FutureBuilder(
                    future: DefaultAssetBundle.of(context)
                        .loadString('json/info.json'),
                    builder: (conetxt, snapshot) {
                      List? data = json.decode(snapshot.data.toString());

                      if (snapshot.hasError) {
                        return Text("error");
                      }
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          // ignore: division_optimization
                          itemCount: (data!.length.toDouble() / 2).toInt(),
                          itemBuilder: (context, index) {
                            int a = 2 * index; // odd 0 2
                            int b = 2 * index + 1; // even 1 3

                            return Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    print("${data[a]['title']}");
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 170,
                                    margin: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: color.AppColor.homePageBackground,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "${data[a]['img']}",
                                        ),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(1, 5),
                                          color: color.AppColor.gradientSecond
                                              .withOpacity(.1),
                                        )
                                      ],
                                    ),
                                    child: Text(
                                      "${data[a]["title"]}",
                                      style: TextStyle(
                                        color: color.AppColor.homePageTitle,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    print("${data[b]['title']}");
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 170,
                                    margin: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: color.AppColor.homePageBackground,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "${data[b]["img"]}",
                                        ),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(1, 5),
                                          color: color.AppColor.gradientSecond
                                              .withOpacity(.1),
                                        )
                                      ],
                                    ),
                                    child: Text(
                                      "${data[b]["title"]}",
                                      style: TextStyle(
                                        color: color.AppColor.homePageTitle,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),

                  // child: ListView.builder(
                  //   physics: NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   // ignore: division_optimization
                  //   itemCount: (info!.length.toDouble() / 2).toInt(),
                  //   itemBuilder: (context, index) {
                  //     int a = 2 * index; // odd 0 2
                  //     int b = 2 * index + 1; // even 1 3

                  //     return Row(
                  //       children: [
                  //         InkWell(
                  //           onTap: () {
                  //             print("${info![a]['title']}");
                  //           },
                  //           child: Container(
                  //             width: 150,
                  //             height: 170,
                  //             margin: EdgeInsets.all(4),
                  //             decoration: BoxDecoration(
                  //               color: color.AppColor.homePageBackground,
                  //               borderRadius: BorderRadius.circular(15),
                  //               image: DecorationImage(
                  //                 image: AssetImage(
                  //                   "${info![a]['img']}",
                  //                 ),
                  //               ),
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                   offset: Offset(1, 5),
                  //                   color: color.AppColor.gradientSecond
                  //                       .withOpacity(.1),
                  //                 )
                  //               ],
                  //             ),
                  //             child: Text(
                  //               "${info![a]["title"]}",
                  //               style: TextStyle(
                  //                 color: color.AppColor.homePageTitle,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         InkWell(
                  //           onTap: () {
                  //             print("${info![b]['title']}");
                  //           },
                  //           child: Container(
                  //             width: 150,
                  //             height: 170,
                  //             margin: EdgeInsets.all(4),
                  //             decoration: BoxDecoration(
                  //               color: color.AppColor.homePageBackground,
                  //               borderRadius: BorderRadius.circular(15),
                  //               image: DecorationImage(
                  //                 image: AssetImage(
                  //                   "${info![b]["img"]}",
                  //                 ),
                  //               ),
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                   offset: Offset(1, 5),
                  //                   color: color.AppColor.gradientSecond
                  //                       .withOpacity(.1),
                  //                 )
                  //               ],
                  //             ),
                  //             child: Text(
                  //               "${info![b]["title"]}",
                  //               style: TextStyle(
                  //                 color: color.AppColor.homePageTitle,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
