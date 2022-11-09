import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotto_game/Main/global.dart';
import 'package:lotto_game/Main/page1.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<Color> appColors = [
    Colors.redAccent,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.deepPurple,
  ];
  List<int> victoryLotto = [];
  int victoryCnt = 0;
  int victoryZeroCnt = 0;
  List<int> result = [0,0]; // 결과


  void getData(){
    // List.generate(6-victoryLotto.length, (index) {
    //     var rnd = Random().nextInt(45) + 1;
    //     // 만약 리스트에 생성된 번호가 없다면
    //     if (!victoryLotto.contains(rnd)) {
    //       // 리스트에 추가해준다.
    //       victoryLotto.add(rnd);
    //     }
    //   });

      // while (victoryLotto.length == 6) { //조건 반복문이 필요
      //   var rnd = Random().nextInt(45) + 1;
      //   // 만약 리스트에 생성된 번호가 없다면
      //   if (!victoryLotto.contains(rnd)) {
      //     // 리스트에 추가해준다.
      //     victoryLotto.add(rnd);
      //   }
      // }

      while (true) {
        // 랜덤으로 번호를 생성해준다.
        var rnd = Random().nextInt(45) + 1;

        // 만약 리스트에 생성된 번호가 없다면
        if (!victoryLotto.contains(rnd)) {
          // 리스트에 추가해준다.
          victoryLotto.add(rnd);
        }

        // 리스트의 길이가 6이면 while문을 종료한다.
        if (victoryLotto.length == 6) break;
      }


      List.generate(6, (i) {
        if (global.myLotto[i] == 0) victoryZeroCnt++;
        List.generate(6, (j) =>
        {
          if(global.myLotto[i] == victoryLotto[j]){
            victoryCnt++
          }
        });
      });

      result[1] = victoryCnt > 1 && victoryCnt < 7 ? 7 - victoryCnt : 6;
      result[0] = victoryZeroCnt + victoryCnt > 1 && victoryZeroCnt + victoryCnt < 7 ? 7 - (victoryZeroCnt + victoryCnt) : 6;

      // if(victoryZeroCnt+victoryCnt == 2) result[0] = 5;
      // else if(victoryZeroCnt+victoryCnt == 3) result[0] = 4;
      // else if(victoryZeroCnt+victoryCnt == 4) result[0] = 3;
      // else if(victoryZeroCnt+victoryCnt == 5) result[0] = 2;
      // else if(victoryZeroCnt+victoryCnt == 6) result[0] = 1;
      // else result[0] = 6;
      //
      // if(victoryCnt == 2) result[1] = 5;
      // else if(victoryCnt == 3) result[1] = 4;
      // else if(victoryCnt == 4) result[1] = 3;
      // else if(victoryCnt == 5) result[1] = 2;
      // else if(victoryCnt == 6) result[1] = 1;
      // else result[1] = 6;
  }


  @override
  void initState() {
    getData();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50,left: 30,right: 30,bottom: 30),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '이번주 로또 당첨 번호는?!?!',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: GridView.count(
                          crossAxisCount: 6,  // 열 개수
                          children: List<Widget>.generate(victoryLotto.length, (idx) {
                            return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: appColors[idx]
                                ),
                                margin: const EdgeInsets.all(5),
                                child: Center(
                                  child: Text(
                                    '${victoryLotto[idx]}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                            );
                          }).toList()
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '내가 주운 로또의 번호는?!?!',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: GridView.count(
                          crossAxisCount: 6,  // 열 개수
                          children: List<Widget>.generate(global.myLotto.length, (idx) {
                            return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.red
                                ),
                                margin: const EdgeInsets.all(5),
                                child: Center(
                                  child: Text(
                                    '${global.myLotto[idx]}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                            );
                          }).toList()
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '나의 최고 순위는 : ${result[0]}등',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Text(
                      '나의 최저 순위는 : ${result[1]}등',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          global.myLotto.clear();
                          setState(() {});
                          Get.offAll(()=> const Page1());
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                          child: const Text(
                            '다시하기',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
