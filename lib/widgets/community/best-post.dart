// import 'package:brandu/components/color.dart';
// import 'package:brandu/components/text.dart';
// import 'package:brandu/models/community.dart';
// import 'package:flutter/material.dart';
//
// Widget bestPost(Post post) {
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           width: 156,
//           height: 200,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             image: DecorationImage(
//               fit: BoxFit.cover,
//               image: AssetImage(post.backdropImage),
//             ),
//           ),
//           child: Container(
//             width: 10,
//             alignment: Alignment.topLeft,
//             margin: const EdgeInsets.only(
//               left: 5,
//             ),
//             child: Container(
//               alignment: Alignment.center,
//               width: 30,
//               height: 30,
//               color: mainColor,
//               child: LargeBoldText.withoutColor(
//                 post.rank.toString(),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Row(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   width: 1,
//                   color: Colors.white,
//                 ),
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                   fit: BoxFit.fill,
//                   image: AssetImage(post.user.profileImage),
//                 ),
//               ),
//               width: 35,
//               height: 35,
//             ),
//             const SizedBox(
//               width: 5,
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Wrap(
//                   spacing: 5,
//                   children: post.tags
//                       .map((tag) => XSmallText('#${tag.name}', greyColor))
//                       .toList(),
//                 ),
//                 SmallBoldText(post.title, Colors.black),
//               ],
//             ),
//           ],
//         )
//       ],
//     ),
//   );
// }
