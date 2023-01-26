import 'package:flutter/material.dart';

import 'home.dart';
import 'pages/bigdata.dart';
import 'pages/debug.dart';
import 'pages/echarts.dart';
import 'pages/interaction_channel_dynamic.dart';
import 'pages/Full_Assessment.dart';
import 'pages/line_area_point.dart';
import 'pages/polygon_custom.dart';

// import 'package:flutter/services.dart' show rootBundle;
// import 'package:ml_algo/ml_algo.dart';
// import 'package:ml_dataframe/ml_dataframe.dart';
// import 'package:ml_preprocessing/ml_preprocessing.dart';

//////////// REAL MAIN
final routes = {
  '/': (context) => const HomePage(),
  '/examples/Full Assessment Mode': (context) => FullAssessmentPage(),
  '/examples/Fast Screening Mode': (context) => LineAreaPointPage(),
  '/examples/Documentation': (context) => PolygonCustomPage(),
  // '/examples/Interaction Channel, Dynamic': (context) =>
  //     const InteractionChannelDynamicPage(),
  // '/examples/Bigdata': (context) => BigdataPage(),
  // '/examples/Echarts': (context) => EchartsPage(),
  // '/examples/Debug': (context) => const DebugPage(),
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      initialRoute: '/',
    );
  }
}

void main() => runApp(const MyApp());
