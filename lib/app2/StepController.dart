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
