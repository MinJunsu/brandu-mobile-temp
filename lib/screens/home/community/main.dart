import 'package:brandu/components/color.dart';
import 'package:brandu/components/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final tempProfileImages = [
  {
    'id': 1,
    'user': {
      'id': 1,
      'name': '더용',
      'profileImage': 'assets/images/user/img.png',
    },
    'isWatched': false,
  },
  {
    'id': 2,
    'user': {
      'id': 2,
      'name': '호날두',
      'profileImage': 'assets/images/user/img.png',
    },
    'isWatched': false,
  },
  {
    'id': 3,
    'user': {
      'id': 3,
      'name': '프레드',
      'profileImage': 'assets/images/user/img.png',
    },
    'isWatched': false,
  },
  {
    'id': 4,
    'user': {
      'id': 4,
      'name': '맥토미니',
      'profileImage': 'assets/images/user/img.png',
    },
    'isWatched': false,
  },
  {
    'id': 5,
    'user': {
      'id': 5,
      'name': '브루누',
      'profileImage': 'assets/images/user/img.png',
    },
    'isWatched': true,
  },
  {
    'id': 6,
    'user': {
      'id': 6,
      'name': '래시포드',
      'profileImage': 'assets/images/user/img.png',
    },
    'isWatched': true,
  },
  {
    'id': 7,
    'user': {
      'id': 7,
      'name': '래시포드',
      'profileImage': 'assets/images/user/img.png',
    },
    'isWatched': true,
  },
  {
    'id': 8,
    'user': {
      'id': 8,
      'name': '래시포드',
      'profileImage': 'assets/images/user/img.png',
    },
    'isWatched': true,
  },
  {
    'id': 9,
    'user': {
      'id': 9,
      'name': '래시포드',
      'profileImage': 'assets/images/user/img.png',
    },
    'isWatched': true,
  },
];

final tempPosts = [
  {
    'id': 1,
    'rank': 1,
    'user': {
      'id': 9,
      'name': '래시포드',
      'profileImage': 'assets/images/user/img.png',
    },
    'title': '댄디룩 완성',
    'backdropImage': 'assets/images/community/img.png',
    'tags': [
      {
        'id': 1,
        'name': '크라프트 백',
      },
      {
        'id': 2,
        'name': '출장',
      }
    ]
  },
  {
    'id': 1,
    'rank': 1,
    'user': {
      'id': 9,
      'name': '래시',
      'profileImage': 'assets/images/user/img.png',
    },
    'title': '여름 나들이',
    'backdropImage': 'assets/images/community/img_1.png',
    'tags': [
      {
        'id': 1,
        'name': '크라프트 백',
      },
      {
        'id': 3,
        'name': '셔츠',
      }
    ]
  },
  {
    'id': 1,
    'rank': 1,
    'user': {
      'id': 9,
      'name': '래시',
      'profileImage': 'assets/images/user/img.png',
    },
    'title': '여름 나들이',
    'backdropImage': 'assets/images/community/img_1.png',
    'tags': [
      {
        'id': 1,
        'name': '크라프트 백',
      },
      {
        'id': 3,
        'name': '셔츠',
      }
    ]
  },
];

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Wrap(
                      spacing: 10,
                      children: [],
                      //   children: userStories
                      //       .map(
                      //         (userStory) => userCircleIcon(userStory),
                      //       )
                      //       .toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MediumBoldText('오늘의 인기 게시글', Colors.black),
                  XSmallText('전체보기', lightGreyColor),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Container(),
                        // child: Wrap(
                        //   spacing: 15,
                        //   children: posts
                        //       .map(
                        //         (post) => bestPost(post),
                        //       )
                        //       .toList(),
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  XSmallText('시간순 ', lightGreyColor),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
