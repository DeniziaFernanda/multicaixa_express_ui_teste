import 'package:flutter/material.dart';
import 'package:multicaixa_express_ui/src/utils/colors.dart';
import 'package:multicaixa_express_ui/src/views/splash.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Multicaixa Express',
        theme: ThemeData(
          primarySwatch: myPrimaryColor,
        ),
        home: const Splash(),
    );
  }
}