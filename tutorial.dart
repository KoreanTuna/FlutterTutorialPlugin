import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class TutorialTest extends StatefulWidget {
  @override
  _TutorialTestState createState() => _TutorialTestState();
}

class _TutorialTestState extends State<TutorialTest>
    with SingleTickerProviderStateMixin {
  //튜토리얼 오브젝트 생성
  late TutorialCoachMark tutorialCoachMark;
//튜토리얼 진행 단계를 저장할 리스트
  List<TargetFocus> targetsList = [];

  //튜토리얼 단계별 위젯들을 지정할 키 생성
  GlobalKey key1 = GlobalKey();
  GlobalKey key2 = GlobalKey();
  GlobalKey key3 = GlobalKey();
  GlobalKey key4 = GlobalKey();

  void initTarget(String script, GlobalKey tutorialkey) {
    targetsList.add(
      TargetFocus(
        focusAnimationDuration: Duration(milliseconds: 500),
        radius: 12,
        identify: "Target 0",
        keyTarget: tutorialkey,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.right,
            child: Container(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    script,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 6),
                  Text(
                    "(밝은 부분을 클릭해 다음으로 넘어가세요)",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showTutorial() {
    tutorialCoachMark = TutorialCoachMark(context,
        targets: targetsList, colorShadow: Colors.black, opacityShadow: 0.85)
      ..show();
  }

  void _afterLayout(_) {
    Future.delayed(Duration(microseconds: 100));
    showTutorial();
  }

  @override
  void initState() {
    initTarget("1번 키의 설명을 위한 텍스트입니다.", key1);
    initTarget("2번 키의 설명을 위한 텍스트입니다.", key2);
    initTarget("3번 키의 설명을 위한 텍스트입니다.", key3);
    initTarget("4번 키의 설명을 위한 텍스트입니다.", key4);
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(_afterLayout);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 36),
                Text(
                  "1번 키 위젯",
                  style: TextStyle(fontSize: 24, color: Colors.blue),
                  key: key1,
                ),
                SizedBox(height: 36),
                Text(
                  "2번 키 위젯",
                  style: TextStyle(fontSize: 24, color: Colors.blue),
                  key: key2,
                ),
                SizedBox(height: 36),
                Text(
                  "3번 키 위젯",
                  style: TextStyle(fontSize: 24, color: Colors.blue),
                  key: key3,
                ),
                SizedBox(height: 36),
                Text(
                  "4번 키 위젯",
                  style: TextStyle(fontSize: 24, color: Colors.blue),
                  key: key4,
                ),
                SizedBox(height: 36),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
