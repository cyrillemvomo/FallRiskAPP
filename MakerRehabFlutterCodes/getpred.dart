// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// // List<dynamic> data = ];
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String name = ""; //user's response will be assigned to this variable
//   String final_response =
//       ""; //will be displayed on the screen once we get the data from the server
//   final _formkey =
//       GlobalKey<FormState>(); //key created to interact with the form

//   //function to validate and save user form
//   Future<void> _savingData() async {
//     final validation = _formkey.currentState?.validate();
//     if (!validation!) {
//       return;
//     }
//     _formkey.currentState?.save();
//   }

//   //function to add border and rounded edges to our form
//   OutlineInputBorder _inputformdeco() {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(20.0),
//       borderSide:
//           BorderSide(width: 1.0, color: Colors.blue, style: BorderStyle.solid),
//     );
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 200),
//             Container(
//               width: 350,
//               child: Form(
//                 key: _formkey,
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'Enter your name: ',
//                     enabledBorder: _inputformdeco(),
//                     focusedBorder: _inputformdeco(),
//                   ),
//                   onSaved: (value) {
//                     name =
//                         value!; //getting data from the user form and assigning it to name
//                   },
//                 ),
//               ),
//             ),

//             ElevatedButton(
//               onPressed: () async {
//                 //validating the form and saving it
//                 _savingData();

//                 //url to send the post request to
//                 final url = 'http://127.0.0.1:8080/name';

//                 //sending a post request to the url
//                 final response = await http.post(Uri.parse(url),
//                     body: json.encode({'name': name}));
//               },
//               child: Text('SEND'),
//               // color: Colors.blue,
//             ),

//             ElevatedButton(
//               onPressed: () async {
//                 //url to send the get request to
//                 final url = 'http://127.0.0.1:8080/name';

//                 //getting data from the python server script and assigning it to response
//                 final response = await http.get(Uri.parse(url));

//                 //converting the fetched data from json to key value pair that can be displayed on the screen
//                 final decoded =
//                     json.decode(response.body) as Map<String, dynamic>;

//                 //changing the UI be reassigning the fetched data to final response
//                 setState(() {
//                   final_response = decoded['name'];
//                 });
//               },
//               child: Text('GET'),
//               // color: Colors.lightBlue,
//             ),

//             //displays the data on the screen
//             Text(
//               final_response,
//               style: TextStyle(fontSize: 24),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<dynamic> data = [
  0.0010860842944068,
  0.0419201870108572,
  0.0247778871358376,
  0.2458048404676236,
  0.1966732964514753,
  0.0081934946822541,
  0.0065557765483825,
  0.0167135277270054,
  0.0147567452290303,
  0.0002528804496386,
  0.0210706752481257,
  0.0148969882745036,
  0.1405630538446347,
  0.123914478452336,
  0.0046854351281544,
  0.0041304826150778,
  0.0120050197768552,
  0.0119057366723866,
  4.789436621059056e-05,
  0.009071297516197,
  0.0072507777660068,
  0.0520460803113661,
  0.0405023097929239,
  0.0017348693437122,
  0.0013500769930974,
  0.0074401995553856,
  0.006334074517784,
  0.0001388027638157,
  0.009071877520933,
  0.0165793845427021,
  0.0644169934019388,
  0.0570435556255418,
  0.0021472331133979,
  0.0019014518541847,
  0.0101390708957006,
  0.0084707057155478,
  34.33333333333334,
  160.5,
  62.5,
  24.2621868964781,
  0.0,
  22.0,
  11.0,
  0.0,
  0.0,
  2.0
];
void main() {
  runApp(MyApp());
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

class _HomePageState extends State<HomePage> {
  String name = ""; //user's response will be assigned to this variable
  String final_response =
      ""; //will be displayed on the screen once we get the data from the server
  final _formkey =
      GlobalKey<FormState>(); //key created to interact with the form

  //function to validate and save user form
  // Future<void> _savingData() async {
  //   final validation = _formkey.currentState?.validate();
  //   if (!validation!) {
  //     return;
  //   }
  //   _formkey.currentState?.save();
  // }

  //function to add border and rounded edges to our form
  // OutlineInputBorder _inputformdeco() {
  //   return OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(20.0),
  //     borderSide:
  //         BorderSide(width: 1.0, color: Colors.blue, style: BorderStyle.solid),
  //   );
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200),
            // Container(
            //   width: 350,
            //   child: Form(
            //     key: _formkey,
            //     child: TextFormField(
            //       decoration: InputDecoration(
            //         labelText: 'Enter your name: ',
            //         enabledBorder: _inputformdeco(),
            //         focusedBorder: _inputformdeco(),
            //       ),
            //       onSaved: (value) {
            //         name =
            //             value!; //getting data from the user form and assigning it to name
            //       },
            //     ),
            //   ),
            // ),

            ElevatedButton(
              onPressed: () async {
                //validating the form and saving it
                // _savingData();

                //url to send the post request to
                final url = 'http://127.0.0.1:8080/name';

                //sending a post request to the url
                final response = await http.post(Uri.parse(url),
                    body: json.encode({'name': data}));
              },
              child: Text('SEND'),
              // color: Colors.blue,
            ),

            ElevatedButton(
              onPressed: () async {
                //url to send the get request to
                final url = 'http://127.0.0.1:8080/name';

                //getting data from the python server script and assigning it to response
                final response = await http.get(Uri.parse(url));

                //converting the fetched data from json to key value pair that can be displayed on the screen
                final decoded =
                    json.decode(response.body) as Map<String, dynamic>;

                //changing the UI be reassigning the fetched data to final response
                setState(() {
                  final_response = decoded['name'];
                });
              },
              child: Text('GET'),
              // color: Colors.lightBlue,
            ),

            //displays the data on the screen
            Text(
              final_response,
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
