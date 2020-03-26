// import 'package:flutter/material.dart';
// import 'package:flutter_unity_widget/flutter_unity_widget.dart';

// class Sel extends StatefulWidget {
//   @override
//   _SelState createState() => _SelState();
// }

// class _SelState extends State<Sel> {
//   static final GlobalKey<ScaffoldState> _scaffoldKey =
//       GlobalKey<ScaffoldState>();
//   UnityWidgetController _unityWidgetController;
//   double _sliderValue = 0.0;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         key: _scaffoldKey,
//         appBar: AppBar(
//           title: const Text('Unity Flutter Demo'),
//         ),
//         body: Card(
//           margin: const EdgeInsets.all(8),
//           clipBehavior: Clip.antiAlias,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//           child: Stack(
//             children: <Widget>[
//               UnityWidget(
//                 onUnityViewCreated: onUnityCreated,
//                 isARScene: true,
//                 onUnityMessage: onUnityMessage,
//               ),
//               Positioned(
//                 bottom: 20,
//                 left: 20,
//                 right: 20,
//                 child: Card(
//                   elevation: 10,
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.only(top: 20),
//                         child: Text("Rotation speed:"),
//                       ),
//                       Slider(
//                         onChanged: (value) {
//                           setState(() {
//                             _sliderValue = value;
//                           });
//                           setRotationSpeed(value.toString());
//                         },
//                         value: _sliderValue,
//                         min: 0,
//                         max: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Communcation from Flutter to Unity
//   void setRotationSpeed(String speed) {
//     _unityWidgetController.postMessage(
//       'GameFace',
//       'LoadCuba',
//       speed,
//     );
//   }

//   // Communication from Unity to Flutter
//   void onUnityMessage(controller, scenename) {
//     print('Received message from unity: ${scenename.toString()}');
//   }

//   // Callback that connects the created controller to the unity controller
//   void onUnityCreated(controller) {
//     this._unityWidgetController = controller;
//   }
// }