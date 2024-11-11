// // //
// // // import 'dart:async';
// // // import 'package:flutter/widgets.dart';
// // // import 'package:get/get.dart';
// // // import 'package:pedometer/pedometer.dart';
// // // import 'package:permission_handler/permission_handler.dart';
// // //
// // // class StepController extends GetxController with WidgetsBindingObserver {
// // //   final RxInt stepCount = 0.obs;
// // //   final RxDouble distanceCovered = 0.0.obs;
// // //   final RxDouble caloriesBurned = 0.0.obs;
// // //   final RxList<RxInt> dailySteps = RxList.generate(7, (_) => 0.obs); // Keep track of daily steps for a week
// // //
// // //   late Stream<StepCount> _stepCountStream;
// // //   StreamSubscription<StepCount>? _stepCountSubscription;
// // //
// // //   static const double stepsToMileRatio = 0.0005; // Approximate steps-to-miles ratio
// // //   static const double caloriesPerStep = 0.04;    // Approximate calories burned per step
// // //
// // //   @override
// // //   void onInit() {
// // //     super.onInit();
// // //     WidgetsBinding.instance?.addObserver(this);
// // //     requestPermissions(); // Request permission on initialization
// // //   }
// // //
// // //   Future<void> requestPermissions() async {
// // //     if (await Permission.activityRecognition.request().isGranted) {
// // //       print("Activity recognition permission granted");
// // //       stepCount.value = 0; // Reset step count on permission grant
// // //       initializePedometer(); // Initialize pedometer if permission is granted
// // //     } else {
// // //       print("Activity recognition permission not granted");
// // //     }
// // //   }
// // //
// // //   void startListening() async {
// // //     if (await Permission.activityRecognition.isGranted) {
// // //       stepCount.value = 0; // Reset step count on start
// // //       initializePedometer(); // Start listening to step count when button is clicked
// // //     } else {
// // //       print("Activity recognition permission is not granted.");
// // //     }
// // //   }
// // //
// // //   Future<void> initializePedometer() async {
// // //     _stepCountStream = Pedometer.stepCountStream;
// // //     _stepCountSubscription = _stepCountStream.listen(
// // //           (event) {
// // //         print("Initialized Step Count Stream: Steps detected: ${event.steps}");
// // //         onStepCount(event);
// // //       },
// // //       onError: onStepCountError,
// // //     );
// // //   }
// // //
// // //   void onStepCount(StepCount event) {
// // //     print("Steps detected: ${event.steps}");
// // //     stepCount.value = event.steps; // Update the step count
// // //
// // //     // Update daily steps
// // //     updateDailySteps(event.steps);
// // //
// // //     updateDistanceAndCalories();
// // //   }
// // //
// // //   void updateDailySteps(int steps) {
// // //     int todayIndex = (DateTime.now().weekday - 1) % 7; // Normalize to 0-6 (Monday to Sunday)
// // //
// // //     // Set today's steps and zero for future days
// // //     dailySteps[todayIndex].value = steps;
// // //     for (int i = todayIndex + 1; i < 7; i++) {
// // //       dailySteps[i].value = 0; // Set future days to 0
// // //     }
// // //   }
// // //
// // //   void onStepCountError(error) {
// // //     print("Step count error: $error");
// // //   }
// // //
// // //   void updateDistanceAndCalories() {
// // //     distanceCovered.value = stepCount.value * stepsToMileRatio;
// // //     caloriesBurned.value = stepCount.value * caloriesPerStep;
// // //   }
// // //
// // //   @override
// // //   void didChangeAppLifecycleState(AppLifecycleState state) {
// // //     print("AppLifecycleState: $state");
// // //     switch (state) {
// // //       case AppLifecycleState.resumed:
// // //         if (_stepCountSubscription?.isPaused == true) {
// // //           _stepCountSubscription?.resume();
// // //         }
// // //         break;
// // //       case AppLifecycleState.paused:
// // //         _stepCountSubscription?.pause();
// // //         break;
// // //       default:
// // //         break;
// // //     }
// // //   }
// // //
// // //   @override
// // //   void onClose() {
// // //     WidgetsBinding.instance?.removeObserver(this);
// // //     _stepCountSubscription?.cancel();
// // //     super.onClose();
// // //   }
// // // }
// // import 'dart:async';
// // import 'package:flutter/widgets.dart';
// // import 'package:get/get.dart';
// // import 'package:pedometer/pedometer.dart';
// // import 'package:permission_handler/permission_handler.dart';
// //
// // class StepController extends GetxController with WidgetsBindingObserver {
// //   final RxInt stepCount = 0.obs;
// //
// //   late Stream<StepCount> _stepCountStream;
// //   StreamSubscription<StepCount>? _stepCountSubscription;
// //
// //   @override
// //   void onInit() {
// //     super.onInit();
// //     WidgetsBinding.instance?.addObserver(this);
// //     requestPermissions();
// //   }
// //
// //   Future<void> requestPermissions() async {
// //     if (await Permission.activityRecognition.request().isGranted) {
// //       print("Activity recognition permission granted");
// //       stepCount.value = 0;
// //       initializePedometer();
// //     } else {
// //       print("Activity recognition permission not granted");
// //     }
// //   }
// //
// //   void startListening() async {
// //     if (await Permission.activityRecognition.isGranted) {
// //       stepCount.value = 0;
// //       initializePedometer();
// //     } else {
// //       print("Activity recognition permission is not granted.");
// //     }
// //   }
// //
// //   Future<void> initializePedometer() async {
// //     _stepCountStream = Pedometer.stepCountStream;
// //     _stepCountSubscription = _stepCountStream.listen(
// //           (event) {
// //         print("Steps detected: ${event.steps}");
// //         stepCount.value = event.steps;
// //       },
// //       onError: (error) => print("Step count error: $error"),
// //     );
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
// //   void onClose() {
// //     WidgetsBinding.instance?.removeObserver(this);
// //     _stepCountSubscription?.cancel();
// //     super.onClose();
// //   }
// // }
// import 'dart:async';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:pedometer/pedometer.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class StepController extends GetxController with WidgetsBindingObserver {
//   final RxInt stepCount = 0.obs;
//   int? baselineStepCount; // Baseline step count when the app is first opened
//
//   late Stream<StepCount> _stepCountStream;
//   StreamSubscription<StepCount>? _stepCountSubscription;
//
//   @override
//   void onInit() {
//     super.onInit();
//     WidgetsBinding.instance?.addObserver(this);
//     requestPermissions();
//   }
//
//   Future<void> requestPermissions() async {
//     if (await Permission.activityRecognition.request().isGranted) {
//       print("Activity recognition permission granted");
//       stepCount.value = 0;
//       initializePedometer();
//     } else {
//       print("Activity recognition permission not granted");
//     }
//   }
//
//   void startListening() async {
//     if (await Permission.activityRecognition.isGranted) {
//       stepCount.value = 0;
//       initializePedometer();
//     } else {
//       print("Activity recognition permission is not granted.");
//     }
//   }
//
//   Future<void> initializePedometer() async {
//     _stepCountStream = Pedometer.stepCountStream;
//     _stepCountSubscription = _stepCountStream.listen(
//           (event) {
//         print("Steps detected: ${event.steps}");
//         onStepCount(event);
//       },
//       onError: (error) => print("Step count error: $error"),
//     );
//   }
//
//   void onStepCount(StepCount event) {
//     if (baselineStepCount == null) {
//       baselineStepCount = event.steps; // Set baseline on first step count event
//     }
//     stepCount.value = event.steps - baselineStepCount!; // Show only steps since app launch
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
//   void onClose() {
//     WidgetsBinding.instance?.removeObserver(this);
//     _stepCountSubscription?.cancel();
//     super.onClose();
//   }
// }

//
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
//   double distance = 0.0; // Distance covered in meters
//   Duration elapsedTime = Duration.zero; // Duration of the walking session
//   Timer? _timer; // Timer for tracking elapsed time
//   bool isTracking = false;
//
//   Stream<StepCount>? _stepCountStream;
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
//       startTimer();
//     } else {
//       print("Activity recognition permission is not granted.");
//     }
//   }
// //qweqwe
//   void stopListening() {
//     _stepCountSubscription?.cancel();
//     _stepCountSubscription = null;
//     _stepCountStream = null;
//     stopTimer();
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
//     int todayIndex = DateTime.now().weekday - 1;
//     print("Steps detected: ${event.steps}");
//     print("Current Day Index: $todayIndex");
//
//     if (baselineStepCount == null) {
//       baselineStepCount = event.steps;
//       print("Initial baseline set to $baselineStepCount for the day.");
//     }
//
//     if (todayIndex != currentDayIndex) {
//       print("Day has changed. Setting new baseline.");
//       currentDayIndex = todayIndex;
//       baselineStepCount = event.steps;
//       setState(() {
//         weeklySteps[currentDayIndex] = 0;
//         stepCount = 0;
//         distance = 0.0;
//         elapsedTime = Duration.zero;
//       });
//     }
//
//     if (baselineStepCount != null) {
//       int calculatedSteps = event.steps - baselineStepCount!;
//       if (calculatedSteps != weeklySteps[currentDayIndex]) {
//         setState(() {
//           weeklySteps[currentDayIndex] = calculatedSteps;
//           stepCount = calculatedSteps;
//           distance = calculatedSteps * 0.762; // Average stride length in meters
//         });
//         print("Updated weeklySteps for today (${_getDayName(todayIndex)}): ${weeklySteps[currentDayIndex]}");
//       }
//     } else {
//       print("Error: Baseline step count is null.");
//     }
//   }
//
//   void startTimer() {
//     _timer?.cancel();
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         elapsedTime += Duration(seconds: 1);
//       });
//     });
//     setState(() {
//       isTracking = true;
//     });
//   }
//
//   void stopTimer() {
//     _timer?.cancel();
//     setState(() {
//       isTracking = false;
//     });
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
//     _timer?.cancel();
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
//   String formatElapsedTime(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, "0");
//     String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
//     String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
//     return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
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
//             SizedBox(height: 10),
//             Text(
//               'Distance: ${distance.toStringAsFixed(2)} meters',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Elapsed Time: ${formatElapsedTime(elapsedTime)}',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: isTracking ? null : startListening,
//               child: Text('Start Listening'),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: isTracking ? stopListening : null,
//               child: Text('Stop Listening'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red,
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
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

class StepController extends GetxController with WidgetsBindingObserver {
  final RxInt stepCount = 0.obs;
  final RxList<int> weeklySteps = List<int>.filled(7, 0).obs; // Track steps for each day of the week
  int? baselineStepCount; // Baseline step count for the day
  int currentDayIndex = DateTime.now().weekday - 1; // 0 = Monday, 6 = Sunday

  late Stream<StepCount> _stepCountStream;
  StreamSubscription<StepCount>? _stepCountSubscription;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance?.addObserver(this);
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
    } else {
      print("Activity recognition permission is not granted.");
    }
  }

  Future<void> initializePedometer() async {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountSubscription = _stepCountStream.listen(
          (event) {
        print("Steps detected: ${event.steps}");
        onStepCount(event);
      },
      onError: (error) => print("Step count error: $error"),
    );
  }

  void onStepCount(StepCount event) {
    int todayIndex = DateTime.now().weekday - 1; // Get today's index (0 = Monday)

    // Reset baseline if the day has changed
    if (todayIndex != currentDayIndex) {
      currentDayIndex = todayIndex;
      baselineStepCount = event.steps; // Set new baseline for today
      weeklySteps[currentDayIndex] = 0; // Reset today's steps in the weekly array
    }

    // Update daily steps by subtracting the baseline
    if (baselineStepCount != null) {
      weeklySteps[currentDayIndex] = event.steps - baselineStepCount!;
    }
    stepCount.value = weeklySteps[currentDayIndex];
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
  void onClose() {
    WidgetsBinding.instance?.removeObserver(this);
    _stepCountSubscription?.cancel();
    super.onClose();
  }
}
