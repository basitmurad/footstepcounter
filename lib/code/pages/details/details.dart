import 'package:counter/code/pages/details/widgets/appbar.dart';
import 'package:counter/code/pages/details/widgets/dates.dart';
import 'package:counter/code/pages/details/widgets/graph.dart';
import 'package:counter/code/pages/details/widgets/info.dart' hide Stats;
import 'package:counter/code/pages/details/widgets/info.dart' hide Stats;
import 'package:counter/code/pages/details/widgets/stats.dart';
import 'package:counter/code/pages/details/widgets/steps.dart';

import 'package:flutter/material.dart';

import '../../widgets/bottom_navigation.dart';
import 'widgets/info.dart' hide Stats;

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(appBar: AppBar()),
      body: Column(
        children: const [
          Dates(),
          Steps(),
          Graph(),
          Info(),
          Divider(height: 30),
          Stats(),
          SizedBox(height: 30),
          BottomNavigation(),
        ],
      ),
    );
  }
}
