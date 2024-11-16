
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pedometer/pedometer.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
  static const int dailyStepTarget = 20000; // Target steps per day

  Stream<StepCount>? _stepCountStream;
  StreamSubscription<StepCount>? _stepCountSubscription;
  List<double> weeklyCalories = List<double>.filled(7, 0.0);

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
    if (baselineStepCount == null) {
      baselineStepCount = event.steps;
    }

    if (todayIndex != currentDayIndex) {
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
      }

    }



    double caloriesBurned = calculateCalories(stepCount);
    print('Calories burned: $caloriesBurned');
  }


  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        elapsedTime += Duration(seconds: 1);  // Update elapsed time
      });
    });
    setState(() {
      isTracking = true;  // Indicate that the tracking is started
    });
  }


  void stopTimer() {
    _timer?.cancel();
    setState(() {
      isTracking = false;
    });
  }

  





  void onResumeTracking() {
    setState(() {
      isTracking = true;
    });
    startListening(); // Resume step tracking
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _stepCountSubscription?.isPaused == true) {
      _stepCountSubscription?.resume();
    } else if (state == AppLifecycleState.paused) {
      _stepCountSubscription?.pause();
    }

    if (state == AppLifecycleState.paused || state == AppLifecycleState.detached) {
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
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[index];
  }

  double calculateCalories(int steps) {
    const double caloriesPerStep = 0.04;  // Estimated calories per step
    return steps * caloriesPerStep;
  }
  String formatElapsedTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);
    return "$hours:${twoDigits(minutes)}:${twoDigits(seconds)}";
  }





  @override
  Widget build(BuildContext context) {
    double progress = (stepCount / dailyStepTarget).clamp(0, 1); // Progress towards daily target

    return Scaffold(
      appBar: AppBar(title: Text('Step Counter')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProgressContainer(
                    label: '${calculateCalories(stepCount)}', // Show calories
                    value: 'Kcal',
                  ),
                  ProgressContainer(
                    label: '${formatElapsedTime(elapsedTime)}', // Show elapsed time
                    value: 'Time',
                  ),
                  ProgressContainer(
                    label: '${stepCount}', // Show steps count
                    value: 'Steps',
                  ),
                ],
              ),


              // Display today's total step count in a large font
              Text(
                'Today\'s Steps',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Circular progress indicator with step count
              Stack(
                alignment: Alignment.center,
                children: [
                  // Circular progress indicator
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(
                      value: progress,               // Set progress as step count percentage of target
                      strokeWidth: 15,               // Make the circle stroke bold
                      backgroundColor: Colors.grey[300], // Background for unachieved progress
                      color: Colors.orange,            // Progress color
                    ),
                  ),
                  // Centered step count text
                  Text(
                    '$stepCount',                  // Display today's steps count only
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(height: 20),
              // // Start and stop buttons
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
              // Weekly steps section
              Text(
                'Weekly Steps',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Wrap(
                spacing: 10,
                children: List.generate(7, (index) {
                  // Calculate the progress towards the daily step target for each day
                  double dayProgress = (weeklySteps[index] / dailyStepTarget).clamp(0, 1);

                  return Column(
                    children: [
                      Text(
                        _getDayName(index),
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          // Circular progress indicator
                          SizedBox(
                            width: 50,  // Set the size of the progress circle
                            height: 50,
                            child: CircularProgressIndicator(
                              value: dayProgress,           // Set progress for the day
                              strokeWidth: 6,               // Width of the progress indicator
                              backgroundColor: Colors.grey[300],  // Unachieved progress color
                              color: Colors.blue,           // Progress color (customize as needed)
                            ),
                          ),
                          // Display the number of steps inside the progress circle
                          Text(
                            '${weeklySteps[index]}', // Show steps count for the day
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),

            ],
          ),
        ),
      ),
    );
  }



}


class ProgressContainer extends StatelessWidget {
  final Icon? iconPath;
  final String label;
  final String value;

  ProgressContainer({ this.iconPath, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox( height: 2,),

      Icon(Icons.ac_unit,
      size: 24,),

        SizedBox( height: 4,),

        Text(label),
        SizedBox( height: 2,),


        Text(value),
      ],
    );
  }
}

