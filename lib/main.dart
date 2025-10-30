import 'package:flutter/material.dart';
import 'package:untitled6/ToDoAppFirstPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              // Set the predictive back transitions for Android.
              TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
            },
          ),
        ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/ToDoAppFirstPage',
      routes: {
        '/ToDoAppFirstPage': (context) => const ToDoAppFirstPage(),
      }
    );
  }
}


