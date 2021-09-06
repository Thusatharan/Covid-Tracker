import 'package:corona_stats/HomePage.dart';
import 'package:corona_stats/Providers/stats_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(MultiProvider(providers: providers, child: MyApp()));
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<StatsProvider>(create: (_) => StatsProvider()),
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Corona Stats',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color.fromRGBO(137, 255, 19, 1),
        accentColor: Color.fromRGBO(27, 133, 27, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
