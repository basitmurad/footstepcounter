import 'package:counter/code/pages/home/widgets/activity.dart';
import 'package:counter/code/pages/home/widgets/current.dart';
import 'package:counter/code/pages/home/widgets/header.dart';

import 'package:flutter/material.dart';

import '../../widgets/bottom_navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          AppHeader(),
          CurrentPrograms(),
          RecentActivities(),
          BottomNavigation(),
        ],
      ),
    );
  }
}
