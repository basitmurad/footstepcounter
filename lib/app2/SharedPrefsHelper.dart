import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static const String _stepCountKey = 'stepCount';
  static const String _weeklyStepsKey = 'weeklySteps';
  static const String _weeklyCaloriesKey = 'weeklyCalories'; // New key for weekly calories
  static const String _distanceKey = 'distance';
  static const String _elapsedTimeKey = 'elapsedTime';

  // Save today's step count
  static Future<void> saveStepCount(int stepCount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_stepCountKey, stepCount);
  }

  // Retrieve today's step count
  static Future<int> getStepCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_stepCountKey) ?? 0;
  }

  // Save weekly steps
  static Future<void> saveWeeklySteps(List<int> weeklySteps) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_weeklyStepsKey, weeklySteps.map((e) => e.toString()).toList());
  }

  // Retrieve weekly steps
  static Future<List<int>> getWeeklySteps() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? stepsStringList = prefs.getStringList(_weeklyStepsKey);
    return stepsStringList?.map((e) => int.parse(e)).toList() ?? List<int>.filled(7, 0);
  }

  // Save weekly calories
  static Future<void> saveWeeklyCalories(List<double> weeklyCalories) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_weeklyCaloriesKey, weeklyCalories.map((e) => e.toString()).toList());
  }

  // Retrieve weekly calories
  static Future<List<double>> getWeeklyCalories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? caloriesStringList = prefs.getStringList(_weeklyCaloriesKey);
    return caloriesStringList?.map((e) => double.parse(e)).toList() ?? List<double>.filled(7, 0.0);
  }

  // Save distance covered
  static Future<void> saveDistance(double distance) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_distanceKey, distance);
  }

  // Retrieve distance covered
  static Future<double> getDistance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_distanceKey) ?? 0.0;
  }

  // Save elapsed time
  static Future<void> saveElapsedTime(Duration elapsedTime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_elapsedTimeKey, elapsedTime.inSeconds);
  }

  // Retrieve elapsed time
  static Future<Duration> getElapsedTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int seconds = prefs.getInt(_elapsedTimeKey) ?? 0;
    return Duration(seconds: seconds);
  }

  // Clear all saved data
  static Future<void> clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
