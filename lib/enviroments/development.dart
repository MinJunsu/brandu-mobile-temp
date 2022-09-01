import 'package:brandu/enviroments/main.dart';
import 'package:brandu/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

void main() {
  initialize();

  const configuredApp = AppConfig(
    flavorName: 'development',
    apiBaseUrl: 'https://api.example.com/',
    child: App(),
  );

  runApp(configuredApp);
}

void initialize() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await FlutterConfig.loadEnvVariables();
  // KakaoSdk.init(nativeAppKey: FlutterConfig.get('KAKAO_NATIVE_KEY'));
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
}
