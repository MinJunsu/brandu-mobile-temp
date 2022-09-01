// // import 'package:brandu/api/google_signin_api.dart';
// // import 'package:flutter_naver_login/flutter_naver_login.dart';
// import 'package:brandu/components/color.dart';
// import 'package:brandu/components/text.dart';
// import 'package:brandu/screens/poclicy.dart';
// import 'package:brandu/widgets/base/button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
//
// void googleLogin() async {
//   // final user = await GoogleSignInAPI.login();
//   // print(user);
// }
//
// void kakaoLogin() async {
//   try {
//     OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
//     print('카카오계정으로 로그인 성공 ${token.accessToken}');
//   } catch (error) {}
// }
//
// // void naverLogin() async {
// //   final NaverLoginResult result = await FlutterNaverLogin.logIn();
// //   print(result);
// // }
//
// class LoginPage extends StatelessWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: mainColor,
//         child: SafeArea(
//             child: Padding(
//           padding: const EdgeInsets.only(left: 30, right: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 80),
//               SvgPicture.asset('assets/icons/logo.svg'),
//               const SizedBox(height: 20),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   LargeText.withoutColor('나를 위한 친환경 브랜딩'),
//                   LargeText.withoutColor('나와 지구를 위한 가치소비 플랫폼')
//                 ],
//               ),
//               const SizedBox(height: 130),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   XLargeText.withoutColor('당신을 위한 친환경'),
//                   XLargeText.withoutColor('브랜드, 브랜뉴')
//                 ],
//               ),
//               const SizedBox(height: 100),
//               Wrap(
//                 runSpacing: 15,
//                 children: [
//                   getLoginButton(
//                       googleLogin, 'assets/icons/google.svg', '구글로 로그인'),
//                   getLoginButton(
//                       kakaoLogin, 'assets/icons/kakao.svg', '카카오톡으로 로그인'),
//                   getLoginButton(() {}, 'assets/icons/naver.svg', '네이버로 로그인'),
//                   getLoginButton(() {}, 'assets/icons/apple.svg', 'Apple로 로그인'),
//                 ],
//               ),
//               const SizedBox(height: 30),
//               GestureDetector(
//                 onTap: () {
//                   Get.to(() => const PolicyPage());
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                   child: MediumText.withoutColor('로그인 건너뛰기'),
//                 ),
//               )
//             ],
//           ),
//         )));
//   }
// }
