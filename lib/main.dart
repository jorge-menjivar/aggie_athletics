import 'package:flutter/material.dart';
import '../app_variables.dart';
import 'bottom_nav.dart';

// -----------------Firebase-----------------
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Authentication());
}

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  AuthenticationState createState() => AuthenticationState();
}

class AuthenticationState extends State<Authentication> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late User _user;
  bool _loaded = false;
  bool _authenticated = true;

  @override
  void initState() {
    super.initState();
    loggedIn();
    // _downloadData();
  }

  void loggedIn() async {
    _auth.authStateChanges().listen((User? user) {
      setState(() {
        _loaded = true;
        if (user != null) {
          _user = user;
          _authenticated = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return MaterialApp(
        theme: lightTheme(),
        darkTheme: darkTheme(),
        home: Scaffold(
          body: (_authenticated) ? const BottomNav() : const BottomNav(),
        ),
      );
    }
  }

  ThemeData lightTheme() {
    // Feel free to change
    // This is the light theme for the app.
    // All colors and other UI customizations should be done here.
    return ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppVariables.aggieBlue,
          onPrimary: Colors.white,
          secondary: AppVariables.aggieGold,
          onSecondary: AppVariables.aggieBlue,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.grey,
          onBackground: Colors.white,
          surface: Colors.grey,
          onSurface: Colors.black),
      dividerColor: Colors.black12,
      iconTheme: const IconThemeData(
        color: Colors.black87,
        opacity: 1,
        size: 25,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 1,
        shadowColor: Colors.black,
      ),
      cardColor: Colors.grey[100],
    );
  }

  ThemeData darkTheme() {
    // Feel free to change
    // This is the light theme for the app.
    // All colors and other UI cuztomizations should be done here.
    return ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: AppVariables.aggieBlue,
          onPrimary: Colors.white,
          secondary: AppVariables.aggieGold,
          onSecondary: AppVariables.aggieBlue,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.grey,
          onBackground: Colors.white,
          surface: Colors.black87,
          onSurface: AppVariables.aggieGold),
      dividerColor: Colors.black12,
      iconTheme: const IconThemeData(
        color: Colors.white,
        opacity: 1,
        size: 25,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 1,
        shadowColor: Colors.black,
      ),
      cardColor: Colors.grey[800],
    );
  }
}
