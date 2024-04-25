// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class GlobalData extends InheritedWidget {
//   final int myGlobalVariable;
//   final List<Map<String,dynamic>> favoriteGames;

//   GlobalData({
//     required this.myGlobalVariable,
//     required Widget child,

//   }) : super(child: child);

//   static GlobalData of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<GlobalData>()!;
//   }

//   @override
//   bool updateShouldNotify(covariant GlobalData oldWidget) {
//     return myGlobalVariable != oldWidget.myGlobalVariable;
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GlobalData(
//       myGlobalVariable: 42,
//       child: MaterialApp(
//         home: MyHomePage(),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Access the global variable using the of() method
//     int globalVar = GlobalData.of(context).myGlobalVariable;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Global Variable Example'),
//       ),
//       body: Center(
//         child: Text('My Global Variable: $globalVar'),
//       ),
//     );
//   }
// }
