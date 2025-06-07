import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicktrack/assets/add_button_widget.dart';
import 'package:quicktrack/assets/assets.dart';
import 'package:quicktrack/pages/pages.dart';
import 'package:window_manager/window_manager.dart';
import 'package:hive/hive.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GeneralState(),
      child: MaterialApp(
        title: 'QuickTrack',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyApp(),
      ),
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
  void initState() {
    super.initState();
    windowManager.ensureInitialized();
    windowManager.setTitleBarStyle(TitleBarStyle.normal);
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setTitle("QuickTrack");
      await windowManager.setMinimumSize(const Size(800, 600));
      await windowManager.setSize(const Size(800, 600));
      await windowManager.center();
      await windowManager.show();
      await windowManager.focus();
    });
    Hive.init('quicktrack_hive');
    Hive.openBox('settings');
  }

  @override
  Widget build(BuildContext context) {
    var theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
    return Scaffold(
      appBar: AppBarWidget(theme: theme),
      body: pages[pageIndex],
      drawer: AppDrawerWidget(onPageChanged: onPageChanged),
      floatingActionButton: pageIndex == 0
          ? AddButtonWidget(content: AddExpenseForm())
          : null,
    );
  }
}

class AddExpenseForm extends StatelessWidget {
  const AddExpenseForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Add Expense Form');
  }
}
