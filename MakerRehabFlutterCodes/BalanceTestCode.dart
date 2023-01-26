///////////////////////////////////////////////// ACCELERO
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';
// import 'dart:io';

// import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

String formatTime2(int milliseconds) {
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');

  return "${milliseconds / 1000}";
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// ignore: non_constant_identifier_names
late List<List<dynamic>> collected_data = [[], [], []];

class _HomePageState extends State<HomePage> {
  late Stopwatch _stopwatch; //initialize the stopwatch
  late Timer _timer; //initialize the stopwatch
  // late UserAccelerometerEvent userAccelerometer; //initialize the stopwatch
  List<dynamic> Time = [];
  int _time = 0;

  List<dynamic> _updateTime(Timer timer) {
    setState(() {
      // _stopwatch.isRunning ? _time++ : _time = 0;
      _stopwatch.isRunning ? _time = _stopwatch.elapsedMilliseconds : _time = 0;
      _stopwatch.isRunning ? Time.add(_time / 1000) : null; //in s
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
    _stopwatch = Stopwatch();
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
      appBar: AppBar(title: Text('Patient ID')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('State'),
            Text(
              (_time > 30000) ? 'Data Collected' : 'Data Collection',
              style: TextStyle(fontSize: 40.0),
            ), //balec
            Text('Time Data'),
            Text(
              formatTime2(_stopwatch.elapsedMilliseconds
                  // > 30000 //test duration
                  //     ? 0
                  //     : 30000 - _stopwatch.elapsedMilliseconds
                  ),
              style: TextStyle(fontSize: 40.0),
            ),
            Text('Accelerometer data (x,y,z)'), //balec
            // Text(
            //   _stopwatch.isRunning
            //       ? direction.toString()
            //       : "{x: 0, y: 0, z: 0}", // set accel display to 0
            //   style: TextStyle(fontSize: 30),
            // ),
            Text('Controllers'), //balec
            FloatingActionButton(
                // child: Icon(_stopwatch.isRunning? Icons.clear_all : Icons.clear_all),
                child: const Icon(Icons.start),
                tooltip: 'Start',
                onPressed: () {
                  setState(() {
                    _time = 0;
                    collected_data[0].clear();
                    collected_data[1].clear();
                    collected_data[2].clear();
                    userAccelerometerEvents
                        .listen((UserAccelerometerEvent event) {
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
                      _stopwatch.isRunning ? collected_data[1].add(z) : null;
                      _stopwatch.isRunning ? collected_data[2].add(x) : null;
                      setState(() {});
                    });
                    _stopwatch.start();
                  });
                }),
            FloatingActionButton(
                child: const Icon(Icons.stop),
                tooltip: 'Stop',
                onPressed: () {
                  setState(() {
                    _stopwatch.stop();
                    _stopwatch.reset();
                  });
                }),
            Container(
                //     //JUST TO CHECK
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                child: Text("TIME: ${collected_data[0].length.toString()}")),
            Container(
                //     //JUST TO CHECK
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                child: Text("AP: ${collected_data[1].length.toString()}")),
            Container(
                //     //JUST TO CHECK
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                child: Text("ML: ${collected_data[2].length.toString()}")),
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
                      'view data',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       // builder: (context) => const SecondRoute()),
                    //       builder: (context) => const SubSecondPage()),
                    // );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
