import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_tracker/screens/login_screen.dart';
import 'package:travel_tracker/services/auth_service.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: MaterialApp(
        title: 'Travel Tracker',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            primary: Colors.green,
            secondary: Colors.blue,
          ),
          useMaterial3: true,
        ),
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}