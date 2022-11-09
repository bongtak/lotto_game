import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotto_game/Main/global.dart';

import 'page2.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final List<int> items = [];
  final List<bool> itemsState = [];
  //List<int> myLotto = [];

  @override
  void initState() {
    List.generate(45, (index) => items.add(index+1));
    List.generate(45, (index) => itemsState.add(false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset('img/logo.png', height: 80,),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text('${global.myLotto}')
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: Get.height * 0.55,
                  child: GridView.count(
                      crossAxisCount: 5,  // 열 개수
                      children: List<Widget>.generate(items.length, (idx) {
                        return InkWell(
                          onTap: (){
                            if(global.myLotto.length != 6 && itemsState[idx] == false){
                              global.myLotto.add(items[idx]);
                              itemsState[idx] = true;
                            } else {
                              global.msgShow("[안내사항]", "최대 6개, 최소 1개 까지 설정이 가능합니다 (중복X)");
                            }

                            setState(() {});
                          },
                          child: Container(
                              color: itemsState[idx] == true ? Colors.black87 : Colors.black12,
                              margin: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  '${items[idx]}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: itemsState[idx] == true ? Colors.white : Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                          ),
                        );
                      }).toList()
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      '찢어진 로또를 주웠다',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      '로또에는 어떻게 적혀 있는가?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      '*알아볼 수 있는 번호에만 표기해 주세요*',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          List.generate(6 - global.myLotto.length, (index) => global.myLotto.add(0));
                          global.myLotto.isNotEmpty ? Get.offAll(()=> const Page2()) : global.msgShow("[안내사항]", "최대 6개, 최소 1개 까지 설정이 가능합니다");
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                          child: const Text(
                            '당첨번호 확인하기',
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
            ),
          ),
        ),
      )
    );
  }
}
