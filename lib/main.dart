import 'package:brandu/components/color.dart';
import 'package:brandu/screens/home/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';

Future<String> getSessionToken() async {
  return await SessionManager().get("token");
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        primaryColor: mainColor,
        fontFamily: 'Noto Sans KR',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
