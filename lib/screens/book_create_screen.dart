import 'package:flutter/material.dart';

void showCreateBookDialog(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
          title: const Text(
            "도서 추가하기",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.amber),
          ),
          content: Form(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: 5,
                            child: Center(
                              child: Text(
                                '제목',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: TextFormField(),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: 5,
                            child: Center(
                              child: Text(
                                '저자',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: TextFormField(),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: 5,
                            child: Center(
                              child: Text(
                                '출판사',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: TextFormField(),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: 5,
                            child: Center(
                              child: Text(
                                '이미지 url',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: TextFormField(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      child: const Text(
                        '제목 중복 검사하기',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      onPressed: () {
                        // 서버로 부터 데이터 중복 검사
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("취소")),
            TextButton(
                onPressed: () {
                  showCheckDialog(context);
                },
                child: const Text("추가")),
          ],
        );
      });
}

void showCheckDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('추가하기'),
          content: const Text('추가하시겠습니까?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('취소')),
            TextButton(
                onPressed: () {
                  //

                  // 중복되는 title 없이 데이터 전송 성공 시
                  Navigator.popUntil(
                      context, ModalRoute.withName('/list_screen'));
                },
                child: const Text('추가 확정'))
          ],
        );
      });
}
