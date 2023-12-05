import 'package:depature/provider/funcprovider.dart';
import 'package:depature/screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => FuncProvider(), builder: (context, _) => MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(useMaterial3: true),
        theme: ThemeData(useMaterial3: true),
        themeMode:
            (Provider.of<FuncProvider>(context).themeDetail.isDark == false)
                ? ThemeMode.light
                : ThemeMode.dark,
        home: const SplashScreen());
  }
}
