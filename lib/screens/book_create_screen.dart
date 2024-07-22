import 'package:flutter/material.dart';

void showCreateBookDialog(BuildContext context) {
  GlobalKey<FormState> titleFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String title = "";
  String author = "";
  String publicher = "";
  String image = "";

  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            shape:
                const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
            title: const Text(
              "도서 추가하기",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
            ),
            content: Column(
              children: [
                Form(
                    key: titleFormKey,
                    child: titleRow((value) {
                      title = value;
                    })),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      authorRow(
                        (value) {
                          author = value;
                        },
                      ),
                      publicherRow(
                        (value) {
                          publicher = value;
                        },
                      ),
                      imageRow(
                        (value) {
                          image = value;
                        },
                      ),
                    ],
                  ),
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
                    if (titleFormKey.currentState?.validate() ?? false) {
                      print('제목 유효성 검사 성공');
                      return;
                    } else {
                      print('제목 유효성 검사 실패');
                      return;
                    }

                    // 서버로 부터 데이터 중복 검사
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    print('뒤로가기');
                    Navigator.of(context).pop();
                  },
                  child: const Text("취소")),
              TextButton(
                  onPressed: () {
                    if ((formKey.currentState?.validate() ?? false) &&
                        (titleFormKey.currentState?.validate() ?? false)) {
                      formKey.currentState?.save();
                      titleFormKey.currentState?.save();
                      print('전체 유효성 검사 성공');
                    } else {
                      print('전체 유효성 검사 실패');
                      return null;
                    }
                    print('$title, $author, $publicher, $image');
                    showCheckDialog(context);
                  },
                  child: const Text("추가")),
            ],
          ),
        );
      });
}

void showCheckDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
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

Widget titleRow(FormFieldSetter onSaved) {
  return Row(
    children: [
      const Expanded(
        flex: 1,
        child: SizedBox(
          width: 5,
          child: Center(
            child: Text(
              '제목',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: TextFormField(
          validator: (value) {
            if (value?.isEmpty ?? false) {
              print('제목 검사 실패');
              return "값을 넣어요";
            }
            return null;
          },
          onSaved: onSaved,
        ),
      ),
    ],
  );
}

Widget authorRow(FormFieldSetter onSaved) {
  return Row(
    children: [
      const Expanded(
        flex: 1,
        child: SizedBox(
          width: 5,
          child: Center(
            child: Text(
              '저자',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: TextFormField(
          validator: (value) {
            return null;
          },
          onSaved: onSaved,
        ),
      ),
    ],
  );
}

Widget imageRow(FormFieldSetter onSaved) {
  return Row(
    children: [
      const Expanded(
        flex: 1,
        child: SizedBox(
          width: 5,
          child: Center(
            child: Text(
              '이미지 url',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: TextFormField(
          validator: (value) {
            return null;
          },
          onSaved: onSaved,
        ),
      ),
    ],
  );
}

Widget publicherRow(FormFieldSetter onSaved) {
  return Row(
    children: [
      const Expanded(
        flex: 1,
        child: SizedBox(
          width: 5,
          child: Center(
            child: Text(
              '출판사',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: TextFormField(
          validator: (value) {
            return null;
          },
          onSaved: onSaved,
        ),
      ),
    ],
  );
}
