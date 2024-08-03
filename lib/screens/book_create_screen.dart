import 'package:book/functions/network.dart';
import 'package:book/models/book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCreateBookDialog(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const CreateBookScreen();
      });
}

void showCheckDialog(BuildContext context, Book book) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
          title: const Text(
            '추가하기',
            style: TextStyle(
                color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          content: const Text('추가하시겠습니까?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('취소')),
            TextButton(
                onPressed: () {
                  postBook(book);
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
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextFormField(
            validator: (value) {
              if (value?.isEmpty ?? false) {
                return "제목을 입력해주세요";
              }
              return null;
            },
            onSaved: onSaved,
          ),
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
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextFormField(
            validator: (value) {
              if (value?.isEmpty ?? false) {
                return "저자를 입력하세요";
              }
              return null;
            },
            onSaved: onSaved,
          ),
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
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextFormField(
            validator: (value) {
              if (value?.isEmpty ?? false) {
                return "이미지url를 입력하세요";
              }
              return null;
            },
            onSaved: onSaved,
          ),
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
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextFormField(
            validator: (value) {
              if (value?.isEmpty ?? false) {
                return "출판사를 입력하세요";
              }
              return null;
            },
            onSaved: onSaved,
          ),
        ),
      ),
    ],
  );
}

class CreateBookScreen extends StatefulWidget {
  const CreateBookScreen({super.key});

  @override
  State<CreateBookScreen> createState() => _CreateBookScreenState();
}

class _CreateBookScreenState extends State<CreateBookScreen> {
  GlobalKey<FormState> titleFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? title;
  String? author;
  String? publicher;
  String? image;
  String? content;

  bool titleStatus = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        surfaceTintColor: Colors.white,
        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        title: const Text(
          "도서 추가하기",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.amber),
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
              child: Text(
                (titleStatus ? "중복 검사 성공" : '중복 검사 실패'),
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              onPressed: () async {
                if (titleFormKey.currentState?.validate() ?? false) {
                  titleFormKey.currentState?.save();
                  // true : 제목 중복 검사 성공 = DB에 중복되는 제목이 없음
                  titleStatus = await titleCheck(title!);
                  if (!titleStatus) {
                    Get.snackbar(
                      "다시",
                      "중복 검사를 하십시오......",
                      colorText: Colors.black,
                      backgroundColor: Colors.white,
                      duration: const Duration(seconds: 2),
                      snackPosition: SnackPosition.TOP,
                      forwardAnimationCurve: Curves.elasticInOut,
                      reverseAnimationCurve: Curves.easeOut,
                    );
                    return;
                  }
                  setState(() {});
                  return;
                }
              },
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("취소")),
          TextButton(
              onPressed: () {
                bool otherStatus = formKey.currentState?.validate() ?? false;
                bool titleStatus =
                    titleFormKey.currentState?.validate() ?? false;
                if (otherStatus && titleStatus) {
                  formKey.currentState?.save();
                  titleFormKey.currentState?.save();
                  if (!this.titleStatus) {
                    Get.snackbar(
                      "다시",
                      "중복 검사를 하십시오......",
                      colorText: Colors.black,
                      backgroundColor: Colors.white,
                      duration: const Duration(seconds: 2),
                      snackPosition: SnackPosition.TOP,
                      forwardAnimationCurve: Curves.elasticInOut,
                      reverseAnimationCurve: Curves.easeOut,
                    );
                    return;
                  }
                  showCheckDialog(
                      context,
                      Book(content ?? "",
                          title: title!,
                          author: author!,
                          image: image!,
                          publicher: publicher!));
                }
              },
              child: const Text("추가")),
        ],
      ),
    );
  }
}
