// import 'package:flutter/material.dart';
// import 'package:flutter_config/flutter_config.dart';
// import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
//
// import 'package:brandu/enviroments/main.dart';
// import 'package:brandu/main.dart';
//
// void main() {
//   initialize();
//
//   const configuredApp = AppConfig(
//     flavorName: 'inhouse',
//     apiBaseUrl: 'https://api.example.com/',
//     child: App(),
//   );
//
//   runApp(configuredApp);
// }
//
// void initialize() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await FlutterConfig.loadEnvVariables();
//   KakaoSdk.init(nativeAppKey: FlutterConfig.get('KAKAO_NATIVE_KEY'));
// }
