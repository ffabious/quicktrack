import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicktrack/assets/app_bar_widget.dart';
import 'package:quicktrack/assets/app_drawer_widget.dart';
import 'package:quicktrack/assets/my_app_state.dart';
import 'package:quicktrack/pages/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var pageIndex = 0;
  final List<Widget> pages = [
    HomePage(),
    Center(child: Text('Settings Page')),
    Center(child: Text('About Page')),
  ];

  void onPageChanged(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
    return MaterialApp(
      title: 'QuickTrack',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Scaffold(
        appBar: AppBarWidget(theme: theme),
        body: pages[pageIndex],
        drawer: AppDrawerWidget(onPageChanged: onPageChanged),
      ),
    );
  }
}
