import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicktrack/assets/assets.dart';
import 'package:quicktrack/pages/pages.dart';
import 'package:window_manager/window_manager.dart';

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
  final List<Widget> pages = [HomePage(), SettingsPage(), AboutPage()];

  void onPageChanged(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    windowManager.ensureInitialized();
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setTitle("QuickTrack");
      await windowManager.setMinimumSize(const Size(800, 600));
      await windowManager.setSize(const Size(800, 600));
      await windowManager.center();
      await windowManager.show();
      await windowManager.focus();
    });

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
