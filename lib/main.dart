import 'package:explorer/flutter_flow/flutter_flow_theme.dart';
import 'package:explorer/pages/blocks.dart';
import 'package:explorer/pages/explorer.dart';
import 'package:flutter/material.dart';
import 'pages/transactions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  // ignore: library_private_types_in_public_api
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  bool displaySplashImage = true;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () => setState(() => displaySplashImage = false),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'explorer',
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      home: Container(
        color: Colors.amber,
        child: Container(
          color: Colors.amber,
          child: const NavBarPage(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NavBarPage extends StatefulWidget {
  const NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  // ignore: library_private_types_in_public_api
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  int selectedIndex = 0;
  final List<Widget> tabs = [
    const MYCardWidget(),
    const BlocksPage(),
    const TransactionsContainer(),
    // const ValidatorPage(),
    // const AccountWidget(
    //   address:
    //       "0xd327e5ba5933cf6ac96092fdf095dad9f5b0d21b0449954f1ee3ce27247615ba",
    // ),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        backgroundColor: FlutterFlowTheme.of(context).darkBackground,
        selectedItemColor: FlutterFlowTheme.of(context).primaryColor,
        unselectedItemColor: FlutterFlowTheme.of(context).grayLight,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
              size: 20,
            ),
            activeIcon: Icon(
              Icons.explore,
              size: 24,
            ),
            label: " • ",
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              size: 20,
            ),
            activeIcon: Icon(
              Icons.book,
              size: 24,
            ),
            label: " • ",
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.change_circle,
              size: 20,
            ),
            activeIcon: Icon(
              Icons.change_circle,
              size: 24,
            ),
            label: " • ",
            tooltip: '',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.assignment_turned_in_rounded,
          //     size: 20,
          //   ),
          //   activeIcon: Icon(
          //     Icons.assignment_turned_in_rounded,
          //     size: 24,
          //   ),
          //   label: " • ",
          //   tooltip: '',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.person,
          //     size: 20,
          //   ),
          //   activeIcon: Icon(
          //     Icons.person,
          //     size: 24,
          //   ),
          //   label: " • ",
          //   tooltip: '',
          // ),
        ],
      ),
    );
  }
}
