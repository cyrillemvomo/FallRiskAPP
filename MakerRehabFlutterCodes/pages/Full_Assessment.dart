import 'dart:async';
import 'dart:collection';
import 'package:http/http.dart';
// import 'dart:ffi';
// import 'dart:ffi';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
// import 'package:restart_app/restart_app.dart';
import '../data.dart';
import 'package:sensors_plus/sensors_plus.dart';
// import 'dart:io';
import 'package:fl_chart/fl_chart.dart';
// import 'package:csv/csv.dart';
import '/main.dart';
import '/home.dart';

class Page {
  Page(String route) {
    final endPoint = route.split('/').last;
    name = endPoint;
    this.endPoint = endPoint;
  }

  late String name;
  late String endPoint;
}

class PageCard extends StatelessWidget {
  const PageCard({
    required Key key,
    required this.package,
    required this.onPressed,
  }) : super(key: key);

  final Page package;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle = theme.textTheme.headline6!;
    final TextStyle descriptionStyle = theme.textTheme.bodyText2!;

    return Container(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
          onTap: () {
            onPressed(package.endPoint);
          },
          child: Card(
              child: DefaultTextStyle(
            maxLines: 3,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: descriptionStyle,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                    child: Text(
                      package.name,
                      style: titleStyle,
                    ),
                  ),
                ],
              ),
            ),
          )),
        ));
  }
}

class FullAssessmentPage extends StatelessWidget {
  FullAssessmentPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: grey,
        title: const Text('Full Assessment Mode - Instructions',
            style: TextStyle(color: black, fontFamily: 'Fancy', fontSize: 45)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
                  child: const Text("Assessment Pipeline",
                      style: TextStyle(fontFamily: 'Fancy', fontSize: 35))),
              Row(
                  //steps images
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(children: <Widget>[
                      SizedBox(
                          width: 130,
                          child: Image.asset(
                            'assets/images/General_info.png',
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                          child: const Text('General Information',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 30)))
                    ]),
                    SizedBox(
                        width: 150,
                        child: Image.asset(
                          'assets/images/arrow.png',
                          fit: BoxFit.cover,
                        )),
                    Column(children: <Widget>[
                      SizedBox(
                          width: 200,
                          child: Image.asset(
                            'assets/images/clinical_test_Quest.png',
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                          child: const Text('Clinical Tests & Questionnaires',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 30)))
                    ]),
                    SizedBox(
                        width: 150,
                        child: Image.asset(
                          'assets/images/arrow.png',
                          fit: BoxFit.cover,
                        )),
                    Column(children: <Widget>[
                      SizedBox(
                          width: 70,
                          child: Image.asset(
                            'assets/images/Standing_Test.png',
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                          child: const Text('MakerRehab© Balance Test',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 30)))
                    ]),
                    // SizedBox(
                    //     width: 150,
                    //     child: Image.asset(
                    //       'assets/images/arrow.png',
                    //       fit: BoxFit.cover,
                    //     )),
                    // Column(children: <Widget>[
                    //   SizedBox(
                    //       width: 80,
                    //       child: Image.asset(
                    //         'assets/images/Walking_test.png',
                    //         fit: BoxFit.cover,
                    //       )),
                    //   SizedBox(
                    //       child: const Text('Walking Test',
                    //           style: TextStyle(
                    //               color: black,
                    //               fontFamily: 'Fancy',
                    //               fontSize: 30)))
                    // ]),
                  ]),
              Row(
                  //steps images
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 180,
                        height: 300,
                        padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
                        child: Image.asset(
                          'assets/images/New_arrow.png',
                          fit: BoxFit.cover,
                        )),
                  ]),
              Row(
                  //steps images
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(children: <Widget>[
                      // Container(
                      //   width: 180,
                      //   height: 300,
                      //   padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
                      // ),
                      SizedBox(
                          height: 800,
                          width: 400,
                          child: Image.asset(
                            'assets/images/Empty_Report.png',
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                          child: const Text('Clinical Report',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 30)))
                    ]),
                  ]),
              // Container(
              //   padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
              //   child: const Text(
              //     'Instruction (10 Features including general info (7) + clinical test and questionnaires (3) + MakerRehab© Balance Test (with 9 additional features): Age	Height	Weight	BMI	Falls12m	Best_T	FES_T	AgeGroup(0=young|1=old)	Gender(0=F|1=M)	IPAQ_S	FES_S)',
              //     style: TextStyle(fontSize: 20),
              //   ),
              // ),
              Container(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.circular(36),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Start Full Assessement',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            // builder: (context) => const SecondRouteC()),
                            builder: (context) => const TenthRoute()),
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

////
//FUNCTIONS
// String store_info_data() {
//   while (general_info.length <= 7) {
//     if (general_info.length > 7) {
//       break;
//     }
//     general_info.add(1);
//   }
//   return "$general_info";
// }
/////////////////////
///
///
///
class SecondRouteC extends StatelessWidget {
  //STILL SECOND ROUTE
  const SecondRouteC({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'INFORMED CONSENT',
      home: const SubSecondPageC(),
    );
  }
}

class SubSecondPageC extends StatefulWidget {
  //STILL SECOND ROUTE
  const SubSecondPageC({Key? key}) : super(key: key);

  @override
  _SubSecondPageStateC createState() => _SubSecondPageStateC();
}

class _SubSecondPageStateC extends State<SubSecondPageC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, //remove back button
          backgroundColor: grey,
          title: const Text('INFORMED CONSENT',
              style:
                  TextStyle(color: black, fontFamily: 'Fancy', fontSize: 45)),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
          Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
              child: Row(
                  //steps images
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(children: <Widget>[
                      SizedBox(
                          // width: 100,
                          child: Image.asset(
                        'assets/images/IF_Consent_Maker_Rehab.png',
                        fit: BoxFit.cover,
                      ))
                    ])
                  ])),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  '"I Agree" - Next',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      // forcer a remplir
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                    },
                  )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  '"I Disagree" - Quit',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      general_info[0].clear(); //CLEAR EVERYTHING IF EXIT
                      general_info[1].clear();
                      general_info[2].clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuRoute()),
                      );
                    },
                  ))
        ]))));
  }
}

/////////////////////////////
class SecondRoute extends StatelessWidget {
  //STILL SECOND ROUTE
  const SecondRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Full Assessment Mode - (1/4)',
      home: const SubSecondPage(),
    );
  }
}

class SubSecondPage extends StatefulWidget {
  //STILL SECOND ROUTE
  const SubSecondPage({Key? key}) : super(key: key);

  @override
  _SubSecondPageState createState() => _SubSecondPageState();
}

class _SubSecondPageState extends State<SubSecondPage> {
  //STILL SECOND ROUTE
  // this will be displayed on the screen
  String? _first_name;
  String? _last_name;
  // String? _gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, //remove back button
          backgroundColor: grey,
          title: const Text('Full Assessment Mode - (1/4)',
              style:
                  TextStyle(color: black, fontFamily: 'Fancy', fontSize: 45)),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
          Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
              child: Row(
                  //steps images
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(children: <Widget>[
                      SizedBox(
                          width: 100,
                          child: Image.asset(
                            'assets/images/General_info.png',
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                          child: const Text('General Information (1/3)',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 35)))
                    ])
                  ])),
          Row(
              //steps images
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(children: <Widget>[
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text('First Name',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                    width: 300,
                    child: TextField(
                      onChanged: (value1) => setState(() {
                        _first_name = value1;
                      }),
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text('Last Name',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      width: 300,
                      child: TextField(
                        onChanged: (value2) => setState(() {
                          _last_name = value2;
                          // general_info[1].add(_last_name);
                        }),
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      )),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text('Gender at birth',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/Male_symbol.png',
                                    fit: BoxFit.cover,
                                  )),
                              onPressed: () => setState(
                                    () {
                                      general_info[2].clear();
                                      general_info[2].add(1.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states2) {
                                    if ((states2
                                            .contains(MaterialState.pressed) ==
                                        true)) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/Female_symbol.png',
                                    fit: BoxFit.cover,
                                  )),
                              onPressed: () => setState(
                                    () {
                                      general_info[2].clear();
                                      general_info[2].add(0.0);
                                    },
                                  ))
                        ],
                      )),
                  // Container(
                  //     //JUST TO CHECK
                  //     padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                  //     child: Text(general_info[0].toString(),
                  //         style: TextStyle(
                  //             color: black, fontFamily: 'Fancy', fontSize: 30)))
                ])
              ]),
          // Container(
          //   padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
          //   child: const Text(
          //     'Age	Height	Weight	BMI	Falls12m	AgeGroup(0=young|1=old)	Gender(0=F|1=M)',
          //     style: TextStyle(fontSize: 20),
          //   ),
          // ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Next',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      general_info[0].clear();
                      general_info[0].add(_first_name!);
                      general_info[1].clear();
                      general_info[1].add(_last_name!); // forcer a remplir
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRouteBis()),
                      );
                    },
                  )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Quit',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      general_info[0].clear(); //CLEAR EVERYTHING IF EXIT
                      general_info[1].clear();
                      general_info[2].clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuRoute()),
                      );
                    },
                  ))
        ]))));
  }
}

////
//FUNCTIONS
// double Get_BMI(height, weight) {
//   var height;
//   var weight;
//   var BMI = (double.parse(weight!) /
//       ((double.parse(height!) / 100) * (double.parse(height!) / 100)));
//   return BMI;
// }

class SecondRouteBis extends StatelessWidget {
  //STILL SECOND ROUTE
  const SecondRouteBis({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Full Assessment Mode - (1/4)',
      home: const SubSecondPageBis(),
    );
  }
}

class SubSecondPageBis extends StatefulWidget {
  //STILL SECOND ROUTE
  const SubSecondPageBis({Key? key}) : super(key: key);

  @override
  _SubSecondPageStateBis createState() => _SubSecondPageStateBis();
}

//
class _SubSecondPageStateBis extends State<SubSecondPageBis> {
  //STILL SECOND ROUTE
  // this will be displayed on the screen
  String? _age;
  String? _height;
  String? _weight;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, //remove back button
          backgroundColor: grey,
          title: const Text('Full Assessment Mode - (1/4)',
              style:
                  TextStyle(color: black, fontFamily: 'Fancy', fontSize: 45)),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
          Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
              child: Row(
                  //steps images
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(children: <Widget>[
                      SizedBox(
                          width: 100,
                          child: Image.asset(
                            'assets/images/General_info.png',
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                          child: const Text('General Information (2/3)',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 35)))
                    ])
                  ])),
          Row(
              //steps images
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(children: <Widget>[
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text('Age (rounded year)',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                    width: 300,
                    child: TextField(
                      onChanged: (value3) => setState(() {
                        _age = value3;
                      }),
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text('Height (rounded cm)',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      width: 300,
                      child: TextField(
                        onChanged: (value4) => setState(() {
                          _height = value4;
                        }),
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      )),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text('Weight (rounded kg)',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                    width: 300,
                    child: TextField(
                      onChanged: (value5) => setState(() {
                        _weight = value5;
                      }),
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  // Container(
                  //     //JUST TO CHECK
                  //     padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                  //     child: Text(general_info[7].toString(),
                  //         style: TextStyle(
                  //             color: black, fontFamily: 'Fancy', fontSize: 30)))
                ])
              ]),
          // Container(
          //   padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
          //   child: const Text(
          //     'Age	Height	Weight	BMI	Falls12m	AgeGroup(0=young|1=old)	Gender(0=F|1=M)',
          //     style: TextStyle(fontSize: 20),
          //   ),
          // ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Next',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      general_info[3].clear();
                      general_info[3].add(double.parse(_age!));
                      general_info[4].clear();
                      general_info[4].add(double.parse(_height!));
                      general_info[5].clear();
                      general_info[5].add(double.parse(_weight!));
                      general_info[6].clear();
                      general_info[6].add((double.parse(_weight!) /
                          ((double.parse(_height!) / 100) *
                              (double.parse(_height!) / 100))));

                      if (double.parse(_age!) >= 60) {
                        general_info[7].clear();
                        general_info[7].add(1.0);
                      } else {
                        general_info[7].clear();
                        general_info[7].add(0.0);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRouteBis2()),
                      );
                    },
                  )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Quit',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      general_info[0].clear(); //CLEAR EVERYTHING IF EXIT
                      general_info[1].clear();
                      general_info[2].clear();
                      general_info[3].clear();
                      general_info[4].clear();
                      general_info[5].clear();
                      general_info[6].clear();
                      general_info[7].clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuRoute()),
                      );
                    },
                  ))
        ]))));
  }
}

class SecondRouteBis2 extends StatelessWidget {
  //STILL SECOND ROUTE
  const SecondRouteBis2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Full Assessment Mode - (1/4)',
      home: const SubSecondPageBis2(),
    );
  }
}

class SubSecondPageBis2 extends StatefulWidget {
  //STILL SECOND ROUTE
  const SubSecondPageBis2({Key? key}) : super(key: key);

  @override
  _SubSecondPageStateBis2 createState() => _SubSecondPageStateBis2();
}

//
class _SubSecondPageStateBis2 extends State<SubSecondPageBis2> {
  //STILL SECOND ROUTE
  // this will be displayed on the screen
  String? Falls_12m;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, //remove back button
          backgroundColor: grey,
          title: const Text('Full Assessment Mode - (1/4)',
              style:
                  TextStyle(color: black, fontFamily: 'Fancy', fontSize: 45)),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
          Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
              child: Row(
                  //steps images
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(children: <Widget>[
                      SizedBox(
                          width: 100,
                          child: Image.asset(
                            'assets/images/General_info.png',
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                          child: const Text('General Information (3/3)',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 35)))
                    ])
                  ])),
          Row(
              //steps images
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(children: <Widget>[
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text(
                          'Number of accidental falls (i.e. not related to a sport or exceptional activity) in the last 12 months ',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                    width: 300,
                    child: TextField(
                      onChanged: (value8) => setState(() {
                        Falls_12m = value8;
                      }),
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  // Container(
                  //     //JUST TO CHECK
                  //     padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                  //     child: Text(general_info[7].toString(),
                  //         style: TextStyle(
                  //             color: black, fontFamily: 'Fancy', fontSize: 30)))
                ])
              ]),
          // Container(
          //   padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
          //   child: const Text(
          //     'Age	Height	Weight	BMI	Falls12m	AgeGroup(0=young|1=old)	Gender(0=F|1=M)',
          //     style: TextStyle(fontSize: 20),
          //   ),
          // ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Next',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      general_info[8].clear();
                      general_info[8].add(double.parse(Falls_12m!));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThirdRoute()),
                      );
                    },
                  )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Quit',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      general_info[0].clear(); //CLEAR EVERYTHING IF EXIT
                      general_info[1].clear();
                      general_info[2].clear();
                      general_info[3].clear();
                      general_info[4].clear();
                      general_info[5].clear();
                      general_info[6].clear();
                      general_info[7].clear();
                      general_info[8].clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuRoute()),
                      );
                    },
                  ))
        ]))));
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///
///
///
///
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///

class ThirdRoute extends StatelessWidget {
  //STILL SECOND ROUTE
  const ThirdRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Full Assessment Mode - (2/4)',
      home: const SubThirdPage(),
    );
  }
}

class SubThirdPage extends StatefulWidget {
  //STILL SECOND ROUTE
  const SubThirdPage({Key? key}) : super(key: key);

  @override
  _SubThirdPageState createState() => _SubThirdPageState();
}

//
class _SubThirdPageState extends State<SubThirdPage> {
  //STILL SECOND ROUTE
  // this will be displayed on the screen
  String? _ipaq1;
  String? _ipaq2;
  String? _ipaq3;
  String? _ipaq4;
  String? _ipaq5;
  String? _ipaq6;
  String? _ipaq7;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, //remove back button
          backgroundColor: grey,
          title: const Text('Full Assessment Mode - (2/4)',
              style:
                  TextStyle(color: black, fontFamily: 'Fancy', fontSize: 45)),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
          Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
              child: Row(
                  //steps images
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(children: <Widget>[
                      SizedBox(
                          width: 125,
                          child: Image.asset(
                            'assets/images/clinical_test_Quest.png',
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                          child: const Text(
                              'Clinical Tests & Questionnaires (1/3) - Short IPAQ',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 35)))
                    ])
                  ])),
          Row(
              //steps images
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(children: <Widget>[
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text(
                          'Number of days during which vigorous physical activity was performed in the last 7 days (rounded days)',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                    width: 300,
                    child: TextField(
                      onChanged: (value9) => setState(() {
                        _ipaq1 = value9;
                      }),
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text(
                          'Time usually spent doing vigorous physical activity on any of these 7 days (rounded minutes)',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                    width: 300,
                    child: TextField(
                      onChanged: (value10) => setState(() {
                        _ipaq2 = value10;
                      }),
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text(
                          'Number of days during which moderate physical activity was performed in the last 7 days (rounded days)',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                    width: 300,
                    child: TextField(
                      onChanged: (value11) => setState(() {
                        _ipaq3 = value11;
                      }),
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text(
                          'Time usually spent doing moderate physical activity on any of these 7 days (rounded minutes)',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                    width: 300,
                    child: TextField(
                      onChanged: (value12) => setState(() {
                        _ipaq4 = value12;
                      }),
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text(
                          'Number of days during which a walk of at least 10 minutes was performed in the last 7 days (rounded days)',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                    width: 300,
                    child: TextField(
                      onChanged: (value13) => setState(() {
                        _ipaq5 = value13;
                      }),
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text(
                          'Time usually spent walking on any of these 7 days (rounded minutes)',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                    width: 300,
                    child: TextField(
                      onChanged: (value14) => setState(() {
                        _ipaq6 = value14;
                      }),
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text(
                          'Time usually spent sitting on a week day during the last 7 days (rounded hours)',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                    width: 300,
                    child: TextField(
                      onChanged: (value15) => setState(() {
                        _ipaq7 = value15;
                      }),
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  // Container(
                  //     //JUST TO CHECK
                  //     padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                  //     child: Text(general_info[7].toString(),
                  //         style: TextStyle(
                  //             color: black, fontFamily: 'Fancy', fontSize: 30)))
                ])
              ]),
          // Container(
          //   padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
          //   child: const Text(
          //     'Age	Height	Weight	BMI	Falls12m	AgeGroup(0=young|1=old)	Gender(0=F|1=M)',
          //     style: TextStyle(fontSize: 20),
          //   ),
          // ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Help', //TO ADD LINK
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      // clinical_quest[0].clear(); //CLEAR EVERYTHING IF EXIT
                      // clinical_quest[1].clear();
                      // clinical_quest[2].clear();
                      // clinical_quest[3].clear();
                      // clinical_quest[4].clear();
                      // clinical_quest[5].clear();
                      // clinical_quest[6].clear();
                      // clinical_quest[7].clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuRoute()),
                      );
                    },
                  )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Next',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      clinical_quest[0].clear();
                      clinical_quest[0].add(double.parse(_ipaq1!));
                      clinical_quest[1].clear();
                      clinical_quest[1].add(double.parse(_ipaq2!));
                      clinical_quest[2].clear();
                      clinical_quest[2].add(double.parse(_ipaq3!));
                      clinical_quest[3].clear();
                      clinical_quest[3].add(double.parse(_ipaq4!));
                      clinical_quest[4].clear();
                      clinical_quest[4].add(double.parse(_ipaq5!));
                      clinical_quest[5].clear();
                      clinical_quest[5].add(double.parse(_ipaq6!));
                      clinical_quest[6].clear();
                      clinical_quest[6].add(double.parse(_ipaq7!));

                      if (((double.parse(_ipaq1!) >= 3) && // CONDITION 1
                              (double.parse(_ipaq1!) * double.parse(_ipaq2!) >=
                                  1500)) |
                          ////////////////////////// OR CONDITION 2
                          ((((double.parse(_ipaq2!) +
                                          double.parse(_ipaq4!) +
                                          double.parse(_ipaq6!) >=
                                      3000)) |

                                  ///
                                  ((double.parse(_ipaq2!) +
                                          double.parse(_ipaq4!) >=
                                      3000)) |

                                  ///
                                  ((double.parse(_ipaq2!) +
                                          double.parse(_ipaq6!) >=
                                      3000)) |

                                  ///
                                  ((double.parse(_ipaq4!) +
                                          double.parse(_ipaq6!) >=
                                      3000))) &&

                              ////BIg and statement for the third condition AND
                              (((double.parse(_ipaq1!) +
                                          double.parse(_ipaq3!) +
                                          double.parse(_ipaq5!) >=
                                      7)) |

                                  ///
                                  ((double.parse(_ipaq5!) +
                                          double.parse(_ipaq1!) >=
                                      7)) |

                                  ///
                                  ((double.parse(_ipaq1!) +
                                          double.parse(_ipaq3!) >=
                                      7)) |

                                  ///
                                  ((double.parse(_ipaq3!) +
                                          double.parse(_ipaq5!) >=
                                      7))))) {
                        //High
                        clinical_quest[7].clear();
                        clinical_quest[7].add(3.0);
                      } else if (((double.parse(_ipaq1!) >= 3) && // CONDITION 1
                              (double.parse(_ipaq2!) >= 20) && // CONDITION 1
                              (double.parse(_ipaq1!) * double.parse(_ipaq2!) <
                                  1500)) |
                          ///////////// OR CONDITION 1
                          (((double.parse(_ipaq3!) >= 5) | (double.parse(_ipaq5!) >= 5)) &&
                              ((double.parse(_ipaq4!) >= 30) |
                                  (double.parse(_ipaq6!) >= 30))) |
                          ////////////////// OR CONDITION 3
                          ((((double.parse(_ipaq2!) + double.parse(_ipaq4!) + double.parse(_ipaq6!) >= 600) &&
                                      (double.parse(_ipaq2!) +
                                              double.parse(_ipaq4!) +
                                              double.parse(_ipaq6!) <
                                          3000)) |

                                  ///
                                  ((double.parse(_ipaq2!) + double.parse(_ipaq4!) >= 600) &&
                                      (double.parse(_ipaq2!) + double.parse(_ipaq4!) <
                                          3000)) |

                                  ///
                                  ((double.parse(_ipaq2!) + double.parse(_ipaq6!) >= 600) &&
                                      (double.parse(_ipaq2!) + double.parse(_ipaq6!) <
                                          3000)) |

                                  ///
                                  ((double.parse(_ipaq4!) + double.parse(_ipaq6!) >= 600) &&
                                      (double.parse(_ipaq4!) + double.parse(_ipaq6!) <
                                          3000))) &&

                              ////BIg and statement for the third condition AND
                              (((double.parse(_ipaq1!) + double.parse(_ipaq3!) + double.parse(_ipaq5!) >= 5) &&
                                      (double.parse(_ipaq1!) +
                                              double.parse(_ipaq3!) +
                                              double.parse(_ipaq5!) <
                                          7)) |

                                  ///
                                  ((double.parse(_ipaq5!) + double.parse(_ipaq1!) >= 5) &&
                                      (double.parse(_ipaq5!) + double.parse(_ipaq1!) <
                                          7)) |

                                  ///
                                  ((double.parse(_ipaq1!) + double.parse(_ipaq3!) >= 5) &&
                                      (double.parse(_ipaq1!) + double.parse(_ipaq3!) < 7)) |

                                  ///
                                  ((double.parse(_ipaq3!) + double.parse(_ipaq5!) >= 5) && (double.parse(_ipaq3!) + double.parse(_ipaq5!) < 7))))) {
                        //Moderate
                        clinical_quest[7].clear();
                        clinical_quest[7].add(2.0);

                        ////// OR CONDITION 3 LOW
                      } else
                      // if (((double.parse(_ipaq1!) < 3) && // CONDITION 1
                      //         (double.parse(_ipaq2!) < 20)) |
                      //     ///////////// OR CONDITION 1
                      //     (((double.parse(_ipaq3!) < 5) |
                      //             (double.parse(_ipaq5!) < 5)) &&
                      //         ((double.parse(_ipaq4!) < 30) |
                      //             (double.parse(_ipaq6!) < 30))))
                      {
                        //Low
                        clinical_quest[7].clear();
                        clinical_quest[7].add(1.0);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThirdRouteBis()),
                      );
                    },
                  )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Quit',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      clinical_quest[0].clear(); //CLEAR EVERYTHING IF EXIT
                      clinical_quest[1].clear();
                      clinical_quest[2].clear();
                      clinical_quest[3].clear();
                      clinical_quest[4].clear();
                      clinical_quest[5].clear();
                      clinical_quest[6].clear();
                      clinical_quest[7].clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuRoute()),
                      );
                    },
                  ))
        ]))));
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////

class ThirdRouteBis extends StatelessWidget {
  //STILL SECOND ROUTE
  const ThirdRouteBis({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Full Assessment Mode - (2/4)',
      home: const SubThirdPageBis(), //remettre const
    );
  }
}

String formatTime(int milliseconds) {
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');

  return "$secs";
}

class SubThirdPageBis extends StatefulWidget {
  //STILL SECOND ROUTE
  const SubThirdPageBis({Key? key}) : super(key: key); //remettre const

  @override
  _SubThirdPageStateBis createState() => _SubThirdPageStateBis();
}

//
class _SubThirdPageStateBis extends State<SubThirdPageBis> {
  late Stopwatch _stopwatch_3_l_1;
  late Stopwatch _stopwatch_3_l_2; //initialize the stopwatch
  late Stopwatch _stopwatch_3_r_1; //initialize the stopwatch
  late Stopwatch _stopwatch_3_r_2;
  late Stopwatch _stopwatch_7;
  late Stopwatch _stopwatch_8; //initialize the stopwatch
  late Stopwatch _stopwatch_9; //initialize the stopwatch
  late Stopwatch _stopwatch_14_1;
  late Stopwatch _stopwatch_14_2;
  late Timer _timer; //initialize the stopwatch
  @override
  double? best_t;
  @override
  void initState() {
    _stopwatch_3_l_1 = Stopwatch();
    _stopwatch_3_l_2 = Stopwatch();
    _stopwatch_3_r_1 = Stopwatch();
    _stopwatch_3_r_2 = Stopwatch();
    _stopwatch_7 = Stopwatch();
    _stopwatch_8 = Stopwatch();
    _stopwatch_9 = Stopwatch();
    _stopwatch_14_1 = Stopwatch();
    _stopwatch_14_2 = Stopwatch();
    // _button_1_1 = ElevatedButton();
    _timer = new Timer.periodic(new Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // void handleStartStop(_stopwatch) {
  //   if ((_stopwatch.isRunning == true)) {
  //     _stopwatch.stop();
  //   } else {
  //     _stopwatch.start();
  //   }

  //   setState(() {});
  // }

  // void handleStartReset(_stopwatch) {
  //   if (_stopwatch.isRunning) {
  //     _stopwatch.reset();
  //   } else {
  //     _stopwatch.reset();
  //   }

  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, //remove back button
          backgroundColor: grey,
          title: Text('Full Assessment Mode - (2/4)', // remttre conts
              style:
                  TextStyle(color: black, fontFamily: 'Fancy', fontSize: 45)),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
          Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
              child: Row(
                  //steps images
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(children: <Widget>[
                      SizedBox(
                          width: 125,
                          child: Image.asset(
                            'assets/images/clinical_test_Quest.png',
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                          child: const Text(
                              'Clinical Tests & Questionnaires (2/3) - Mini BEST',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 35)))
                    ])
                  ])),
          Row(
              //steps images
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(children: <Widget>[
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 5),
                      child: Text('SIT TO STAND',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                      child: Text(
                          '"Cross your arms across your chest. Try not to use your hands unless you must. Do not let your legs lean against the back of the chair when you stand. Please stand up now."',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 15))),
                  SizedBox(
                      width: 125,
                      child: Image.asset(
                        'assets/images/Best1.gif',
                        fit: BoxFit.cover,
                      )),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('From Youtube',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Normal',
                              fontSize: 10))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('SCORE',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 20))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      //width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding:
                                  // const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  width: 120,
                                  child: Text('2 - Normal',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[0].clear();
                                      best[0].add(2.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  width: 120,
                                  child: Text('1 - Moderate',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[0].clear();
                                      best[0].add(1.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  width: 120,
                                  child: Text('0 - Severe',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[0].clear();
                                      best[0].add(0.0);
                                    },
                                  ))
                        ],
                      )),
////// 2
///////////////////////////////
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 5),
                      child: Text('RISE TO TOES',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                      child: Text(
                          '"Place your feet shoulder width apart. Place your hands on your hips. Try to rise as high as you can onto your toes. I will count out loud to 3 seconds. Try to hold this pose for at least 3 seconds. Look straight ahead. Rise now."',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 15))),
                  SizedBox(
                      width: 125,
                      child: Image.asset(
                        'assets/images/Best2.gif',
                        fit: BoxFit.cover,
                      )),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('From Youtube',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Normal',
                              fontSize: 10))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('SCORE',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 20))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      // width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  width: 120,
                                  child: Text('2 - Normal',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[1].clear();
                                      best[1].add(2.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  width: 120,
                                  child: Text('1 - Moderate',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[1].clear();
                                      best[1].add(1.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  width: 120,
                                  child: Text('0 - Severe',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[1].clear();
                                      best[1].add(0.0);
                                    },
                                  ))
                        ],
                      )),
/////////////////////////////////////////////////// 2 fin
///////////////// 3
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 5),
                      child: Text('STAND ON ONE LEG',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                      child: Text(
                          '"Look straight ahead. Keep your hands on your hips. Lift your leg off of the ground behind you without touching or resting your raised leg upon your other standing leg. Stay standing on one leg as long as you can. Look straight ahead. Lift now."',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 15))),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(children: [
                          Container(
                              child: Text('Trial 1 Left',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Fancy',
                                      fontSize: 15))),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                  formatTime(
                                      _stopwatch_3_l_1.elapsedMilliseconds),
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Fancy',
                                      fontSize: 15))),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    ElevatedButton(
                                        // style: ElevatedButton.styleFrom(
                                        //     backgroundColor: Colors.white),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states1) {
                                              if (states1.contains(
                                                      MaterialState.pressed) ==
                                                  true) {
                                                return Colors.blue;
                                              } else {
                                                return Colors.white;
                                              }
                                              // return Colors.greenAccent;
                                            },
                                          ),
                                        ),
                                        child: Container(
                                            // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                            // width: 30,
                                            child: Text(
                                                _stopwatch_3_l_1.isRunning
                                                    ? 'Stop'
                                                    : 'Start',
                                                style: TextStyle(
                                                    color: black,
                                                    fontFamily: 'Fancy',
                                                    fontSize: 20))),
                                        onPressed: () => setState(
                                              () {
                                                if ((_stopwatch_3_l_1
                                                        .isRunning ==
                                                    true)) {
                                                  //add bigger or equal test duration
                                                  _stopwatch_3_l_1.stop();
                                                } else {
                                                  _stopwatch_3_l_1.start();
                                                }
                                              },
                                            )),
                                    ElevatedButton(
                                        // style: ElevatedButton.styleFrom(
                                        //     backgroundColor: Colors.white),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states1) {
                                              if (states1.contains(
                                                      MaterialState.pressed) ==
                                                  true) {
                                                return Colors.blue;
                                              } else {
                                                return Colors.white;
                                              }
                                              // return Colors.greenAccent;
                                            },
                                          ),
                                        ),
                                        child: Container(
                                            // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                            // width: 30,
                                            child: Text('Reset',
                                                style: TextStyle(
                                                    color: black,
                                                    fontFamily: 'Fancy',
                                                    fontSize: 20))),
                                        onPressed: () => setState(
                                              () {
                                                _stopwatch_3_l_1.stop();
                                                _stopwatch_3_l_1.reset();
                                              },
                                            ))
                                  ])),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Image.asset(
                                height: 25,
                                width: 15,
                                'assets/images/New_arrow.png',
                                fit: BoxFit.cover,
                              )),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text('Trial 2 Left',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Fancy',
                                      fontSize: 15))),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                  formatTime(
                                      _stopwatch_3_l_2.elapsedMilliseconds),
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Fancy',
                                      fontSize: 15))),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    ElevatedButton(
                                        // style: ElevatedButton.styleFrom(
                                        //     backgroundColor: Colors.white),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states1) {
                                              if (states1.contains(
                                                      MaterialState.pressed) ==
                                                  true) {
                                                return Colors.blue;
                                              } else {
                                                return Colors.white;
                                              }
                                              // return Colors.greenAccent;
                                            },
                                          ),
                                        ),
                                        child: Container(
                                            // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                            // width: 30,
                                            child: Text(
                                                _stopwatch_3_l_2.isRunning
                                                    ? 'Stop'
                                                    : 'Start',
                                                style: TextStyle(
                                                    color: black,
                                                    fontFamily: 'Fancy',
                                                    fontSize: 20))),
                                        onPressed: () => setState(
                                              () {
                                                if ((_stopwatch_3_l_2
                                                        .isRunning ==
                                                    true)) {
                                                  //add bigger or equal test duration
                                                  _stopwatch_3_l_2.stop();
                                                } else {
                                                  _stopwatch_3_l_2.start();
                                                }
                                              },
                                            )),
                                    ElevatedButton(
                                        // style: ElevatedButton.styleFrom(
                                        //     backgroundColor: Colors.white),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states1) {
                                              if (states1.contains(
                                                      MaterialState.pressed) ==
                                                  true) {
                                                return Colors.blue;
                                              } else {
                                                return Colors.white;
                                              }
                                              // return Colors.greenAccent;
                                            },
                                          ),
                                        ),
                                        child: Container(
                                            // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                            // width: 30,
                                            child: Text('Reset',
                                                style: TextStyle(
                                                    color: black,
                                                    fontFamily: 'Fancy',
                                                    fontSize: 20))),
                                        onPressed: () => setState(
                                              () {
                                                _stopwatch_3_l_2.stop();
                                                _stopwatch_3_l_2.reset();
                                              },
                                            ))
                                  ]))
                        ]),
                        ////// colonne de gauche chrono
                        Column(children: [
                          ///////////////////
                          SizedBox(
                              width: 125,
                              child: Image.asset(
                                'assets/images/Best3_l.gif',
                                fit: BoxFit.cover,
                              )),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text('From Youtube',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Normal',
                                      fontSize: 10))),
                          Container(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 30),
                              child: Text('SCORE',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Fancy',
                                      fontSize: 20))),
                          Container(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 30),
                              // width: 350,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  ElevatedButton(
                                      // style: ElevatedButton.styleFrom(
                                      //     backgroundColor: Colors.white),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states1) {
                                            if (states1.contains(
                                                    MaterialState.pressed) ==
                                                true) {
                                              return Colors.green;
                                            } else {
                                              return Colors.white;
                                            }
                                            // return Colors.greenAccent;
                                          },
                                        ),
                                      ),
                                      child: Container(
                                          // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                          // width: 60,
                                          child: Text('2 - Normal',
                                              style: TextStyle(
                                                  color: black,
                                                  fontFamily: 'Fancy',
                                                  fontSize: 20))),
                                      onPressed: () => setState(
                                            () {
                                              best_2[0].clear();
                                              best_2[0].add(2.0);
                                              if (best_2[0][0] <=
                                                  best_2[1][0]) {
                                                best[2].clear();
                                                best[2].add(best_2[0][0]);
                                              } else {
                                                best[2].clear();
                                                best[2].add(best_2[1][0]);
                                              }
                                            },
                                          )),
                                  ElevatedButton(
                                      // style: ElevatedButton.styleFrom(
                                      //     backgroundColor: Colors.white),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states1) {
                                            if (states1.contains(
                                                    MaterialState.pressed) ==
                                                true) {
                                              return Colors.green;
                                            } else {
                                              return Colors.white;
                                            }
                                            // return Colors.greenAccent;
                                          },
                                        ),
                                      ),
                                      child: Container(
                                          // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                          // width: 60,
                                          child: Text('1 - Moderate',
                                              style: TextStyle(
                                                  color: black,
                                                  fontFamily: 'Fancy',
                                                  fontSize: 20))),
                                      onPressed: () => setState(
                                            () {
                                              best_2[0].clear();
                                              best_2[0].add(1.0);
                                              if (best_2[0][0] <=
                                                  best_2[1][0]) {
                                                best[2].clear();
                                                best[2].add(best_2[0][0]);
                                              } else {
                                                best[2].clear();
                                                best[2].add(best_2[1][0]);
                                              }
                                            },
                                          )),
                                  ElevatedButton(
                                      // style: ElevatedButton.styleFrom(
                                      //     backgroundColor: Colors.white),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states1) {
                                            if (states1.contains(
                                                    MaterialState.pressed) ==
                                                true) {
                                              return Colors.green;
                                            } else {
                                              return Colors.white;
                                            }
                                            // return Colors.greenAccent;
                                          },
                                        ),
                                      ),
                                      child: Container(
                                          // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                          // width: 60,
                                          child: Text('0 - Severe',
                                              style: TextStyle(
                                                  color: black,
                                                  fontFamily: 'Fancy',
                                                  fontSize: 20))),
                                      onPressed: () => setState(
                                            () {
                                              best_2[0].clear();
                                              best_2[0].add(0.0);
                                              if (best_2[0][0] <=
                                                  best_2[1][0]) {
                                                best[2].clear();
                                                best[2].add(best_2[0][0]);
                                              } else {
                                                best[2].clear();
                                                best[2].add(best_2[1][0]);
                                              }
                                            },
                                          ))
                                ],
                              )),
                        ]),
                        Container(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Image.asset(
                              height: 70,
                              width: 100,
                              'assets/images/arrow.png',
                              fit: BoxFit.cover,
                            )),
                        Column(children: [
                          ///////////////////
                          SizedBox(
                              width: 125,
                              child: Image.asset(
                                'assets/images/Best3_r.gif',
                                fit: BoxFit.cover,
                              )),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text('From Youtube',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Normal',
                                      fontSize: 10))),
                          Container(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 30),
                              child: Text('SCORE',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Fancy',
                                      fontSize: 20))),
                          Container(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 30),
                              // width: 350,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  ElevatedButton(
                                      // style: ElevatedButton.styleFrom(
                                      //     backgroundColor: Colors.white),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states1) {
                                            if (states1.contains(
                                                    MaterialState.pressed) ==
                                                true) {
                                              return Colors.green;
                                            } else {
                                              return Colors.white;
                                            }
                                            // return Colors.greenAccent;
                                          },
                                        ),
                                      ),
                                      child: Container(
                                          // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                          // width: 60,
                                          child: Text('2 - Normal',
                                              style: TextStyle(
                                                  color: black,
                                                  fontFamily: 'Fancy',
                                                  fontSize: 20))),
                                      onPressed: () => setState(
                                            () {
                                              best_2[1].clear();
                                              best_2[1].add(2.0);
                                              if (best_2[0][0] <=
                                                  best_2[1][0]) {
                                                best[2].clear();
                                                best[2].add(best_2[0][0]);
                                              } else {
                                                best[2].clear();
                                                best[2].add(best_2[1][0]);
                                              }
                                            },
                                          )),
                                  ElevatedButton(
                                      // style: ElevatedButton.styleFrom(
                                      //     backgroundColor: Colors.white),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states1) {
                                            if (states1.contains(
                                                    MaterialState.pressed) ==
                                                true) {
                                              return Colors.green;
                                            } else {
                                              return Colors.white;
                                            }
                                            // return Colors.greenAccent;
                                          },
                                        ),
                                      ),
                                      child: Container(
                                          // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                          // width: 60,
                                          child: Text('1 - Moderate',
                                              style: TextStyle(
                                                  color: black,
                                                  fontFamily: 'Fancy',
                                                  fontSize: 20))),
                                      onPressed: () => setState(
                                            () {
                                              best_2[1].clear();
                                              best_2[1].add(1.0);
                                              if (best_2[0][0] <=
                                                  best_2[1][0]) {
                                                best[2].clear();
                                                best[2].add(best_2[0][0]);
                                              } else {
                                                best[2].clear();
                                                best[2].add(best_2[1][0]);
                                              }
                                            },
                                          )),
                                  ElevatedButton(
                                      // style: ElevatedButton.styleFrom(
                                      //     backgroundColor: Colors.white),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states1) {
                                            if (states1.contains(
                                                    MaterialState.pressed) ==
                                                true) {
                                              return Colors.green;
                                            } else {
                                              return Colors.white;
                                            }
                                            // return Colors.greenAccent;
                                          },
                                        ),
                                      ),
                                      child: Container(
                                          // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                          // width: 60,
                                          child: Text('0 - Severe',
                                              style: TextStyle(
                                                  color: black,
                                                  fontFamily: 'Fancy',
                                                  fontSize: 20))),
                                      onPressed: () => setState(
                                            () {
                                              best_2[1].clear();
                                              best_2[1].add(0.0);
                                              if (best_2[0][0] <=
                                                  best_2[1][0]) {
                                                best[2].clear();
                                                best[2].add(best_2[0][0]);
                                              } else {
                                                best[2].clear();
                                                best[2].add(best_2[1][0]);
                                              }
                                            },
                                          ))
                                ],
                              )),
                        ]),
                        ///////////////////////////////////////////////////
                        Column(children: [
                          Container(
                              child: Text('Trial 1 Right',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Fancy',
                                      fontSize: 15))),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                  formatTime(
                                      _stopwatch_3_r_1.elapsedMilliseconds),
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Fancy',
                                      fontSize: 15))),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    ElevatedButton(
                                        // style: ElevatedButton.styleFrom(
                                        //     backgroundColor: Colors.white),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states1) {
                                              if (states1.contains(
                                                      MaterialState.pressed) ==
                                                  true) {
                                                return Colors.blue;
                                              } else {
                                                return Colors.white;
                                              }
                                              // return Colors.greenAccent;
                                            },
                                          ),
                                        ),
                                        child: Container(
                                            // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                            // width: 30,
                                            child: Text(
                                                _stopwatch_3_r_1.isRunning
                                                    ? 'Stop'
                                                    : 'Start',
                                                style: TextStyle(
                                                    color: black,
                                                    fontFamily: 'Fancy',
                                                    fontSize: 20))),
                                        onPressed: () => setState(
                                              () {
                                                if ((_stopwatch_3_r_1
                                                        .isRunning ==
                                                    true)) {
                                                  //add bigger or equal test duration
                                                  _stopwatch_3_r_1.stop();
                                                } else {
                                                  _stopwatch_3_r_1.start();
                                                }
                                              },
                                            )),
                                    ElevatedButton(
                                        // style: ElevatedButton.styleFrom(
                                        //     backgroundColor: Colors.white),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states1) {
                                              if (states1.contains(
                                                      MaterialState.pressed) ==
                                                  true) {
                                                return Colors.blue;
                                              } else {
                                                return Colors.white;
                                              }
                                              // return Colors.greenAccent;
                                            },
                                          ),
                                        ),
                                        child: Container(
                                            // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                            // width: 30,
                                            child: Text('Reset',
                                                style: TextStyle(
                                                    color: black,
                                                    fontFamily: 'Fancy',
                                                    fontSize: 20))),
                                        onPressed: () => setState(
                                              () {
                                                _stopwatch_3_r_1.stop();
                                                _stopwatch_3_r_1.reset();
                                              },
                                            ))
                                  ])),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Image.asset(
                                height: 25,
                                width: 15,
                                'assets/images/New_arrow.png',
                                fit: BoxFit.cover,
                              )),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text('Trial 2 Right',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Fancy',
                                      fontSize: 15))),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                  formatTime(
                                      _stopwatch_3_r_2.elapsedMilliseconds),
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Fancy',
                                      fontSize: 15))),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    ElevatedButton(
                                        // style: ElevatedButton.styleFrom(
                                        //     backgroundColor: Colors.white),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states1) {
                                              if (states1.contains(
                                                      MaterialState.pressed) ==
                                                  true) {
                                                return Colors.blue;
                                              } else {
                                                return Colors.white;
                                              }
                                              // return Colors.greenAccent;
                                            },
                                          ),
                                        ),
                                        child: Container(
                                            // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                            // width: 30,
                                            child: Text(
                                                _stopwatch_3_r_2.isRunning
                                                    ? 'Stop'
                                                    : 'Start',
                                                style: TextStyle(
                                                    color: black,
                                                    fontFamily: 'Fancy',
                                                    fontSize: 20))),
                                        onPressed: () => setState(
                                              () {
                                                if ((_stopwatch_3_r_2
                                                        .isRunning ==
                                                    true)) {
                                                  //add bigger or equal test duration
                                                  _stopwatch_3_r_2.stop();
                                                } else {
                                                  _stopwatch_3_r_2.start();
                                                }
                                              },
                                            )),
                                    ElevatedButton(
                                        // style: ElevatedButton.styleFrom(
                                        //     backgroundColor: Colors.white),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states1) {
                                              if (states1.contains(
                                                      MaterialState.pressed) ==
                                                  true) {
                                                return Colors.blue;
                                              } else {
                                                return Colors.white;
                                              }
                                              // return Colors.greenAccent;
                                            },
                                          ),
                                        ),
                                        child: Container(
                                            // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                            // width: 30,
                                            child: Text('Reset',
                                                style: TextStyle(
                                                    color: black,
                                                    fontFamily: 'Fancy',
                                                    fontSize: 20))),
                                        onPressed: () => setState(
                                              () {
                                                _stopwatch_3_r_2.stop();
                                                _stopwatch_3_r_2.reset();
                                              },
                                            ))
                                  ]))
                        ])
                      ]),

///////////////////////// END 3
                  ///4
                  ///
///////////////// 4
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 5),
                      child: Text('COMPENSATORY STEPPING CORRECTION- FORWARD',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                      child: Text(
                          '"Stand with your feet shoulder width apart, arms at your sides. Lean forward against my hands beyond your forward limits. When I let go, do whatever is necessary, including taking a step, to avoid a fall."',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 15))),

                  SizedBox(
                      width: 125,
                      child: Image.asset(
                        'assets/images/Best4.png',
                        fit: BoxFit.cover,
                      )),

                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('From Youtube',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Normal',
                              fontSize: 10))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('SCORE',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 20))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      // width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('2 - Normal',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[3].clear();
                                      best[3].add(2.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('1 - Moderate',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[3].clear();
                                      best[3].add(1.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('0 - Severe',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[3].clear();
                                      best[3].add(0.0);
                                    },
                                  ))
                        ],
                      )),

///////////////////////// END 4
                  ///
                  ///
///////////////// 5
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 5),
                      child: Text('COMPENSATORY STEPPING CORRECTION- BACKWARD',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                      child: Text(
                          '"Stand with your feet shoulder width apart, arms at your sides. Lean backward against my hands beyond your backward limits. When I let go, do whatever is necessary, including taking a step, to avoid a fall."',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 15))),

                  SizedBox(
                      width: 125,
                      child: Image.asset(
                        'assets/images/Best5.png',
                        fit: BoxFit.cover,
                      )),

                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('From Youtube',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Normal',
                              fontSize: 10))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('SCORE',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 20))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      // width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('2 - Normal',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[4].clear();
                                      best[4].add(2.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('1 - Moderate',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[4].clear();
                                      best[4].add(1.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('0 - Severe',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[4].clear();
                                      best[4].add(0.0);
                                    },
                                  ))
                        ],
                      )),

///////////////////////// END 5
                  ///
                  ///
                  ///
///////////////// 6
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 5),
                      child: Text('COMPENSATORY STEPPING CORRECTION- LATERAL',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                      child: Text(
                          '"Stand with your feet together, arms down at your sides. Lean into my hand beyond your sideways limit. When I let go, do whatever is necessary, including taking a step, to avoid a fall."',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 15))),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(children: [
                          ///////////////////
                          SizedBox(
                              width: 125,
                              child: Image.asset(
                                'assets/images/Best6_l.gif',
                                fit: BoxFit.cover,
                              )),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text('From Youtube',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Normal',
                                      fontSize: 10))),
                          Container(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 30),
                              child: Text('SCORE',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Fancy',
                                      fontSize: 20))),
                          Container(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 30),
                              // width: 350,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  ElevatedButton(
                                      // style: ElevatedButton.styleFrom(
                                      //     backgroundColor: Colors.white),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states1) {
                                            if (states1.contains(
                                                    MaterialState.pressed) ==
                                                true) {
                                              return Colors.green;
                                            } else {
                                              return Colors.white;
                                            }
                                            // return Colors.greenAccent;
                                          },
                                        ),
                                      ),
                                      child: Container(
                                          // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                          // width: 60,
                                          child: Text('2 - Normal',
                                              style: TextStyle(
                                                  color: black,
                                                  fontFamily: 'Fancy',
                                                  fontSize: 20))),
                                      onPressed: () => setState(
                                            () {
                                              best_5[0].clear();
                                              best_5[0].add(2.0);
                                              if (best_5[0][0] <=
                                                  best_5[1][0]) {
                                                best[5].clear();
                                                best[5].add(best_5[0][0]);
                                              } else {
                                                best[5].clear();
                                                best[5].add(best_5[1][0]);
                                              }
                                            },
                                          )),
                                  ElevatedButton(
                                      // style: ElevatedButton.styleFrom(
                                      //     backgroundColor: Colors.white),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states1) {
                                            if (states1.contains(
                                                    MaterialState.pressed) ==
                                                true) {
                                              return Colors.green;
                                            } else {
                                              return Colors.white;
                                            }
                                            // return Colors.greenAccent;
                                          },
                                        ),
                                      ),
                                      child: Container(
                                          // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                          // width: 60,
                                          child: Text('1 - Moderate',
                                              style: TextStyle(
                                                  color: black,
                                                  fontFamily: 'Fancy',
                                                  fontSize: 20))),
                                      onPressed: () => setState(
                                            () {
                                              best_5[0].clear();
                                              best_5[0].add(1.0);
                                              if (best_5[0][0] <=
                                                  best_5[1][0]) {
                                                best[5].clear();
                                                best[5].add(best_5[0][0]);
                                              } else {
                                                best[5].clear();
                                                best[5].add(best_5[1][0]);
                                              }
                                            },
                                          )),
                                  ElevatedButton(
                                      // style: ElevatedButton.styleFrom(
                                      //     backgroundColor: Colors.white),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states1) {
                                            if (states1.contains(
                                                    MaterialState.pressed) ==
                                                true) {
                                              return Colors.green;
                                            } else {
                                              return Colors.white;
                                            }
                                            // return Colors.greenAccent;
                                          },
                                        ),
                                      ),
                                      child: Container(
                                          // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                          // width: 60,
                                          child: Text('0 - Severe',
                                              style: TextStyle(
                                                  color: black,
                                                  fontFamily: 'Fancy',
                                                  fontSize: 20))),
                                      onPressed: () => setState(
                                            () {
                                              best_5[0].clear();
                                              best_5[0].add(0.0);
                                              if (best_5[0][0] <=
                                                  best_5[1][0]) {
                                                best[5].clear();
                                                best[5].add(best_5[0][0]);
                                              } else {
                                                best[5].clear();
                                                best[5].add(best_5[1][0]);
                                              }
                                            },
                                          ))
                                ],
                              )),
                        ]),
                        Container(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Image.asset(
                              height: 70,
                              width: 100,
                              'assets/images/arrow.png',
                              fit: BoxFit.cover,
                            )),
                        Column(
                          children: [
                            ///////////////////
                            SizedBox(
                                width: 125,
                                child: Image.asset(
                                  'assets/images/Best6_r.gif',
                                  fit: BoxFit.cover,
                                )),
                            Container(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Text('From Youtube',
                                    style: TextStyle(
                                        color: black,
                                        fontFamily: 'Normal',
                                        fontSize: 10))),
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 30),
                                child: Text('SCORE',
                                    style: TextStyle(
                                        color: black,
                                        fontFamily: 'Fancy',
                                        fontSize: 20))),
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 30),
                              // width: 350,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    ElevatedButton(
                                        // style: ElevatedButton.styleFrom(
                                        //     backgroundColor: Colors.white),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states1) {
                                              if (states1.contains(
                                                      MaterialState.pressed) ==
                                                  true) {
                                                return Colors.green;
                                              } else {
                                                return Colors.white;
                                              }
                                              // return Colors.greenAccent;
                                            },
                                          ),
                                        ),
                                        child: Container(
                                            // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                            // width: 60,
                                            child: Text('2 - Normal',
                                                style: TextStyle(
                                                    color: black,
                                                    fontFamily: 'Fancy',
                                                    fontSize: 20))),
                                        onPressed: () => setState(
                                              () {
                                                best_5[1].clear();
                                                best_5[1].add(2.0);
                                                if (best_5[0][0] <=
                                                    best_5[1][0]) {
                                                  best[5].clear();
                                                  best[5].add(best_5[0][0]);
                                                } else {
                                                  best[5].clear();
                                                  best[5].add(best_5[1][0]);
                                                }
                                              },
                                            )),
                                    ElevatedButton(
                                        // style: ElevatedButton.styleFrom(
                                        //     backgroundColor: Colors.white),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states1) {
                                              if (states1.contains(
                                                      MaterialState.pressed) ==
                                                  true) {
                                                return Colors.green;
                                              } else {
                                                return Colors.white;
                                              }
                                              // return Colors.greenAccent;
                                            },
                                          ),
                                        ),
                                        child: Container(
                                            // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                            // width: 60,
                                            child: Text('1 - Moderate',
                                                style: TextStyle(
                                                    color: black,
                                                    fontFamily: 'Fancy',
                                                    fontSize: 20))),
                                        onPressed: () => setState(
                                              () {
                                                best_5[1].clear();
                                                best_5[1].add(1.0);
                                                if (best_5[0][0] <=
                                                    best_5[1][0]) {
                                                  best[5].clear();
                                                  best[5].add(best_5[0][0]);
                                                } else {
                                                  best[5].clear();
                                                  best[5].add(best_5[1][0]);
                                                }
                                              },
                                            )),
                                    ElevatedButton(
                                        // style: ElevatedButton.styleFrom(
                                        //     backgroundColor: Colors.white),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states1) {
                                              if (states1.contains(
                                                      MaterialState.pressed) ==
                                                  true) {
                                                return Colors.green;
                                              } else {
                                                return Colors.white;
                                              }
                                              // return Colors.greenAccent;
                                            },
                                          ),
                                        ),
                                        child: Container(
                                            // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                            // width: 60,
                                            child: Text('0 - Severe',
                                                style: TextStyle(
                                                    color: black,
                                                    fontFamily: 'Fancy',
                                                    fontSize: 20))),
                                        onPressed: () => setState(
                                              () {
                                                best_5[1].clear();
                                                best_5[1].add(0.0);
                                                if (best_5[0][0] <=
                                                    best_5[1][0]) {
                                                  best[5].clear();
                                                  best[5].add(best_5[0][0]);
                                                } else {
                                                  best[5].clear();
                                                  best[5].add(best_5[1][0]);
                                                }
                                              },
                                            ))
                                  ]),
                            )
                          ],
                        )
                      ]),
                  // Container(
                  //     //JUST TO CHECK
                  //     padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                  //     child: Text(best[5].toString(),
                  //         style: TextStyle(
                  //             color: black,
                  //             fontFamily: 'Fancy',
                  //             fontSize: 30))),

///////////////////////// END 6
                  ///
///////////////// 7
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 5),
                      child: Text(
                          'STANCE (FEET TOGETHER); EYES OPEN, FIRM SURFACE',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                      child: Text(
                          '"Place your hands on your hips. Place your feet together until almost touching. Look straight ahead. Be as stable and still as possible, until I say stop."',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 15))),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(children: [
                          SizedBox(
                              width: 125,
                              child: Image.asset(
                                'assets/images/Best7.gif',
                                fit: BoxFit.cover,
                              )),
                          Container(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 30),
                              child: Text('From Youtube',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Normal',
                                      fontSize: 10))),
                        ]),
                        SizedBox(width: 125),
                        Column(children: [
                          Container(
                              child: Text('TIME',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Fancy',
                                      fontSize: 20))),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                  formatTime(_stopwatch_7.elapsedMilliseconds >=
                                          30000 //test duration
                                      ? 0
                                      : 30000 -
                                          _stopwatch_7.elapsedMilliseconds),
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Fancy',
                                      fontSize: 20))),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    ElevatedButton(
                                        // style: ElevatedButton.styleFrom(
                                        //     backgroundColor: Colors.white),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states1) {
                                              if (states1.contains(
                                                      MaterialState.pressed) ==
                                                  true) {
                                                return Colors.blue;
                                              } else {
                                                return Colors.white;
                                              }
                                              // return Colors.greenAccent;
                                            },
                                          ),
                                        ),
                                        child: Container(
                                            // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                            // width: 30,
                                            child: Text(
                                                _stopwatch_7.isRunning
                                                    ? 'Stop'
                                                    : 'Start',
                                                style: TextStyle(
                                                    color: black,
                                                    fontFamily: 'Fancy',
                                                    fontSize: 20))),
                                        onPressed: () => setState(
                                              () {
                                                if ((_stopwatch_7.isRunning ==
                                                    true)) {
                                                  //add bigger or equal test duration
                                                  _stopwatch_7.stop();
                                                } else {
                                                  _stopwatch_7.start();
                                                }
                                              },
                                            )),
                                    ElevatedButton(
                                        // style: ElevatedButton.styleFrom(
                                        //     backgroundColor: Colors.white),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states1) {
                                              if (states1.contains(
                                                      MaterialState.pressed) ==
                                                  true) {
                                                return Colors.blue;
                                              } else {
                                                return Colors.white;
                                              }
                                              // return Colors.greenAccent;
                                            },
                                          ),
                                        ),
                                        child: Container(
                                            // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                            // width: 30,
                                            child: Text('Reset',
                                                style: TextStyle(
                                                    color: black,
                                                    fontFamily: 'Fancy',
                                                    fontSize: 20))),
                                        onPressed: () => setState(
                                              () {
                                                _stopwatch_7.stop();
                                                _stopwatch_7.reset();
                                              },
                                            ))
                                  ])),
                        ])
                      ]),

                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('SCORE',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 20))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      // width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('2 - Normal',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[6].clear();
                                      best[6].add(2.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('1 - Moderate',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[6].clear();
                                      best[6].add(1.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('0 - Severe',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[6].clear();
                                      best[6].add(0.0);
                                    },
                                  ))
                        ],
                      )),

///////////////////////// END 7
                  ///
///////////////// 8
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 5),
                      child: Text(
                          'STANCE (FEET TOGETHER); EYES CLOSED, FOAM SURFACE',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                      child: Text(
                          '"Step onto the foam. Place your hands on your hips. Place your feet together until almost touching. Be as stable and still as possible, until I say stop. I will start timing when you close your eyes."',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 15))),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(children: [
                          SizedBox(
                              width: 125,
                              child: Image.asset(
                                'assets/images/Best8.gif',
                                fit: BoxFit.cover,
                              )),
                          Container(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 30),
                              child: Text('From Youtube',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Normal',
                                      fontSize: 10))),
                        ]),
                        SizedBox(width: 125),
                        Column(children: [
                          Container(
                              child: Text('TIME',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Fancy',
                                      fontSize: 20))),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                  formatTime(_stopwatch_8.elapsedMilliseconds >=
                                          30000 //test duration
                                      ? 0
                                      : 30000 -
                                          _stopwatch_8.elapsedMilliseconds),
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Fancy',
                                      fontSize: 20))),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    ElevatedButton(
                                        // style: ElevatedButton.styleFrom(
                                        //     backgroundColor: Colors.white),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states1) {
                                              if (states1.contains(
                                                      MaterialState.pressed) ==
                                                  true) {
                                                return Colors.blue;
                                              } else {
                                                return Colors.white;
                                              }
                                              // return Colors.greenAccent;
                                            },
                                          ),
                                        ),
                                        child: Container(
                                            // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                            // width: 30,
                                            child: Text(
                                                _stopwatch_8.isRunning
                                                    ? 'Stop'
                                                    : 'Start',
                                                style: TextStyle(
                                                    color: black,
                                                    fontFamily: 'Fancy',
                                                    fontSize: 20))),
                                        onPressed: () => setState(
                                              () {
                                                if ((_stopwatch_8.isRunning ==
                                                    true)) {
                                                  //add bigger or equal test duration
                                                  _stopwatch_8.stop();
                                                } else {
                                                  _stopwatch_8.start();
                                                }
                                              },
                                            )),
                                    ElevatedButton(
                                        // style: ElevatedButton.styleFrom(
                                        //     backgroundColor: Colors.white),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states1) {
                                              if (states1.contains(
                                                      MaterialState.pressed) ==
                                                  true) {
                                                return Colors.blue;
                                              } else {
                                                return Colors.white;
                                              }
                                              // return Colors.greenAccent;
                                            },
                                          ),
                                        ),
                                        child: Container(
                                            // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                            // width: 30,
                                            child: Text('Reset',
                                                style: TextStyle(
                                                    color: black,
                                                    fontFamily: 'Fancy',
                                                    fontSize: 20))),
                                        onPressed: () => setState(
                                              () {
                                                _stopwatch_8.stop();
                                                _stopwatch_8.reset();
                                              },
                                            ))
                                  ])),
                        ])
                      ]),

                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('SCORE',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 20))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      // width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('2 - Normal',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[7].clear();
                                      best[7].add(2.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('1 - Moderate',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[7].clear();
                                      best[7].add(1.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('0 - Severe',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[7].clear();
                                      best[7].add(0.0);
                                    },
                                  ))
                        ],
                      )),

///////////////////////// END 8
                  ///              ///
///////////////// 9
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 5),
                      child: Text(
                          'STANCE (FEET TOGETHER); EYES CLOSED, INCLINE SURFACE',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                      child: Text(
                          '"Step onto the incline ramp. Please stand on the incline ramp with your toes toward the top. Place your feet shoulder width apart and have your arms down at your sides. I will start timing when you close your eyes."',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 15))),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(children: [
                          SizedBox(
                              width: 125,
                              child: Image.asset(
                                'assets/images/Best9.gif',
                                fit: BoxFit.cover,
                              )),
                          Container(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 30),
                              child: Text('From Youtube',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Normal',
                                      fontSize: 10))),
                        ]),
                        SizedBox(width: 125),
                        Column(children: [
                          Container(
                              child: Text('TIME',
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Fancy',
                                      fontSize: 20))),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                  formatTime(_stopwatch_9.elapsedMilliseconds >=
                                          30000 //test duration
                                      ? 0
                                      : 30000 -
                                          _stopwatch_9.elapsedMilliseconds),
                                  style: TextStyle(
                                      color: black,
                                      fontFamily: 'Fancy',
                                      fontSize: 20))),
                          Container(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    ElevatedButton(
                                        // style: ElevatedButton.styleFrom(
                                        //     backgroundColor: Colors.white),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states1) {
                                              if (states1.contains(
                                                      MaterialState.pressed) ==
                                                  true) {
                                                return Colors.blue;
                                              } else {
                                                return Colors.white;
                                              }
                                              // return Colors.greenAccent;
                                            },
                                          ),
                                        ),
                                        child: Container(
                                            // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                            // width: 30,
                                            child: Text(
                                                _stopwatch_9.isRunning
                                                    ? 'Stop'
                                                    : 'Start',
                                                style: TextStyle(
                                                    color: black,
                                                    fontFamily: 'Fancy',
                                                    fontSize: 20))),
                                        onPressed: () => setState(
                                              () {
                                                if ((_stopwatch_9.isRunning ==
                                                    true)) {
                                                  //add bigger or equal test duration
                                                  _stopwatch_9.stop();
                                                } else {
                                                  _stopwatch_9.start();
                                                }
                                              },
                                            )),
                                    ElevatedButton(
                                        // style: ElevatedButton.styleFrom(
                                        //     backgroundColor: Colors.white),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states1) {
                                              if (states1.contains(
                                                      MaterialState.pressed) ==
                                                  true) {
                                                return Colors.blue;
                                              } else {
                                                return Colors.white;
                                              }
                                              // return Colors.greenAccent;
                                            },
                                          ),
                                        ),
                                        child: Container(
                                            // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                            // width: 30,
                                            child: Text('Reset',
                                                style: TextStyle(
                                                    color: black,
                                                    fontFamily: 'Fancy',
                                                    fontSize: 20))),
                                        onPressed: () => setState(
                                              () {
                                                _stopwatch_9.stop();
                                                _stopwatch_9.reset();
                                              },
                                            ))
                                  ])),
                        ])
                      ]),

                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('SCORE',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 20))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      // width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('2 - Normal',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[8].clear();
                                      best[8].add(2.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('1 - Moderate',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[8].clear();
                                      best[8].add(1.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('0 - Severe',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[8].clear();
                                      best[8].add(0.0);
                                    },
                                  ))
                        ],
                      )),

///////////////////////// END 9
                  ///              ///
///////////////// 10
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 5),
                      child: Text('CHANGE IN GAIT SPEED',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                      child: Text(
                          '"Begin walking at your normal speed, when I tell you ‘fast’, walk as fast as you can. When I say ‘slow’, walk very slowly."',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 15))),
                  SizedBox(
                      width: 300,
                      child: Image.asset(
                        'assets/images/Best10.gif',
                        fit: BoxFit.cover,
                      )),

                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('From Youtube',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Normal',
                              fontSize: 10))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('SCORE',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 20))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      // width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('2 - Normal',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[9].clear();
                                      best[9].add(2.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('1 - Moderate',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[9].clear();
                                      best[9].add(1.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('0 - Severe',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[9].clear();
                                      best[9].add(0.0);
                                    },
                                  ))
                        ],
                      )),

///////////////////////// END 10
                  ///
                  ///              ///
///////////////// 11
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 5),
                      child: Text('WALK WITH HEAD TURNS – HORIZONTAL',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                      child: Text(
                          '"Begin walking at your normal speed, when I say “right”, turn your head and look to the right. When I say “left” turn your head and look to the left. Try to keep yourself walking in a straight line."',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 15))),
                  SizedBox(
                      width: 300,
                      child: Image.asset(
                        'assets/images/Best11.gif',
                        fit: BoxFit.cover,
                      )),

                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('From Youtube',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Normal',
                              fontSize: 10))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('SCORE',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 20))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      // width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('2 - Normal',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[10].clear();
                                      best[10].add(2.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('1 - Moderate',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[10].clear();
                                      best[10].add(1.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('0 - Severe',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[10].clear();
                                      best[10].add(0.0);
                                    },
                                  ))
                        ],
                      )),

///////////////////////// END 11
                  ///
                  ///              ///
///////////////// 12
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 5),
                      child: Text('WALK WITH PIVOT TURNS',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                      child: Text(
                          '"Begin walking at your normal speed. When I tell you to ‘turn and stop’, turn as quickly as you can, face the opposite direction, and stop. After the turn, your feet should be close together."',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 15))),
                  SizedBox(
                      width: 300,
                      child: Image.asset(
                        'assets/images/Best12.gif',
                        fit: BoxFit.cover,
                      )),

                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('From Youtube',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Normal',
                              fontSize: 10))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('SCORE',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 20))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      // width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  width: 120,
                                  child: Text('2 - Normal',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[11].clear();
                                      best[11].add(2.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('1 - Moderate',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[11].clear();
                                      best[11].add(1.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('0 - Severe',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[11].clear();
                                      best[11].add(0.0);
                                    },
                                  ))
                        ],
                      )),

///////////////////////// END 12
                  ///
                  ///              ///
///////////////// 13
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 5),
                      child: Text('STEP OVER OBSTACLES',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                      child: Text(
                          '"Begin walking at your normal speed. When you get to the box, step over it, not around it and keep walking."',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 15))),
                  SizedBox(
                      width: 300,
                      child: Image.asset(
                        'assets/images/Best13.gif',
                        fit: BoxFit.cover,
                      )),

                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('From Youtube',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Normal',
                              fontSize: 10))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('SCORE',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 20))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      // width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('2 - Normal',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[12].clear();
                                      best[12].add(2.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('1 - Moderate',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[12].clear();
                                      best[12].add(1.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('0 - Severe',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[12].clear();
                                      best[12].add(0.0);
                                    },
                                  ))
                        ],
                      )),

///////////////////////// END 13
                  ///
                  ///
///////////////// 14
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 5),
                      child: Text('TIMED UP & GO WITH DUAL TASK [3 METER WALK]',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),

                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: <Widget>[
                  Column(children: [
                    Column(children: [
                      Container(
                          padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                          child: Text(
                              '"When I say ‘Go’, stand up from chair, walk at your normal speed across the tape on the floor, turn around, and come back to sit in the chair."',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 15))),
                      SizedBox(
                          width: 250,
                          child: Image.asset(
                            'assets/images/Best14_Tug.gif',
                            fit: BoxFit.cover,
                          )),
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                          child: Text('From Youtube',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Normal',
                                  fontSize: 10))),
                      Column(children: [
                        Container(
                            child: Text('TIME',
                                style: TextStyle(
                                    color: black,
                                    fontFamily: 'Fancy',
                                    fontSize: 20))),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                                formatTime(_stopwatch_14_1.elapsedMilliseconds),
                                style: TextStyle(
                                    color: black,
                                    fontFamily: 'Fancy',
                                    fontSize: 20))),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  ElevatedButton(
                                      // style: ElevatedButton.styleFrom(
                                      //     backgroundColor: Colors.white),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states1) {
                                            if (states1.contains(
                                                    MaterialState.pressed) ==
                                                true) {
                                              return Colors.blue;
                                            } else {
                                              return Colors.white;
                                            }
                                            // return Colors.greenAccent;
                                          },
                                        ),
                                      ),
                                      child: Container(
                                          // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                          // width: 30,
                                          child: Text(
                                              _stopwatch_14_1.isRunning
                                                  ? 'Stop'
                                                  : 'Start',
                                              style: TextStyle(
                                                  color: black,
                                                  fontFamily: 'Fancy',
                                                  fontSize: 20))),
                                      onPressed: () => setState(
                                            () {
                                              if ((_stopwatch_14_1.isRunning ==
                                                  true)) {
                                                //add bigger or equal test duration
                                                _stopwatch_14_1.stop();
                                              } else {
                                                _stopwatch_14_1.start();
                                              }
                                            },
                                          )),
                                  ElevatedButton(
                                      // style: ElevatedButton.styleFrom(
                                      //     backgroundColor: Colors.white),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states1) {
                                            if (states1.contains(
                                                    MaterialState.pressed) ==
                                                true) {
                                              return Colors.blue;
                                            } else {
                                              return Colors.white;
                                            }
                                            // return Colors.greenAccent;
                                          },
                                        ),
                                      ),
                                      child: Container(
                                          // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                          // width: 30,
                                          child: Text('Reset',
                                              style: TextStyle(
                                                  color: black,
                                                  fontFamily: 'Fancy',
                                                  fontSize: 20))),
                                      onPressed: () => setState(
                                            () {
                                              _stopwatch_14_1.stop();
                                              _stopwatch_14_1.reset();
                                            },
                                          ))
                                ])),
                      ])
                    ]),
                    ////
                    Column(children: [
                      Container(
                          padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                          child: Text(
                              '"Count backwards by threes starting at 100. When I say ‘Go’, stand up from chair, walk at your normal speed across the tape on the floor, turn around, and come back to sit in the chair. Continue counting backwards the entire time."',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 15))),
                      SizedBox(
                          width: 250,
                          child: Image.asset(
                            'assets/images/Best14_Tug_dual.gif',
                            fit: BoxFit.cover,
                          )),
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                          child: Text('From Youtube',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Normal',
                                  fontSize: 10))),
                      Column(children: [
                        Container(
                            child: Text('TIME',
                                style: TextStyle(
                                    color: black,
                                    fontFamily: 'Fancy',
                                    fontSize: 20))),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                                formatTime(_stopwatch_14_2.elapsedMilliseconds),
                                style: TextStyle(
                                    color: black,
                                    fontFamily: 'Fancy',
                                    fontSize: 20))),
                        Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  ElevatedButton(
                                      // style: ElevatedButton.styleFrom(
                                      //     backgroundColor: Colors.white),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states1) {
                                            if (states1.contains(
                                                    MaterialState.pressed) ==
                                                true) {
                                              return Colors.blue;
                                            } else {
                                              return Colors.white;
                                            }
                                            // return Colors.greenAccent;
                                          },
                                        ),
                                      ),
                                      child: Container(
                                          // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                          // width: 30,
                                          child: Text(
                                              _stopwatch_14_2.isRunning
                                                  ? 'Stop'
                                                  : 'Start',
                                              style: TextStyle(
                                                  color: black,
                                                  fontFamily: 'Fancy',
                                                  fontSize: 20))),
                                      onPressed: () => setState(
                                            () {
                                              if ((_stopwatch_14_2.isRunning ==
                                                  true)) {
                                                //add bigger or equal test duration
                                                _stopwatch_14_2.stop();
                                              } else {
                                                _stopwatch_14_2.start();
                                              }
                                            },
                                          )),
                                  ElevatedButton(
                                      // style: ElevatedButton.styleFrom(
                                      //     backgroundColor: Colors.white),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states1) {
                                            if (states1.contains(
                                                    MaterialState.pressed) ==
                                                true) {
                                              return Colors.blue;
                                            } else {
                                              return Colors.white;
                                            }
                                            // return Colors.greenAccent;
                                          },
                                        ),
                                      ),
                                      child: Container(
                                          // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                          // width: 30,
                                          child: Text('Reset',
                                              style: TextStyle(
                                                  color: black,
                                                  fontFamily: 'Fancy',
                                                  fontSize: 20))),
                                      onPressed: () => setState(
                                            () {
                                              _stopwatch_14_2.stop();
                                              _stopwatch_14_2.reset();
                                            },
                                          ))
                                ])),
                      ])
                    ]) //here
                  ]),
///////
                  ///

                  ///
                  ///
                  // Container(
                  //     padding: const EdgeInsets.fromLTRB(20, 5, 20, 30),
                  //     child: Text(
                  //         '"Count backwards by threes starting at ___. When I say ‘Go’, stand up from chair, walk at your normal speed across the tape on the floor, turn around, and come back to sit in the chair. Continue counting backwards the entire time."',
                  //         style: TextStyle(
                  //             color: black,
                  //             fontFamily: 'Fancy',
                  //             fontSize: 10))),

                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: <Widget>[
                  //       SizedBox(width: 30), // space
                  //       SizedBox(
                  //           width: 250,
                  //           child: Image.asset(
                  //             'assets/images/Best14_Tug_dual.gif',
                  //             fit: BoxFit.cover,
                  //           ))
                  //     ]),

                  // Container(
                  //     padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                  //     child: Text('From Youtube',
                  //         style: TextStyle(
                  //             color: black,
                  //             fontFamily: 'Normal',
                  //             fontSize: 10))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      child: Text('SCORE',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 20))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      // width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('2 - Normal',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[13].clear();
                                      best[13].add(2.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('1 - Moderate',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[13].clear();
                                      best[13].add(1.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 120,
                                  child: Text('0 - Severe',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      best[13].clear();
                                      best[13].add(0.0);
                                    },
                                  ))
                        ],
                      )),

///////////////////////// END 14
                  // Container(
                  //     //JUST TO CHECK
                  //     padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                  //     child: Text(general_info[7].toString(),
                  //         style: TextStyle(
                  //             color: black, fontFamily: 'Fancy', fontSize: 30)))
                ])
              ]),
          // Container(
          //   padding: const EdgeInsets.fromLTRB(20, 40, 20, 5),
          //   child: const Text(
          //     'Age	Height	Weight	BMI	Falls12m	AgeGroup(0=young|1=old)	Gender(0=F|1=M)',
          //     style: TextStyle(fontSize: 20),
          //   ),
          // ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Help', //TO ADD LINK
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      // clinical_quest[0].clear(); //CLEAR EVERYTHING IF EXIT
                      // clinical_quest[1].clear();
                      // clinical_quest[2].clear();
                      // clinical_quest[3].clear();
                      // clinical_quest[4].clear();
                      // clinical_quest[5].clear();
                      // clinical_quest[6].clear();
                      // clinical_quest[7].clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuRoute()),
                      );
                    },
                  )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Next',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      best_t = best[0][0] +
                          best[1][0] +
                          best[2][0] +
                          best[3][0] +
                          best[4][0] +
                          best[5][0] +
                          best[6][0] +
                          best[7][0] +
                          best[8][0] +
                          best[9][0] +
                          best[10][0] +
                          best[11][0] +
                          best[12][0] +
                          best[13][0];
                      best[14].clear();
                      best[14].add(best_t);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FourthRoute()),
                      );
                    },
                  )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Quit',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      best[0].clear(); //CLEAR EVERYTHING IF EXIT
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuRoute()),
                      );
                    },
                  ))
        ]))));
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
///
///
///
class FourthRoute extends StatelessWidget {
  //STILL SECOND ROUTE
  const FourthRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Full Assessment Mode - (2/4)',
      home: const SubFourthPage(),
    );
  }
}

class SubFourthPage extends StatefulWidget {
  //STILL SECOND ROUTE
  const SubFourthPage({Key? key}) : super(key: key);

  @override
  _SubFourthPageState createState() => _SubFourthPageState();
}

//
class _SubFourthPageState extends State<SubFourthPage> {
  //STILL SECOND ROUTE
  // this will be displayed on the screen
  // double fes_s = fes[0][0] +
  //     fes[1][0] +
  //     fes[2][0] +
  //     fes[3][0] +
  //     fes[4][0] +
  //     fes[5][0] +
  //     fes[6][0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, //remove back button
          backgroundColor: grey,
          title: const Text('Full Assessment Mode - (2/4)',
              style:
                  TextStyle(color: black, fontFamily: 'Fancy', fontSize: 45)),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
          Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
              child: Row(
                  //steps images
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(children: <Widget>[
                      SizedBox(
                          width: 125,
                          child: Image.asset(
                            'assets/images/clinical_test_Quest.png',
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                          child: const Text(
                              'Clinical Tests & Questionnaires (3/3) - Short FES-I',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 35)))
                    ])
                  ])),
          Row(
              //steps images
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(children: <Widget>[
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text('Getting dressed or undressed',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      // width: 800,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding:
                                  // const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // //width: 90,
                                  //height: 45,
                                  child: Text('1 - Not at all concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[0].clear();
                                      fes[0].add(1.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // //width: 90,
                                  //height: 45,
                                  child: Text('2 - Somewhat concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[0].clear();
                                      fes[0].add(2.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // //width: 90,
                                  //height: 45,
                                  child: Text('3 - Fairly concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[0].clear();
                                      fes[0].add(3.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 90,
                                  // height: 45,
                                  child: Text('4 - Very concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[0].clear();
                                      fes[0].add(4.0);
                                    },
                                  ))
                        ],
                      )),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text('Taking a bath or shower',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      //width: 800,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding:
                                  // const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 90,
                                  // height: 45,
                                  child: Text('1 - Not at all concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[1].clear();
                                      fes[1].add(1.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  // width: 90,
                                  // height: 45,
                                  child: Text('2 - Somewhat concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[1].clear();
                                      fes[1].add(2.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('3 - Fairly concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[1].clear();
                                      fes[1].add(3.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('4 - Very concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[1].clear();
                                      fes[1].add(4.0);
                                    },
                                  ))
                        ],
                      )),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text('Getting in or out of a chair',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      //width: 800,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding:
                                  // const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('1 - Not at all concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[2].clear();
                                      fes[2].add(1.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('2 - Somewhat concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[2].clear();
                                      fes[2].add(2.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('3 - Fairly concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[2].clear();
                                      fes[2].add(3.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('4 - Very concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[2].clear();
                                      fes[2].add(4.0);
                                    },
                                  ))
                        ],
                      )),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text('Going up or down stairs',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      //width: 800,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding:
                                  // const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('1 - Not at all concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[3].clear();
                                      fes[3].add(1.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('2 - Somewhat concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[3].clear();
                                      fes[3].add(2.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('3 - Fairly concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[3].clear();
                                      fes[3].add(3.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('4 - Very concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[3].clear();
                                      fes[3].add(4.0);
                                    },
                                  ))
                        ],
                      )),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text(
                          'Reaching for something above your head or on the ground',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      //width: 800,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding:
                                  // const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('1 - Not at all concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[4].clear();
                                      fes[4].add(1.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('2 - Somewhat concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[4].clear();
                                      fes[4].add(2.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('3 - Fairly concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[4].clear();
                                      fes[4].add(3.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('4 - Very concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[4].clear();
                                      fes[4].add(4.0);
                                    },
                                  ))
                        ],
                      )),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text('Walking up or down a slope',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      //width: 800,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding:
                                  // const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('1 - Not at all concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[5].clear();
                                      fes[5].add(1.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('2 - Somewhat concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[5].clear();
                                      fes[5].add(2.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('3 - Fairly concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[5].clear();
                                      fes[5].add(3.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('4 - Very concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[5].clear();
                                      fes[5].add(4.0);
                                    },
                                  ))
                        ],
                      )),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                      child: Text(
                          'Going out to a social event (for example, religious service, family gathering or club meeting)',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Fancy',
                              fontSize: 30))),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      //width: 800,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding:
                                  // const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('1 - Not at all concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[6].clear();
                                      fes[6].add(1.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('2 - Somewhat concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[6].clear();
                                      fes[6].add(2.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('3 - Fairly concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[6].clear();
                                      fes[6].add(3.0);
                                    },
                                  )),
                          ElevatedButton(
                              // style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states1) {
                                    if (states1
                                            .contains(MaterialState.pressed) ==
                                        true) {
                                      return Colors.green;
                                    } else {
                                      return Colors.white;
                                    }
                                    // return Colors.greenAccent;
                                  },
                                ),
                              ),
                              child: Container(
                                  // padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                  //width: 90,
                                  //height: 45,
                                  child: Text('4 - Very concerned',
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 20))),
                              onPressed: () => setState(
                                    () {
                                      fes[6].clear();

                                      fes[6].add(4.0);
                                    },
                                  ))
                        ],
                      )),

                  // Container(
                  //     //JUST TO CHECK
                  //     padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                  //     child: Text(general_info[7].toString(),
                  //         style: TextStyle(
                  //             color: black, fontFamily: 'Fancy', fontSize: 30)))
                ])
              ]),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Help', //TO ADD LINK
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      // clinical_quest[0].clear(); //CLEAR EVERYTHING IF EXIT
                      // clinical_quest[1].clear();
                      // clinical_quest[2].clear();
                      // clinical_quest[3].clear();
                      // clinical_quest[4].clear();
                      // clinical_quest[5].clear();
                      // clinical_quest[6].clear();
                      // clinical_quest[7].clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuRoute()),
                      );
                    },
                  )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Next',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      if ((fes[0][0] +
                              fes[1][0] +
                              fes[2][0] +
                              fes[3][0] +
                              fes[4][0] +
                              fes[5][0] +
                              fes[6][0]) >=
                          14) {
                        //High
                        clinical_quest[8].clear();
                        clinical_quest[8].add(3.0);
                      } else if (((fes[0][0] +
                                  fes[1][0] +
                                  fes[2][0] +
                                  fes[3][0] +
                                  fes[4][0] +
                                  fes[5][0] +
                                  fes[6][0]) <
                              14) &&
                          ((fes[0][0] +
                                  fes[1][0] +
                                  fes[2][0] +
                                  fes[3][0] +
                                  fes[4][0] +
                                  fes[5][0] +
                                  fes[6][0]) >=
                              9)) {
                        //Moderate
                        clinical_quest[8].clear();
                        clinical_quest[8].add(2.0);

                        ////// OR CONDITION 3 LOW
                      } else {
                        //Low
                        clinical_quest[8].clear();
                        clinical_quest[8].add(1.0);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FifthRoute()),
                      );
                    },
                  )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Quit',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuRoute()),
                      );
                    },
                  ))
        ]))));
  }
}

/////////////////////////////////////////////////////////////
///
///
///
class FifthRoute extends StatelessWidget {
  //STILL SECOND ROUTE
  const FifthRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Full Assessment Mode - (3/4)',
      home: const SubFifthPage(),
    );
  }
}

class SubFifthPage extends StatefulWidget {
  //STILL SECOND ROUTE
  const SubFifthPage({Key? key}) : super(key: key);

  @override
  _SubFifthPageState createState() => _SubFifthPageState();
}

//
class _SubFifthPageState extends State<SubFifthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, //remove back button
          backgroundColor: grey,
          title: const Text('Full Assessment Mode - (3/4)',
              style:
                  TextStyle(color: black, fontFamily: 'Fancy', fontSize: 45)),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
          Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
              child: Row(
                  //steps images
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(children: <Widget>[
                      SizedBox(
                          width: 250, //125
                          child: Image.asset(
                            'assets/images/Standing_Test.png',
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                          child: const Text('MakerRehab© Balance Test',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 35))),
                      Container(
                          padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                          child: Text(
                              'Attach the device at the lower back (S2) and press "Next" when you are ready',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 30))),
                    ])
                  ])),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Next',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SixthRoute()),
                      );
                    },
                  )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Quit',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuRoute()),
                      );
                    },
                  ))
        ]))));
  }
}

///
///
String formatTime2(int milliseconds) {
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');

  return "${milliseconds / 1000}";
}

///
class SixthRoute extends StatelessWidget {
  //STILL SECOND ROUTE
  const SixthRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Full Assessment Mode - (3/4)',
      home: const SubSixthPage(),
    );
  }
}

class SubSixthPage extends StatefulWidget {
  //STILL SECOND ROUTE
  const SubSixthPage({Key? key}) : super(key: key);
// ignore: non_constant_identifier_names
// late List<List<dynamic>> collected_data = [[], [], []];
  @override
  _SubSixthPageState createState() => _SubSixthPageState();
}

//
class _SubSixthPageState extends State<SubSixthPage> {
  // ignore: non_constant_identifier_names
  // late List<List<dynamic>> collected_data = [[], [], []];
  late Stopwatch _stopwatchgo; //initialize the stopwatch
  late Timer _timer; //initialize the stopwatch
  List<dynamic> Time = [];
  int _time = 0;

  List<dynamic> _updateTime(Timer timer) {
    setState(() {
      // _stopwatch.isRunning ? _time++ : _time = 0;
      _stopwatchgo.isRunning
          ? _time = _stopwatchgo.elapsedMilliseconds
          : _time = 0;
      _stopwatchgo.isRunning ? Time.add(_time / 1000) : null; //in s
      collected_data[0] = Time;
    });
    return collected_data[0];
  }

  double x = 0, y = 0, z = 0; //initialize the accelerometer
  Map direction = {'x': 0, 'y': 0, 'z': 0}; //initialize the accelerometer

  @override
  void initState() {
    super.initState();

    ///time
    _stopwatchgo = Stopwatch();
    _timer = Timer.periodic(
        const Duration(milliseconds: 10), _updateTime); //_updateTime
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, //remove back button
          backgroundColor: grey,
          title: const Text('Full Assessment Mode - (3/4)',
              style:
                  TextStyle(color: black, fontFamily: 'Fancy', fontSize: 45)),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
          Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
              child: Row(
                  //steps images
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(children: <Widget>[
                      SizedBox(
                          width: 125, //125
                          child: Image.asset(
                            'assets/images/Standing_Test.png',
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                          child: const Text('MakerRehab© Balance Test - (1/4)',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 35))),
                      Container(
                          padding: const EdgeInsets.fromLTRB(20, 60, 20, 10),
                          child: Text(
                              '"Stand barefoot on the floor with your eyes open for about 30 seconds as still as possible. On my go the test starts and when I say stop it stops. Ready? GO! ..."',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 30))),
                      Container(
                          padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                          width: 250, //125
                          child: Image.asset(
                            'assets/images/go.png',
                            fit: BoxFit.cover,
                          )),

                      Container(
                          padding: const EdgeInsets.fromLTRB(20, 60, 20, 15),
                          child: Text(
                            double.parse(formatTime2(
                                    _stopwatchgo.elapsedMilliseconds))
                                .toStringAsFixed(0),
                            style: TextStyle(
                                color: black,
                                fontFamily: 'Fancy',
                                fontSize: 65),
                          )),
                      Row(
                          //steps images
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: FloatingActionButton(
                                    // child: Icon(_stopwatch.isRunning? Icons.clear_all : Icons.clear_all),
                                    backgroundColor: black,
                                    child: const Icon(Icons.start),
                                    tooltip: 'Start',
                                    onPressed: () {
                                      setState(() {
                                        _time = 0;
                                        collected_data[0].clear();
                                        collected_data[1].clear();
                                        collected_data[2].clear();
                                        userAccelerometerEvents.listen(
                                            (UserAccelerometerEvent event) {
                                          x = event.x;
                                          y = event.y;
                                          z = event.z;
                                          // UserAccelerometerEvent sensorAccelerometer =
                                          //     UserAccelerometerEvent(x, y, z);

                                          direction = {
                                            // 'x': x.toStringAsFixed(3),
                                            // 'y': y.toStringAsFixed(3),
                                            // 'z': z.toStringAsFixed(3)
                                            'x': x,
                                            'y': y,
                                            'z': z
                                          };
                                          _stopwatchgo.isRunning
                                              ? collected_data[1].add(z)
                                              : null;
                                          _stopwatchgo.isRunning
                                              ? collected_data[2].add(x)
                                              : null;
                                          setState(() {});
                                        });
                                        _stopwatchgo.start();
                                      });
                                    })), ////
                            Container(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: FloatingActionButton(
                                    child: const Icon(Icons.stop),
                                    backgroundColor: black,
                                    tooltip: 'Stop',
                                    onPressed: () {
                                      setState(() {
                                        _stopwatchgo.stop();
                                        _stopwatchgo.reset();
                                      });
                                    })),
                          ])
                      ////////
                    ])
                  ])),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Next',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SeventhRoute()),
                      );
                    },
                  )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Quit',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuRoute()),
                      );
                    },
                  ))
        ]))));
  }
}
/////////////////////////

String formatTime3(int milliseconds) {
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');

  return "${milliseconds / 1000}";
}

///
class SeventhRoute extends StatelessWidget {
  //STILL SECOND ROUTE
  const SeventhRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Full Assessment Mode - (3/4)',
      home: const SubSeventhPage(),
    );
  }
}

class SubSeventhPage extends StatefulWidget {
  //STILL SECOND ROUTE
  const SubSeventhPage({Key? key}) : super(key: key);
// ignore: non_constant_identifier_names
// late List<List<dynamic>> collected_data = [[], [], []];
  @override
  _SubSeventhPageState createState() => _SubSeventhPageState();
}

//
class _SubSeventhPageState extends State<SubSeventhPage> {
  // ignore: non_constant_identifier_names
  // late List<List<dynamic>> collected_data = [[], [], []];
  late Stopwatch _stopwatchgc; //initialize the stopwatch
  late Timer _timer; //initialize the stopwatch
  List<dynamic> Time = [];
  int _time = 0;

  List<dynamic> _updateTime(Timer timer) {
    setState(() {
      // _stopwatch.isRunning ? _time++ : _time = 0;
      _stopwatchgc.isRunning
          ? _time = _stopwatchgc.elapsedMilliseconds
          : _time = 0;
      _stopwatchgc.isRunning ? Time.add(_time / 1000) : null; //in s
      collected_data[3] = Time;
    });
    return collected_data[3];
  }

  double x = 0, y = 0, z = 0; //initialize the accelerometer
  Map direction = {'x': 0, 'y': 0, 'z': 0}; //initialize the accelerometer

  @override
  void initState() {
    super.initState();

    ///time
    _stopwatchgc = Stopwatch();
    _timer = Timer.periodic(
        const Duration(milliseconds: 10), _updateTime); //_updateTime
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, //remove back button
          backgroundColor: grey,
          title: const Text('Full Assessment Mode - (3/4)',
              style:
                  TextStyle(color: black, fontFamily: 'Fancy', fontSize: 45)),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
          Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
              child: Row(
                  //steps images
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(children: <Widget>[
                      SizedBox(
                          width: 125, //125
                          child: Image.asset(
                            'assets/images/Standing_Test.png',
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                          child: const Text('MakerRehab© Balance Test - (2/4)',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 35))),
                      Container(
                          padding: const EdgeInsets.fromLTRB(20, 60, 20, 10),
                          child: Text(
                              '"Stand barefoot on the floor with your eyes closed for about 30 seconds as still as possible. On my go the test starts and when I say stop it stops. Ready? GO! ..."',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 30))),
                      Container(
                          padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                          width: 250, //125
                          child: Image.asset(
                            'assets/images/gc.png',
                            fit: BoxFit.cover,
                          )),

                      Container(
                          padding: const EdgeInsets.fromLTRB(20, 60, 20, 15),
                          child: Text(
                            double.parse(formatTime3(
                                    _stopwatchgc.elapsedMilliseconds))
                                .toStringAsFixed(0),
                            style: TextStyle(
                                color: black,
                                fontFamily: 'Fancy',
                                fontSize: 65),
                          )),
                      Row(
                          //steps images
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: FloatingActionButton(
                                    // child: Icon(_stopwatch.isRunning? Icons.clear_all : Icons.clear_all),
                                    backgroundColor: black,
                                    child: const Icon(Icons.start),
                                    tooltip: 'Start',
                                    onPressed: () {
                                      setState(() {
                                        _time = 0;
                                        collected_data[3].clear();
                                        collected_data[4].clear();
                                        collected_data[5].clear();
                                        userAccelerometerEvents.listen(
                                            (UserAccelerometerEvent event) {
                                          x = event.x;
                                          y = event.y;
                                          z = event.z;
                                          // UserAccelerometerEvent sensorAccelerometer =
                                          //     UserAccelerometerEvent(x, y, z);

                                          direction = {
                                            // 'x': x.toStringAsFixed(3),
                                            // 'y': y.toStringAsFixed(3),
                                            // 'z': z.toStringAsFixed(3)
                                            'x': x,
                                            'y': y,
                                            'z': z
                                          };
                                          _stopwatchgc.isRunning
                                              ? collected_data[4].add(z)
                                              : null;
                                          _stopwatchgc.isRunning
                                              ? collected_data[5].add(x)
                                              : null;
                                          setState(() {});
                                        });
                                        _stopwatchgc.start();
                                      });
                                    })), ////
                            Container(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: FloatingActionButton(
                                    child: const Icon(Icons.stop),
                                    backgroundColor: black,
                                    tooltip: 'Stop',
                                    onPressed: () {
                                      setState(() {
                                        _stopwatchgc.stop();
                                        _stopwatchgc.reset();
                                      });
                                    })),
                          ])
                      ////////
                    ])
                  ])),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Next',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EighthRoute()),
                      );
                    },
                  )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Quit',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuRoute()),
                      );
                    },
                  ))
        ]))));
  }
}
/////////////////////////

String formatTime4(int milliseconds) {
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');

  return "${milliseconds / 1000}";
}

///
class EighthRoute extends StatelessWidget {
  //STILL SECOND ROUTE
  const EighthRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Full Assessment Mode - (3/4)',
      home: const SubEighthPage(),
    );
  }
}

class SubEighthPage extends StatefulWidget {
  //STILL SECOND ROUTE
  const SubEighthPage({Key? key}) : super(key: key);
// ignore: non_constant_identifier_names
// late List<List<dynamic>> collected_data = [[], [], []];
  @override
  _SubEighthPageState createState() => _SubEighthPageState();
}

//
class _SubEighthPageState extends State<SubEighthPage> {
  // ignore: non_constant_identifier_names
  // late List<List<dynamic>> collected_data = [[], [], []];
  late Stopwatch _stopwatchfo; //initialize the stopwatch
  late Timer _timer; //initialize the stopwatch
  List<dynamic> Time = [];
  int _time = 0;

  List<dynamic> _updateTime(Timer timer) {
    setState(() {
      // _stopwatch.isRunning ? _time++ : _time = 0;
      _stopwatchfo.isRunning
          ? _time = _stopwatchfo.elapsedMilliseconds
          : _time = 0;
      _stopwatchfo.isRunning ? Time.add(_time / 1000) : null; //in s
      collected_data[6] = Time;
    });
    return collected_data[6];
  }

  double x = 0, y = 0, z = 0; //initialize the accelerometer
  Map direction = {'x': 0, 'y': 0, 'z': 0}; //initialize the accelerometer

  @override
  void initState() {
    super.initState();

    ///time
    _stopwatchfo = Stopwatch();
    _timer = Timer.periodic(
        const Duration(milliseconds: 10), _updateTime); //_updateTime
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, //remove back button
          backgroundColor: grey,
          title: const Text('Full Assessment Mode - (3/4)',
              style:
                  TextStyle(color: black, fontFamily: 'Fancy', fontSize: 45)),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
          Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
              child: Row(
                  //steps images
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(children: <Widget>[
                      SizedBox(
                          width: 125, //125
                          child: Image.asset(
                            'assets/images/Standing_Test.png',
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                          child: const Text('MakerRehab© Balance Test - (3/4)',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 35))),
                      Container(
                          padding: const EdgeInsets.fromLTRB(20, 60, 20, 10),
                          child: Text(
                              '"Stand barefoot on the foam with your eyes open for about 30 seconds as still as possible. On my go the test starts and when I say stop it stops. Ready? GO! ..."',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 30))),
                      Container(
                          padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                          width: 250, //125
                          child: Image.asset(
                            'assets/images/fo.png',
                            fit: BoxFit.cover,
                          )),

                      Container(
                          padding: const EdgeInsets.fromLTRB(20, 60, 20, 15),
                          child: Text(
                            double.parse(formatTime3(
                                    _stopwatchfo.elapsedMilliseconds))
                                .toStringAsFixed(0),
                            style: TextStyle(
                                color: black,
                                fontFamily: 'Fancy',
                                fontSize: 65),
                          )),
                      Row(
                          //steps images
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: FloatingActionButton(
                                    // child: Icon(_stopwatch.isRunning? Icons.clear_all : Icons.clear_all),
                                    backgroundColor: black,
                                    child: const Icon(Icons.start),
                                    tooltip: 'Start',
                                    onPressed: () {
                                      setState(() {
                                        _time = 0;
                                        collected_data[6].clear();
                                        collected_data[7].clear();
                                        collected_data[8].clear();
                                        userAccelerometerEvents.listen(
                                            (UserAccelerometerEvent event) {
                                          x = event.x;
                                          y = event.y;
                                          z = event.z;
                                          // UserAccelerometerEvent sensorAccelerometer =
                                          //     UserAccelerometerEvent(x, y, z);

                                          direction = {
                                            // 'x': x.toStringAsFixed(3),
                                            // 'y': y.toStringAsFixed(3),
                                            // 'z': z.toStringAsFixed(3)
                                            'x': x,
                                            'y': y,
                                            'z': z
                                          };
                                          _stopwatchfo.isRunning
                                              ? collected_data[7].add(z)
                                              : null;
                                          _stopwatchfo.isRunning
                                              ? collected_data[8].add(x)
                                              : null;
                                          setState(() {});
                                        });
                                        _stopwatchfo.start();
                                      });
                                    })), ////
                            Container(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: FloatingActionButton(
                                    child: const Icon(Icons.stop),
                                    backgroundColor: black,
                                    tooltip: 'Stop',
                                    onPressed: () {
                                      setState(() {
                                        _stopwatchfo.stop();
                                        _stopwatchfo.reset();
                                      });
                                    })),
                          ])
                      ////////
                    ])
                  ])),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Next',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NinethRoute()),
                      );
                    },
                  )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Quit',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuRoute()),
                      );
                    },
                  ))
        ]))));
  }
}
/////////////////////////
/////////////////////////

String formatTime5(int milliseconds) {
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');

  return "${milliseconds / 1000}";
}

///
class NinethRoute extends StatelessWidget {
  //STILL SECOND ROUTE
  const NinethRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Full Assessment Mode - (3/4)',
      home: const SubNinethPage(),
    );
  }
}

class SubNinethPage extends StatefulWidget {
  //STILL SECOND ROUTE
  const SubNinethPage({Key? key}) : super(key: key);
// ignore: non_constant_identifier_names
// late List<List<dynamic>> collected_data = [[], [], []];
  @override
  _SubNinethPageState createState() => _SubNinethPageState();
}

//
class _SubNinethPageState extends State<SubNinethPage> {
// ignore: non_constant_identifier_names
  // late List<List<dynamic>> collected_data = [[], [], []];
  late Stopwatch _stopwatchfc; //initialize the stopwatch
  late Timer _timer; //initialize the stopwatch
  List<dynamic> Time = [];
  int _time = 0;

  List<dynamic> _updateTime(Timer timer) {
    setState(() {
      // _stopwatch.isRunning ? _time++ : _time = 0;
      _stopwatchfc.isRunning
          ? _time = _stopwatchfc.elapsedMilliseconds
          : _time = 0;
      _stopwatchfc.isRunning ? Time.add(_time / 1000) : null; //in s
      collected_data[9] = Time;
    });
    return collected_data[9];
  }

  double x = 0, y = 0, z = 0; //initialize the accelerometer
  Map direction = {'x': 0, 'y': 0, 'z': 0}; //initialize the accelerometer

  @override
  void initState() {
    super.initState();

    ///time
    _stopwatchfc = Stopwatch();
    _timer = Timer.periodic(
        const Duration(milliseconds: 10), _updateTime); //_updateTime
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, //remove back button
          backgroundColor: grey,
          title: const Text('Full Assessment Mode - (3/4)',
              style:
                  TextStyle(color: black, fontFamily: 'Fancy', fontSize: 45)),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
          Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
              child: Row(
                  //steps images
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(children: <Widget>[
                      SizedBox(
                          width: 125, //125
                          child: Image.asset(
                            'assets/images/Standing_Test.png',
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                          child: const Text('MakerRehab© Balance Test - (4/4)',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 35))),
                      Container(
                          padding: const EdgeInsets.fromLTRB(20, 60, 20, 10),
                          child: Text(
                              '"Stand barefoot on the foam with your eyes closed for about 30 seconds as still as possible. On my go the test starts and when I say stop it stops. Ready? GO! ..."',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 30))),
                      Container(
                          padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                          width: 250, //125
                          child: Image.asset(
                            'assets/images/fc.png',
                            fit: BoxFit.cover,
                          )),

                      Container(
                          padding: const EdgeInsets.fromLTRB(20, 60, 20, 15),
                          child: Text(
                            double.parse(formatTime3(
                                    _stopwatchfc.elapsedMilliseconds))
                                .toStringAsFixed(0),
                            style: TextStyle(
                                color: black,
                                fontFamily: 'Fancy',
                                fontSize: 65),
                          )),
                      Row(
                          //steps images
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: FloatingActionButton(
                                    // child: Icon(_stopwatch.isRunning? Icons.clear_all : Icons.clear_all),
                                    backgroundColor: black,
                                    child: const Icon(Icons.start),
                                    tooltip: 'Start',
                                    onPressed: () {
                                      setState(() {
                                        _time = 0;
                                        collected_data[9].clear();
                                        collected_data[10].clear();
                                        collected_data[11].clear();
                                        userAccelerometerEvents.listen(
                                            (UserAccelerometerEvent event) {
                                          x = event.x;
                                          y = event.y;
                                          z = event.z;
                                          // UserAccelerometerEvent sensorAccelerometer =
                                          //     UserAccelerometerEvent(x, y, z);

                                          direction = {
                                            // 'x': x.toStringAsFixed(3),
                                            // 'y': y.toStringAsFixed(3),
                                            // 'z': z.toStringAsFixed(3)
                                            'x': x,
                                            'y': y,
                                            'z': z
                                          };
                                          _stopwatchfc.isRunning
                                              ? collected_data[10].add(z)
                                              : null;
                                          _stopwatchfc.isRunning
                                              ? collected_data[11].add(x)
                                              : null;
                                          setState(() {});
                                        });
                                        _stopwatchfc.start();
                                      });
                                    })), ////
                            Container(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: FloatingActionButton(
                                    child: const Icon(Icons.stop),
                                    backgroundColor: black,
                                    tooltip: 'Stop',
                                    onPressed: () {
                                      setState(() {
                                        _stopwatchfc.stop();
                                        _stopwatchfc.reset();
                                      });
                                    })),
                          ])
                      ////////
                    ])
                  ])),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Results', // add comm with api
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TenthRoute()),
                      );
                    },
                  )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Quit',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuRoute()),
                      );
                    },
                  ))
        ]))));
  }
}

////////////////////////////////////////
///
///////////////////////////////////////
class TenthRoute extends StatelessWidget {
  //STILL SECOND ROUTE
  const TenthRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Full Assessment Mode - (4/4)',
      home: const SubTenthPage(),
    );
  }
}

class SubTenthPage extends StatefulWidget {
  //STILL SECOND ROUTE
  const SubTenthPage({Key? key}) : super(key: key);
// ignore: non_constant_identifier_names
// late List<List<dynamic>> collected_data = [[], [], []];
  @override
  _SubTenthPageState createState() => _SubTenthPageState();
}

//
class _SubTenthPageState extends State<SubTenthPage> {
// class TenthRoute extends StatelessWidget {
//   const TenthRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, //remove back button
          backgroundColor: grey,
          title: const Text('Full Assessment Mode - (4/4)',
              style:
                  TextStyle(color: black, fontFamily: 'Fancy', fontSize: 45)),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
          Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
              child: Row(
                  //steps images
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(children: <Widget>[
                      SizedBox(
                          width: 325, //125
                          child: Image.asset(
                            'assets/images/APP_LOGO_Final.png',
                            fit: BoxFit.cover,
                          )),
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: const Text('Clinical Report',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: black,
                                  fontFamily: 'Fancy',
                                  fontSize: 70))),
// First row
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 50),
                          child: Row(
                              //steps images
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 80, 0),
                                  // height: 200,
                                  // width:
                                  //     MediaQuery.of(context).size.width * 0.975,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    // border: Border.all(
                                    //   color: black,
                                    //   width: 5,
                                    // )
                                  ),
                                  child: Text('First Name: John',
                                      // "Last Name: ${general_info[0][0]}",
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 30)),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(80, 0, 0, 0),
                                  // padding:
                                  //     const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                  // height: 200,
                                  // width:
                                  //     MediaQuery.of(context).size.width * 0.975,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    // border: Border.all(
                                    //   color: black,
                                    //   width: 5,
                                    // )
                                  ),
                                  child: Text('Last Name: Doe',
                                      // "Last Name: ${general_info[1][0]}",
                                      style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 30)),
                                ),
                              ])),
                      // Second row : GI box
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: black,
                                width: 3,
                              )),
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),

                          ///column with 4 rows containig and 0, Logo et label, 1 legend, 2 general info et 3 clicical tests score(= column with 3 rows and 1 label, 2 score arrow output, 3 bar chart)
                          child: Column(children: <Widget>[
                            Column(
                                //row 1 legend
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                      //steps images
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                            width: 60, //125
                                            child: Image.asset(
                                              'assets/images/General_info.png',
                                              fit: BoxFit.cover,
                                            )),
                                        Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 0, 20, 0),
                                            child: const Text(
                                                'General Information',
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: black,
                                                    fontFamily: 'Fancy',
                                                    fontSize: 35)))
                                      ]),
                                ]), //
                            Row(
                                //row 2 general info
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    //age
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 40, 50, 0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text('Age (years) : 78',
                                        // "Last Name: ${general_info[0][0]}",
                                        style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 25,
                                        )),
                                  ),
                                  Container(
                                    //Height
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 40, 50, 0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text('Height (cm) : 198',
                                        // "Last Name: ${general_info[0][0]}",
                                        style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 25,
                                        )),
                                  ),
                                  Container(
                                    //age
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 40, 50, 0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text('Weight (kg) : 121',
                                        // "Last Name: ${general_info[0][0]}",
                                        style: TextStyle(
                                            color: black,
                                            fontFamily: 'Fancy',
                                            fontSize: 25)),
                                  ),
                                  Container(
                                    //age
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 40, 50, 0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                        'BMI (kg.m^2) : ${double.parse((121 / (1.98 * 1.98)).toStringAsFixed(2))}',
                                        // "Last Name: ${general_info[0][0]}",
                                        style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 25,
                                        )),
                                  ),
                                  Container(
                                    //age
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 40, 50, 0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                        'Gender at Birth : Male', //add bool operand
                                        // "Last Name: ${general_info[0][0]}",
                                        style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 25,
                                        )),
                                  ),
                                  Container(
                                    //age
                                    padding: const EdgeInsets.fromLTRB(
                                        50, 40, 20, 0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                        'Fall History (Last 12 months) : 8',
                                        // "Last Name: ${general_info[0][0]}",
                                        style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 25,
                                        )),
                                  ),
                                ]),
                          ])),
                      ////////
                      // Third row : CTQ box
                      Container(height: 80),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: black,
                                width: 3,
                              )),
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),

                          //  HERE ///column with 4 rows containig and 0, Logo et label, 1 legend, 2 general info et 3 clicical tests score(= column with 3 rows and 1 label, 2 score arrow output, 3 bar chart)
                          child: Column(children: <Widget>[
                            Column(
                                //row 1 legend
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                      //steps images
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                            width: 75, //125
                                            child: Image.asset(
                                              'assets/images/clinical_test_Quest.png',
                                              fit: BoxFit.cover,
                                            )),
                                        Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 0, 20, 0),
                                            child: const Text(
                                                'Clinical Tests & Questionnaires',
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: black,
                                                    fontFamily: 'Fancy',
                                                    fontSize: 35)))
                                      ]),
                                ]), //
                            Row(
                                //row 2 ctq
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    //age
                                    padding: const EdgeInsets.fromLTRB(
                                        50, 40, 50, 20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Column(children: [
                                      Text('Physical Activity (Short IPAQ)',
                                          // "Last Name: ${general_info[0][0]}",
                                          style: TextStyle(
                                            color: black,
                                            fontFamily: 'Fancy',
                                            fontSize: 25,
                                          )),
                                      Row(
                                          //Score and Lable with arrow
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                child: Text('Score',
                                                    // "Last Name: ${general_info[0][0]}",
                                                    style: TextStyle(
                                                      color: black,
                                                      fontFamily: 'Fancy',
                                                      fontSize: 20,
                                                    ))),
                                            Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 50, 20, 50),
                                                child: Image.asset(
                                                  width: 50,
                                                  'assets/images/arrow.png',
                                                  fit: BoxFit.cover,
                                                )),
                                            Container(
                                                child: Text('Moderate',
                                                    // "Last Name: ${general_info[0][0]}",
                                                    style: TextStyle(
                                                        color: black,
                                                        fontFamily: 'Fancy',
                                                        fontSize: 20,
                                                        fontStyle:
                                                            FontStyle.italic))),
                                          ])
                                    ]),
                                  ),
                                  Container(
                                    //empty 1
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text('',
                                        // "Last Name: ${general_info[0][0]}",
                                        style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 25,
                                        )),
                                  ),
                                  Container(
                                    //age
                                    padding: const EdgeInsets.fromLTRB(
                                        50, 40, 50, 20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Column(children: [
                                      Text('Subjective Balance (mini-BEST)',
                                          // "Last Name: ${general_info[0][0]}",
                                          style: TextStyle(
                                            color: black,
                                            fontFamily: 'Fancy',
                                            fontSize: 25,
                                          )),
                                      Row(
                                          //Score and Lable with arrow
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                child: Text('Score',
                                                    // "Last Name: ${general_info[0][0]}",
                                                    style: TextStyle(
                                                      color: black,
                                                      fontFamily: 'Fancy',
                                                      fontSize: 20,
                                                    ))),
                                            Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 50, 20, 50),
                                                child: Image.asset(
                                                  width: 50,
                                                  'assets/images/arrow.png',
                                                  fit: BoxFit.cover,
                                                )),
                                            Container(
                                                child: Text('Poor - (12/28)',
                                                    // "Last Name: ${general_info[0][0]}",
                                                    style: TextStyle(
                                                        color: black,
                                                        fontFamily: 'Fancy',
                                                        fontSize: 20,
                                                        fontStyle:
                                                            FontStyle.italic))),
                                          ])
                                    ]),
                                  ),
                                  Container(
                                    //empty 2
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text('',
                                        // "Last Name: ${general_info[0][0]}",
                                        style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 25,
                                        )),
                                  ),
                                  Container(
                                    //age
                                    padding: const EdgeInsets.fromLTRB(
                                        50, 40, 50, 20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Column(children: [
                                      Text('Fear of Falling (FES-I)',
                                          // "Last Name: ${general_info[0][0]}",
                                          style: TextStyle(
                                            color: black,
                                            fontFamily: 'Fancy',
                                            fontSize: 25,
                                          )),
                                      Row(
                                          //Score and Lable with arrow
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                child: Text('Score',
                                                    // "Last Name: ${general_info[0][0]}",
                                                    style: TextStyle(
                                                      color: black,
                                                      fontFamily: 'Fancy',
                                                      fontSize: 20,
                                                    ))),
                                            Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 50, 20, 50),
                                                child: Image.asset(
                                                  width: 50,
                                                  'assets/images/arrow.png',
                                                  fit: BoxFit.cover,
                                                )),
                                            Container(
                                                child: Text('High - 19/28',
                                                    // "Last Name: ${general_info[0][0]}",
                                                    style: TextStyle(
                                                        color: black,
                                                        fontFamily: 'Fancy',
                                                        fontSize: 20,
                                                        fontStyle:
                                                            FontStyle.italic))),
                                          ])
                                    ]),
                                  ),
                                  Container(
                                    //empty
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text('',
                                        // "Last Name: ${general_info[0][0]}",
                                        style: TextStyle(
                                          color: black,
                                          fontFamily: 'Fancy',
                                          fontSize: 25,
                                        )),
                                  ),
                                ]),
                          ])),

                      ///
                      ///
                      ///
                      ///
                      ///
                      ///
                      ///
                      ///
                      ///
                      ///
                      ///
                      ///
                      ///
                      ///
                      ///
                      ///
                      ////////
                      // THIRD row : Makerbt
                      Container(height: 80),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: black,
                                width: 3,
                              )),
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),

                          //  HERE ///column with 4 rows containig and 0, Logo et label, 1 legend, 2 general info et 3 clicical tests score(= column with 3 rows and 1 label, 2 score arrow output, 3 bar chart)
                          child: Column(children: <Widget>[
                            Column(
                                //row 1 legend
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                      //steps images
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                            width: 50, //125
                                            child: Image.asset(
                                              'assets/images/Standing_Test.png',
                                              fit: BoxFit.cover,
                                            )),
                                        Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 0, 20, 0),
                                            child: const Text(
                                                'MakerRehab© Balance Test',
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: black,
                                                    fontFamily: 'Fancy',
                                                    fontSize: 35)))
                                      ]),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                    // height: 200,
                                    // width:
                                    //     MediaQuery.of(context).size.width * 0.975,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      // border: Border.all(
                                      //   color: black,
                                      //   width: 5,
                                      // )
                                    ),
                                    child: Text(
                                        'Legend : 0 = Patient Value  |   1 = Pathologic Value',
                                        // "Last Name: ${general_info[0][0]}",
                                        style: TextStyle(
                                            color: black,
                                            fontFamily: 'Normal',
                                            fontSize: 15,
                                            fontStyle: FontStyle.italic)),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                    // height: 200,
                                    // width:
                                    //     MediaQuery.of(context).size.width * 0.975,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      // border: Border.all(
                                      //   color: black,
                                      //   width: 5,
                                      // )
                                    ),
                                    child: Text(
                                        'Condition 1 : Comfortable stance on the floor with eyes open',
                                        // "Last Name: ${general_info[0][0]}",
                                        style: TextStyle(
                                            color: black,
                                            fontFamily: 'Fancy',
                                            fontSize: 25)),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 20, 0, 0),
                                      width: 300, //125
                                      child: Image.asset(
                                        'assets/images/stato.png',
                                        fit: BoxFit.cover,
                                      )),
                                ]), //
                            Row(
                                //row 2 ctq
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    //age
                                    padding: const EdgeInsets.fromLTRB(
                                        50, 20, 50, 0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Column(children: [
                                      Text('Area (m^2)',
                                          // "Last Name: ${general_info[0][0]}",
                                          style: TextStyle(
                                            color: black,
                                            fontFamily: 'Fancy',
                                            fontSize: 25,
                                          )),
                                      Row(
                                          //Score and Lable with arrow
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 20, 0, 50),
                                                child: Text('Score',
                                                    // "Last Name: ${general_info[0][0]}",
                                                    style: TextStyle(
                                                      color: black,
                                                      fontFamily: 'Fancy',
                                                      fontSize: 20,
                                                    ))),
                                            Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 20, 20, 50),
                                                child: Image.asset(
                                                  width: 50,
                                                  'assets/images/arrow.png',
                                                  fit: BoxFit.cover,
                                                )),
                                            Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 20, 0, 50),
                                                child: Text('Moderate',
                                                    // "Last Name: ${general_info[0][0]}",
                                                    style: TextStyle(
                                                        color: black,
                                                        fontFamily: 'Fancy',
                                                        fontSize: 20,
                                                        fontStyle:
                                                            FontStyle.italic))),
                                          ]),
                                      // Expanded(
                                      //     // width: 50,
                                      //     child: BarChart(BarChartData(
                                      //         borderData: FlBorderData(
                                      //             border: const Border(
                                      //           top: BorderSide(width: 20),
                                      //           right: BorderSide.none,
                                      //           left: BorderSide(width: 1),
                                      //           bottom: BorderSide(width: 1),
                                      //         )),
                                      //         groupsSpace: 10,
                                      //         barGroups: [
                                      //       BarChartGroupData(x: 0, barRods: [
                                      //         BarChartRodData(
                                      //             fromY: 0,
                                      //             toY: 10,
                                      //             width: 15,
                                      //             color: Colors.blue),
                                      //       ]),
                                      //       BarChartGroupData(x: 1, barRods: [
                                      //         BarChartRodData(
                                      //             fromY: 0,
                                      //             toY: 8,
                                      //             width: 15,
                                      //             color: Colors.grey),
                                      //       ]),
                                      //     ]))),
                                    ]),
                                  ),
                                  // Container(
                                  //   //empty 1
                                  //   width: 90,
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.white,
                                  //   ),
                                  //   child: Text('',
                                  //       // "Last Name: ${general_info[0][0]}",
                                  //       style: TextStyle(
                                  //         color: black,
                                  //         fontFamily: 'Fancy',
                                  //         fontSize: 25,
                                  //       )),
                                  // ),
                                ]),
                          ])),

                      ///
                    ])
                  ])),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Export/Save', // add comm with api
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TenthRoute()),
                      );
                    },
                  )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(36),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Quit',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () => setState(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                  ))
        ]))));
  }
}
