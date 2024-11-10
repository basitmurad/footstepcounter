// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'StepController.dart';
//
// class StepProgressChart extends StatelessWidget {
//   final StepController stepController = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300,
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 1),
//         ],
//       ),
//       child: Obx(() {
//         // Get the maximum steps for the past week
//         double maxY = stepController.dailySteps
//             .map((e) => e.value.toDouble())
//             .reduce((a, b) => a > b ? a : b);
//
//         return LineChart(
//           LineChartData(
//             titlesData: FlTitlesData(
//               leftTitles: AxisTitles(
//                 sideTitles: SideTitles(showTitles: true),
//               ),
//               bottomTitles: AxisTitles(
//                 sideTitles: SideTitles(showTitles: true),
//               ),
//             ),
//             borderData: FlBorderData(show: true),
//             minX: 0,
//             maxX: 6,
//             minY: 0,
//             maxY: maxY,
//             lineBarsData: [
//               LineChartBarData(
//                 spots: List.generate(7, (index) {
//                   return FlSpot(index.toDouble(), stepController.dailySteps[index].value.toDouble());
//                 }),
//                 isCurved: true,
//                 color: Colors.blue,
//                 dotData: FlDotData(show: false),
//                 belowBarData: BarAreaData(show: false),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }
