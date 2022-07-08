
import 'package:flutter/material.dart';
import 'package:habr_career/ui/screens/home_page.dart';
import 'package:habr_career/ui/screens/login_page.dart';
import 'package:habr_career/ui/theme/themes.dart';


void main() {
  runApp(const AppView());
}




class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: ThemeMode.light,
      // home: const LoginPage(),
      initialRoute: '/',
      routes: {
        "/": (context) => const LoginPage(),
        '/home': (context) => const HomePage()
      },
    );
  }
}
