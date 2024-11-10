// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:get/get.dart';
// // // // // // // import 'CircularStepProgress.dart';
// // // // // // // import 'StepController.dart';
// // // // // // //
// // // // // // // class StepCounterScreen extends StatelessWidget {
// // // // // // //   final StepController stepController = Get.put(StepController());
// // // // // // //
// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Scaffold(
// // // // // // //       appBar: AppBar(title: Text('Step Counter')),
// // // // // // //       body: SingleChildScrollView(
// // // // // // //         child: Padding(
// // // // // // //           padding: const EdgeInsets.all(20.0),
// // // // // // //           child: Column(
// // // // // // //             mainAxisAlignment: MainAxisAlignment.center,
// // // // // // //             children: [
// // // // // // //               CircularStepProgress(),
// // // // // // //               SizedBox(height: 20),
// // // // // // //               Obx(() => Text(
// // // // // // //                 'Distance: ${stepController.distanceCovered.value.toStringAsFixed(2)} miles',
// // // // // // //                 style: TextStyle(fontSize: 24),
// // // // // // //               )),
// // // // // // //               SizedBox(height: 20),
// // // // // // //               Obx(() => Text(
// // // // // // //                 'Calories: ${stepController.caloriesBurned.value.toStringAsFixed(2)} kcal',
// // // // // // //                 style: TextStyle(fontSize: 24),
// // // // // // //               )),
// // // // // // //               SizedBox(height: 20),
// // // // // // //               ElevatedButton(
// // // // // // //                 onPressed: () {
// // // // // // //                   stepController.startListening();
// // // // // // //                 },
// // // // // // //                 child: Text('Start Listening'),
// // // // // // //               ),
// // // // // // //               SizedBox(height: 20),
// // // // // // //               Text(
// // // // // // //                 'Weekly Progress:', // Removed the line chart part
// // // // // // //                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// // // // // // //               ),
// // // // // // //               SizedBox(height: 20),
// // // // // // //               // Removed StepProgressChart
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:get/get.dart';
// // // // // // import 'StepController.dart';
// // // // // //
// // // // // // class StepCounterScreen extends StatelessWidget {
// // // // // //   final StepController stepController = Get.put(StepController());
// // // // // //
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       appBar: AppBar(title: Text('Step Counter')),
// // // // // //       body: Center(
// // // // // //         child: Column(
// // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // //           children: [
// // // // // //             Obx(() => Text(
// // // // // //               'Today\'s Steps: ${stepController.stepCount.value}',
// // // // // //               style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
// // // // // //             )),
// // // // // //             SizedBox(height: 20),
// // // // // //             ElevatedButton(
// // // // // //               onPressed: stepController.startListening,
// // // // // //               child: Text('Start Listening'),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:get/get.dart';
// // // // // import 'StepController.dart';
// // // // //
// // // // // class StepCounterScreen extends StatelessWidget {
// // // // //   final StepController stepController = Get.put(StepController());
// // // // //
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(title: Text('Step Counter')),
// // // // //       body: Center(
// // // // //         child: Column(
// // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // //           children: [
// // // // //             Obx(() => Text(
// // // // //               'Today\'s Steps: ${stepController.stepCount.value}',
// // // // //               style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
// // // // //             )),
// // // // //             SizedBox(height: 20),
// // // // //             ElevatedButton(
// // // // //               onPressed: stepController.startListening,
// // // // //               child: Text('Start Listening'),
// // // // //             ),
// // // // //             SizedBox(height: 20),
// // // // //             Text(
// // // // //               'Weekly Steps',
// // // // //               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// // // // //             ),
// // // // //             SizedBox(height: 20),
// // // // //             Obx(() => Wrap(
// // // // //               spacing: 10,
// // // // //               children: List.generate(7, (index) {
// // // // //                 return Column(
// // // // //                   children: [
// // // // //                     Text(
// // // // //                       _getDayName(index),
// // // // //                       style: TextStyle(fontSize: 16),
// // // // //                     ),
// // // // //                     Text(
// // // // //                       '${stepController.weeklySteps[index]} steps',
// // // // //                       style: TextStyle(fontSize: 14),
// // // // //                     ),
// // // // //                   ],
// // // // //                 );
// // // // //               }),
// // // // //             )),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // //
// // // // //   String _getDayName(int index) {
// // // // //     switch (index) {
// // // // //       case 0: return 'Mon';
// // // // //       case 1: return 'Tue';
// // // // //       case 2: return 'Wed';
// // // // //       case 3: return 'Thu';
// // // // //       case 4: return 'Fri';
// // // // //       case 5: return 'Sat';
// // // // //       case 6: return 'Sun';
// // // // //       default: return '';
// // // // //     }
// // // // //   }
// // // // // }
// // // // import 'dart:async';
// // // //
// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter/widgets.dart';
// // // // import 'package:permission_handler/permission_handler.dart';
// // // // import 'package:pedometer/pedometer.dart';
// // // //
// // // // class StepCounterScreen extends StatefulWidget {
// // // //   @override
// // // //   _StepCounterScreenState createState() => _StepCounterScreenState();
// // // // }
// // // //
// // // // class _StepCounterScreenState extends State<StepCounterScreen> with WidgetsBindingObserver {
// // // //   int stepCount = 0; // Today's steps
// // // //   List<int> weeklySteps = List<int>.filled(7, 0); // Steps for each day of the week
// // // //   int? baselineStepCount; // Baseline step count for the day
// // // //   int currentDayIndex = DateTime.now().weekday - 1; // 0 = Monday, 6 = Sunday
// // // //
// // // //   late Stream<StepCount> _stepCountStream;
// // // //   StreamSubscription<StepCount>? _stepCountSubscription;
// // // //
// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     WidgetsBinding.instance.addObserver(this);
// // // //     requestPermissions();
// // // //   }
// // // //
// // // //   Future<void> requestPermissions() async {
// // // //     if (await Permission.activityRecognition.request().isGranted) {
// // // //       print("Activity recognition permission granted");
// // // //       initializePedometer();
// // // //     } else {
// // // //       print("Activity recognition permission not granted");
// // // //     }
// // // //   }
// // // //
// // // //   void startListening() async {
// // // //     if (await Permission.activityRecognition.isGranted) {
// // // //       initializePedometer();
// // // //     } else {
// // // //       print("Activity recognition permission is not granted.");
// // // //     }
// // // //   }
// // // //
// // // //   Future<void> initializePedometer() async {
// // // //     _stepCountStream = Pedometer.stepCountStream;
// // // //     _stepCountSubscription = _stepCountStream.listen(
// // // //           (event) {
// // // //         print("Steps detected: ${event.steps}");
// // // // setState(() {
// // // //   stepCount = event.steps;
// // // //
// // // // });
// // // //         onStepCount(event);
// // // //       },
// // // //       onError: (error) => print("Step count error: $error"),
// // // //     );
// // // //   }
// // // //
// // // //   void onStepCount(StepCount event) {
// // // //     int todayIndex = DateTime.now().weekday - 1; // Get today's index (0 = Monday)
// // // //     print("Current Day Index: $todayIndex");
// // // //
// // // //     // Reset baseline if the day has changed
// // // //     if (todayIndex != currentDayIndex) {
// // // //       currentDayIndex = todayIndex;
// // // //       baselineStepCount = event.steps; // Set new baseline for today
// // // //       setState(() {
// // // //         weeklySteps[currentDayIndex] = 0; // Reset today's steps in the weekly array
// // // //       });
// // // //       print("Day changed. New baseline set to ${baselineStepCount}");
// // // //     }
// // // //
// // // //     // Update daily steps by subtracting the baseline
// // // //     if (baselineStepCount != null) {
// // // //       setState(() {
// // // //         weeklySteps[currentDayIndex] = event.steps - baselineStepCount!;
// // // //         stepCount = weeklySteps[currentDayIndex];
// // // //       });
// // // //       print("Updated weeklySteps for today (${_getDayName(todayIndex)}): ${stepCount}");
// // // //     }
// // // //   }
// // // //
// // // //   @override
// // // //   void didChangeAppLifecycleState(AppLifecycleState state) {
// // // //     if (state == AppLifecycleState.resumed && _stepCountSubscription?.isPaused == true) {
// // // //       _stepCountSubscription?.resume();
// // // //     } else if (state == AppLifecycleState.paused) {
// // // //       _stepCountSubscription?.pause();
// // // //     }
// // // //   }
// // // //
// // // //   @override
// // // //   void dispose() {
// // // //     WidgetsBinding.instance.removeObserver(this);
// // // //     _stepCountSubscription?.cancel();
// // // //     super.dispose();
// // // //   }
// // // //
// // // //   String _getDayName(int index) {
// // // //     switch (index) {
// // // //       case 0: return 'Mon';
// // // //       case 1: return 'Tue';
// // // //       case 2: return 'Wed';
// // // //       case 3: return 'Thu';
// // // //       case 4: return 'Fri';
// // // //       case 5: return 'Sat';
// // // //       case 6: return 'Sun';
// // // //       default: return '';
// // // //     }
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(title: Text('Step Counter')),
// // // //       body: Center(
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: [
// // // //             Text(
// // // //               'Today\'s Steps: $stepCount',
// // // //               style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
// // // //             ),
// // // //             SizedBox(height: 20),
// // // //             ElevatedButton(
// // // //               onPressed: startListening,
// // // //               child: Text('Start Listening'),
// // // //             ),
// // // //             SizedBox(height: 20),
// // // //             Text(
// // // //               'Weekly Steps',
// // // //               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// // // //             ),
// // // //             SizedBox(height: 20),
// // // //             Wrap(
// // // //               spacing: 10,
// // // //               children: List.generate(7, (index) {
// // // //                 return Column(
// // // //                   children: [
// // // //                     Text(
// // // //                       _getDayName(index),
// // // //                       style: TextStyle(fontSize: 16),
// // // //                     ),
// // // //                     Text(
// // // //                       '${weeklySteps[index]} steps',
// // // //                       style: TextStyle(fontSize: 14),
// // // //                     ),
// // // //                   ],
// // // //                 );
// // // //               }),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // import 'dart:async';
// // // import 'package:flutter/material.dart';
// // // import 'package:permission_handler/permission_handler.dart';
// // // import 'package:pedometer/pedometer.dart';
// // //
// // // class StepCounterScreen extends StatefulWidget {
// // //   @override
// // //   _StepCounterScreenState createState() => _StepCounterScreenState();
// // // }
// // //
// // // class _StepCounterScreenState extends State<StepCounterScreen> with WidgetsBindingObserver {
// // //   int stepCount = 0; // Today's steps
// // //   List<int> weeklySteps = List<int>.filled(7, 0); // Steps for each day of the week
// // //   int? baselineStepCount; // Baseline step count for the day
// // //   int currentDayIndex = DateTime.now().weekday - 1; // 0 = Monday, 6 = Sunday
// // //
// // //   late Stream<StepCount> _stepCountStream;
// // //   StreamSubscription<StepCount>? _stepCountSubscription;
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     WidgetsBinding.instance.addObserver(this);
// // //     requestPermissions();
// // //   }
// // //
// // //   Future<void> requestPermissions() async {
// // //     if (await Permission.activityRecognition.request().isGranted) {
// // //       print("Activity recognition permission granted");
// // //       initializePedometer();
// // //     } else {
// // //       print("Activity recognition permission not granted");
// // //     }
// // //   }
// // //
// // //   void startListening() async {
// // //     if (await Permission.activityRecognition.isGranted) {
// // //       initializePedometer();
// // //     } else {
// // //       print("Activity recognition permission is not granted.");
// // //     }
// // //   }
// // //
// // //   Future<void> initializePedometer() async {
// // //     _stepCountStream = Pedometer.stepCountStream;
// // //     _stepCountSubscription = _stepCountStream.listen(
// // //           (event) {
// // //         print("Steps detected: ${event.steps}");
// // //         onStepCount(event);
// // //       },
// // //       onError: (error) => print("Step count error: $error"),
// // //     );
// // //   }
// // //   void onStepCount(StepCount event) {
// // //     int todayIndex = DateTime.now().weekday - 1; // Get today's index (0 = Monday)
// // //     print("Steps detected: ${event.steps}");
// // //     print("Current Day Index: $todayIndex");
// // //
// // //     // Initialize baseline if it's null (first time the app runs for the day)
// // //     if (baselineStepCount == null) {
// // //       baselineStepCount = event.steps;
// // //       print("Initial baseline set to $baselineStepCount for the day.");
// // //     }
// // //
// // //     // Check if the day has changed
// // //     if (todayIndex != currentDayIndex) {
// // //       print("Day has changed. Setting new baseline.");
// // //       currentDayIndex = todayIndex;
// // //       baselineStepCount = event.steps; // Reset baseline for the new day
// // //       setState(() {
// // //         weeklySteps[currentDayIndex] = 0; // Reset today's steps in weekly array
// // //         stepCount = 0; // Reset today's step count in UI
// // //       });
// // //     }
// // //
// // //     // Update today's steps based on the new step count and baseline
// // //     if (baselineStepCount != null) {
// // //       int calculatedSteps = event.steps - baselineStepCount!;
// // //       if (calculatedSteps != weeklySteps[currentDayIndex]) { // Update only if changed
// // //         setState(() {
// // //           weeklySteps[currentDayIndex] = calculatedSteps;
// // //           stepCount = calculatedSteps;
// // //         });
// // //         print("Updated weeklySteps for today (${_getDayName(todayIndex)}): ${weeklySteps[currentDayIndex]}");
// // //       }
// // //     } else {
// // //       print("Error: Baseline step count is null.");
// // //     }
// // //   }
// // //
// // //
// // //
// // //
// // //   @override
// // //   void didChangeAppLifecycleState(AppLifecycleState state) {
// // //     if (state == AppLifecycleState.resumed && _stepCountSubscription?.isPaused == true) {
// // //       _stepCountSubscription?.resume();
// // //     } else if (state == AppLifecycleState.paused) {
// // //       _stepCountSubscription?.pause();
// // //     }
// // //   }
// // //
// // //   @override
// // //   void dispose() {
// // //     WidgetsBinding.instance.removeObserver(this);
// // //     _stepCountSubscription?.cancel();
// // //     super.dispose();
// // //   }
// // //
// // //   String _getDayName(int index) {
// // //     switch (index) {
// // //       case 0: return 'Mon';
// // //       case 1: return 'Tue';
// // //       case 2: return 'Wed';
// // //       case 3: return 'Thu';
// // //       case 4: return 'Fri';
// // //       case 5: return 'Sat';
// // //       case 6: return 'Sun';
// // //       default: return '';
// // //     }
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(title: Text('Step Counter')),
// // //       body: Center(
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             Text(
// // //               'Today\'s Steps: $stepCount',
// // //               style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
// // //             ),
// // //             SizedBox(height: 20),
// // //             ElevatedButton(
// // //               onPressed: startListening,
// // //               child: Text('Start Listening'),
// // //             ),
// // //             SizedBox(height: 20),
// // //             Text(
// // //               'Weekly Steps',
// // //               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// // //             ),
// // //             SizedBox(height: 20),
// // //             Wrap(
// // //               spacing: 10,
// // //               children: List.generate(7, (index) {
// // //                 return Column(
// // //                   children: [
// // //                     Text(
// // //                       _getDayName(index),
// // //                       style: TextStyle(fontSize: 16),
// // //                     ),
// // //                     Text(
// // //                       '${weeklySteps[index]} steps',
// // //                       style: TextStyle(fontSize: 14),
// // //                     ),
// // //                   ],
// // //                 );
// // //               }),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'dart:async';
// // import 'package:flutter/material.dart';
// // import 'package:permission_handler/permission_handler.dart';
// // import 'package:pedometer/pedometer.dart';
// //
// // class StepCounterScreen extends StatefulWidget {
// //   @override
// //   _StepCounterScreenState createState() => _StepCounterScreenState();
// // }
// //
// // class _StepCounterScreenState extends State<StepCounterScreen> with WidgetsBindingObserver {
// //   int stepCount = 0; // Today's steps
// //   List<int> weeklySteps = List<int>.filled(7, 0); // Steps for each day of the week
// //   int? baselineStepCount; // Baseline step count for the day
// //   int currentDayIndex = DateTime.now().weekday - 1; // 0 = Monday, 6 = Sunday
// //
// //   late Stream<StepCount> _stepCountStream;
// //   StreamSubscription<StepCount>? _stepCountSubscription;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     WidgetsBinding.instance.addObserver(this);
// //     requestPermissions();
// //   }
// //
// //   Future<void> requestPermissions() async {
// //     if (await Permission.activityRecognition.request().isGranted) {
// //       print("Activity recognition permission granted");
// //       initializePedometer();
// //     } else {
// //       print("Activity recognition permission not granted");
// //     }
// //   }
// //
// //   void startListening() async {
// //     if (await Permission.activityRecognition.isGranted) {
// //       initializePedometer();
// //     } else {
// //       print("Activity recognition permission is not granted.");
// //     }
// //   }
// //
// //   void stopListening() {
// //     _stepCountSubscription?.cancel();
// //     _stepCountSubscription = null;
// //     _stepCountStream = null; // Set to null after stopping
// //     print("Stopped tracking footsteps and cleared pedometer stream.");
// //   }
// //   // void stopListening() {
// //   //   _stepCountSubscription?.cancel();
// //   //   _stepCountSubscription = null; // Reset the subscription variable
// //   //   print("Stopped tracking footsteps.");
// //   // }
// //
// //   Future<void> initializePedometer() async {
// //     _stepCountStream = Pedometer.stepCountStream;
// //     _stepCountSubscription = _stepCountStream.listen(
// //           (event) {
// //         print("Steps detected: ${event.steps}");
// //         onStepCount(event);
// //       },
// //       onError: (error) => print("Step count error: $error"),
// //     );
// //   }
// //
// //   void onStepCount(StepCount event) {
// //     int todayIndex = DateTime.now().weekday - 1; // Get today's index (0 = Monday)
// //     print("Steps detected: ${event.steps}");
// //     print("Current Day Index: $todayIndex");
// //
// //     // Initialize baseline if it's null (first time the app runs for the day)
// //     if (baselineStepCount == null) {
// //       baselineStepCount = event.steps;
// //       print("Initial baseline set to $baselineStepCount for the day.");
// //     }
// //
// //     // Check if the day has changed
// //     if (todayIndex != currentDayIndex) {
// //       print("Day has changed. Setting new baseline.");
// //       currentDayIndex = todayIndex;
// //       baselineStepCount = event.steps; // Reset baseline for the new day
// //       setState(() {
// //         weeklySteps[currentDayIndex] = 0; // Reset today's steps in weekly array
// //         stepCount = 0; // Reset today's step count in UI
// //       });
// //     }
// //
// //     // Update today's steps based on the new step count and baseline
// //     if (baselineStepCount != null) {
// //       int calculatedSteps = event.steps - baselineStepCount!;
// //       if (calculatedSteps != weeklySteps[currentDayIndex]) { // Update only if changed
// //         setState(() {
// //           weeklySteps[currentDayIndex] = calculatedSteps;
// //           stepCount = calculatedSteps;
// //         });
// //         print("Updated weeklySteps for today (${_getDayName(todayIndex)}): ${weeklySteps[currentDayIndex]}");
// //       }
// //     } else {
// //       print("Error: Baseline step count is null.");
// //     }
// //   }
// //
// //   @override
// //   void didChangeAppLifecycleState(AppLifecycleState state) {
// //     if (state == AppLifecycleState.resumed && _stepCountSubscription?.isPaused == true) {
// //       _stepCountSubscription?.resume();
// //     } else if (state == AppLifecycleState.paused) {
// //       _stepCountSubscription?.pause();
// //     }
// //   }
// //
// //   @override
// //   void dispose() {
// //     WidgetsBinding.instance.removeObserver(this);
// //     _stepCountSubscription?.cancel();
// //     super.dispose();
// //   }
// //
// //   String _getDayName(int index) {
// //     switch (index) {
// //       case 0: return 'Mon';
// //       case 1: return 'Tue';
// //       case 2: return 'Wed';
// //       case 3: return 'Thu';
// //       case 4: return 'Fri';
// //       case 5: return 'Sat';
// //       case 6: return 'Sun';
// //       default: return '';
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Step Counter')),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text(
// //               'Today\'s Steps: $stepCount',
// //               style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: startListening,
// //               child: Text('Start Listening'),
// //             ),
// //             SizedBox(height: 10),
// //             ElevatedButton(
// //               onPressed: stopListening,
// //               child: Text('Stop Listening'),
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: Colors.red, // Set stop button color to red
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             Text(
// //               'Weekly Steps',
// //               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// //             ),
// //             SizedBox(height: 20),
// //             Wrap(
// //               spacing: 10,
// //               children: List.generate(7, (index) {
// //                 return Column(
// //                   children: [
// //                     Text(
// //                       _getDayName(index),
// //                       style: TextStyle(fontSize: 16),
// //                     ),
// //                     Text(
// //                       '${weeklySteps[index]} steps',
// //                       style: TextStyle(fontSize: 14),
// //                     ),
// //                   ],
// //                 );
// //               }),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:pedometer/pedometer.dart';
//
// class StepCounterScreen extends StatefulWidget {
//   @override
//   _StepCounterScreenState createState() => _StepCounterScreenState();
// }
//
// class _StepCounterScreenState extends State<StepCounterScreen> with WidgetsBindingObserver {
//   int stepCount = 0; // Today's steps
//   List<int> weeklySteps = List<int>.filled(7, 0); // Steps for each day of the week
//   int? baselineStepCount; // Baseline step count for the day
//   int currentDayIndex = DateTime.now().weekday - 1; // 0 = Monday, 6 = Sunday
//
//   Stream<StepCount>? _stepCountStream; // Made nullable
//   StreamSubscription<StepCount>? _stepCountSubscription;
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     requestPermissions();
//   }
//
//   Future<void> requestPermissions() async {
//     if (await Permission.activityRecognition.request().isGranted) {
//       print("Activity recognition permission granted");
//       initializePedometer();
//     } else {
//       print("Activity recognition permission not granted");
//     }
//   }
//
//   void startListening() async {
//     if (await Permission.activityRecognition.isGranted) {
//       initializePedometer();
//     } else {
//       print("Activity recognition permission is not granted.");
//     }
//   }
//
//   void stopListening() {
//     _stepCountSubscription?.cancel();
//     _stepCountSubscription = null;
//     _stepCountStream = null; // Set to null after stopping
//     print("Stopped tracking footsteps and cleared pedometer stream.");
//   }
//
//   Future<void> initializePedometer() async {
//     _stepCountStream = Pedometer.stepCountStream;
//     _stepCountSubscription = _stepCountStream!.listen(
//           (event) {
//         print("Steps detected: ${event.steps}");
//         onStepCount(event);
//       },
//       onError: (error) => print("Step count error: $error"),
//     );
//   }
//
//   void onStepCount(StepCount event) {
//     int todayIndex = DateTime.now().weekday - 1; // Get today's index (0 = Monday)
//     print("Steps detected: ${event.steps}");
//     print("Current Day Index: $todayIndex");
//
//     // Initialize baseline if it's null (first time the app runs for the day)
//     if (baselineStepCount == null) {
//       baselineStepCount = event.steps;
//       print("Initial baseline set to $baselineStepCount for the day.");
//     }
//
//     // Check if the day has changed
//     if (todayIndex != currentDayIndex) {
//       print("Day has changed. Setting new baseline.");
//       currentDayIndex = todayIndex;
//       baselineStepCount = event.steps; // Reset baseline for the new day
//       setState(() {
//         weeklySteps[currentDayIndex] = 0; // Reset today's steps in weekly array
//         stepCount = 0; // Reset today's step count in UI
//       });
//     }
//
//     // Update today's steps based on the new step count and baseline
//     if (baselineStepCount != null) {
//       int calculatedSteps = event.steps - baselineStepCount!;
//       if (calculatedSteps != weeklySteps[currentDayIndex]) { // Update only if changed
//         setState(() {
//           weeklySteps[currentDayIndex] = calculatedSteps;
//           stepCount = calculatedSteps;
//         });
//         print("Updated weeklySteps for today (${_getDayName(todayIndex)}): ${weeklySteps[currentDayIndex]}");
//       }
//     } else {
//       print("Error: Baseline step count is null.");
//     }
//   }
//
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.resumed && _stepCountSubscription?.isPaused == true) {
//       _stepCountSubscription?.resume();
//     } else if (state == AppLifecycleState.paused) {
//       _stepCountSubscription?.pause();
//     }
//   }
//
//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     _stepCountSubscription?.cancel();
//     super.dispose();
//   }
//
//   String _getDayName(int index) {
//     switch (index) {
//       case 0: return 'Mon';
//       case 1: return 'Tue';
//       case 2: return 'Wed';
//       case 3: return 'Thu';
//       case 4: return 'Fri';
//       case 5: return 'Sat';
//       case 6: return 'Sun';
//       default: return '';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Step Counter')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Today\'s Steps: $stepCount',
//               style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: startListening,
//               child: Text('Start Listening'),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: stopListening,
//               child: Text('Stop Listening'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red, // Set stop button color to red
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Weekly Steps',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             Wrap(
//               spacing: 10,
//               children: List.generate(7, (index) {
//                 return Column(
//                   children: [
//                     Text(
//                       _getDayName(index),
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     Text(
//                       '${weeklySteps[index]} steps',
//                       style: TextStyle(fontSize: 14),
//                     ),
//                   ],
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pedometer/pedometer.dart';

class StepCounterScreen extends StatefulWidget {
  @override
  _StepCounterScreenState createState() => _StepCounterScreenState();
}

class _StepCounterScreenState extends State<StepCounterScreen> with WidgetsBindingObserver {
  int stepCount = 0; // Today's steps
  List<int> weeklySteps = List<int>.filled(7, 0); // Steps for each day of the week
  int? baselineStepCount; // Baseline step count for the day
  int currentDayIndex = DateTime.now().weekday - 1; // 0 = Monday, 6 = Sunday
  double distance = 0.0; // Distance covered in meters
  Duration elapsedTime = Duration.zero; // Duration of the walking session
  Timer? _timer; // Timer for tracking elapsed time
  bool isTracking = false;

  Stream<StepCount>? _stepCountStream;
  StreamSubscription<StepCount>? _stepCountSubscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    if (await Permission.activityRecognition.request().isGranted) {
      print("Activity recognition permission granted");
      initializePedometer();
    } else {
      print("Activity recognition permission not granted");
    }
  }

  void startListening() async {
    if (await Permission.activityRecognition.isGranted) {
      initializePedometer();
      startTimer();
    } else {
      print("Activity recognition permission is not granted.");
    }
  }
//qweqwe
  void stopListening() {
    _stepCountSubscription?.cancel();
    _stepCountSubscription = null;
    _stepCountStream = null;
    stopTimer();
    print("Stopped tracking footsteps and cleared pedometer stream.");
  }

  Future<void> initializePedometer() async {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountSubscription = _stepCountStream!.listen(
          (event) {
        print("Steps detected: ${event.steps}");
        onStepCount(event);
      },
      onError: (error) => print("Step count error: $error"),
    );
  }

  void onStepCount(StepCount event) {
    int todayIndex = DateTime.now().weekday - 1;
    print("Steps detected: ${event.steps}");
    print("Current Day Index: $todayIndex");

    if (baselineStepCount == null) {
      baselineStepCount = event.steps;
      print("Initial baseline set to $baselineStepCount for the day.");
    }

    if (todayIndex != currentDayIndex) {
      print("Day has changed. Setting new baseline.");
      currentDayIndex = todayIndex;
      baselineStepCount = event.steps;
      setState(() {
        weeklySteps[currentDayIndex] = 0;
        stepCount = 0;
        distance = 0.0;
        elapsedTime = Duration.zero;
      });
    }

    if (baselineStepCount != null) {
      int calculatedSteps = event.steps - baselineStepCount!;
      if (calculatedSteps != weeklySteps[currentDayIndex]) {
        setState(() {
          weeklySteps[currentDayIndex] = calculatedSteps;
          stepCount = calculatedSteps;
          distance = calculatedSteps * 0.762; // Average stride length in meters
        });
        print("Updated weeklySteps for today (${_getDayName(todayIndex)}): ${weeklySteps[currentDayIndex]}");
      }
    } else {
      print("Error: Baseline step count is null.");
    }
  }

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        elapsedTime += Duration(seconds: 1);
      });
    });
    setState(() {
      isTracking = true;
    });
  }

  void stopTimer() {
    _timer?.cancel();
    setState(() {
      isTracking = false;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _stepCountSubscription?.isPaused == true) {
      _stepCountSubscription?.resume();
    } else if (state == AppLifecycleState.paused) {
      _stepCountSubscription?.pause();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stepCountSubscription?.cancel();
    _timer?.cancel();
    super.dispose();
  }

  String _getDayName(int index) {
    switch (index) {
      case 0: return 'Mon';
      case 1: return 'Tue';
      case 2: return 'Wed';
      case 3: return 'Thu';
      case 4: return 'Fri';
      case 5: return 'Sat';
      case 6: return 'Sun';
      default: return '';
    }
  }

  String formatElapsedTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Step Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Today\'s Steps: $stepCount',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Distance: ${distance.toStringAsFixed(2)} meters',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              'Elapsed Time: ${formatElapsedTime(elapsedTime)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isTracking ? null : startListening,
              child: Text('Start Listening'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: isTracking ? stopListening : null,
              child: Text('Stop Listening'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Weekly Steps',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: List.generate(7, (index) {
                return Column(
                  children: [
                    Text(
                      _getDayName(index),
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '${weeklySteps[index]} steps',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
