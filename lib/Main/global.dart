
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var global = Global(); // 글로벌 클래스 변수화 (인스턴스)

class Global {
  /// 상단의 메세지 표시 부분
  void msgShow(String title, String subtitle) {
    Get.snackbar(
      "",
      "",
      titleText: Text(
        title,
        style: const TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        subtitle,
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      borderColor: Colors.grey,
      borderWidth: 0.5,
    );
  }
  List<int> myLotto = [];
}
