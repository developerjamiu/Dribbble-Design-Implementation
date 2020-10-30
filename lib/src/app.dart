import 'package:dribbble_design/src/ui/screens/detail_screen.dart';
import 'package:dribbble_design/src/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'ui/screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: DetailScreen(),
    );
  }
}
