import 'package:flutter/material.dart';
import 'package:makeup_app/router/router.dart';

void main() {
  runApp(const MakeupApp());
}

class MakeupApp extends StatefulWidget {
  const MakeupApp({super.key});

  @override
  State<MakeupApp> createState() => _MakeupAppState();
}

class _MakeupAppState extends State<MakeupApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Makeup App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
        
      ),
      routerConfig: _appRouter.config(),      
    );
  }
}

