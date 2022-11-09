import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lotto_game/Main/page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations( [DeviceOrientation.portraitUp]); // 가로모드 방지
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, //디버그 모드 해제
      title: 'MarreAuto',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Noto Sans CJK KR',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      popGesture: true,
      defaultTransition: Transition.cupertino,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  //여기는 스플래쉬 이미지 몇초간 유지 할것인지
  dynamic startTime() {
    var _duration = const Duration(seconds: 3); // 몇초간 스플래쉬 이미지 보여줄것인지
    return Timer(_duration, _goToMain);
  }

  void _goToMain(){
    Get.offAll(()=> const Page1());
    // Get.to (페이지 라우터 // 뒤로 가기 버튼 누르면 이전 페이지로 이동
    // Get.offAll (페이지 라우터 // 라우터 전까지 모든 내용 파벌되서 뒤로 가기 버튼 안됨
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "img/logo.png",
                height: 100,
                //fit: BoxFit.fill, // 이미지 최대 사이즈4|
                //width: double.infinity, // 이미지 가로 최대 늘리기
              ),
            ),
          ],
        )
    );
  }
}