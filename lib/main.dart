import 'package:flutter/material.dart';
import 'package:mask_info_clean_arch/core/router/router.dart';
import 'package:mask_info_clean_arch/di/di_setup.dart';

void main(List<String> args) {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Flutter Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
