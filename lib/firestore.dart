
// import 'package:flutter/material.dart';

// void main() => runApp(SwitchListTileApp());

// class SwitchListTileApp extends StatefulWidget {
//   const SwitchListTileApp({Key? key}) : super(key: key);

//   @override
//   State<SwitchListTileApp> createState() => _SwitchListTileAppState();
// }

// class _SwitchListTileAppState extends State<SwitchListTileApp> {
//   bool _flutter = false;
//   bool _flutter2 = false;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'list style',
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text('List Style'),
//           ),
//           body: ListView(
//             children: [
//               SwitchListTile(
//                   title: Text('Student 1'),
//                   value: _flutter,
//                   onChanged: (bool value) {
//                     setState(() {
//                       _flutter = value;
//                     });
//                   }),
//               SwitchListTile(
//                   title: Text('Student 2'),
//                   value: _flutter2,
//                   onChanged: (bool value) {
//                     setState(() {
//                       _flutter2 = value;
//                     });
//                   })
//             ],
//           )),
//     );
//   }
// }
