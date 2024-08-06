import 'package:book/functions/network.dart';
import 'package:book/models/book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModifyBookScreen extends StatefulWidget {
  const ModifyBookScreen({super.key});
  static const routeName = '/modify_screen';

  @override
  State<ModifyBookScreen> createState() => _ModifyBookScreenState();
}

class _ModifyBookScreenState extends State<ModifyBookScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _publicherController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  bool titleStatus = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _publicherController.dispose();
    _authorController.dispose();
    _contentController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final book = ModalRoute.of(context)!.settings.arguments as Book;
    _authorController.text = book.author;
    _publicherController.text = book.publicher;
    _imageController.text = book.image;
    _contentController.text = book.content ?? "";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '책 수정하기',
          style: TextStyle(
              color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                    child: Text(
                  '제목 ',
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                Expanded(
                    child: Text(
                  "[${book.title}]",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ))
              ],
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  modifyAuthorRow((value) {
                    book.author = value;
                  }),
                  modifyPublicherRow((value) {
                    book.publicher = value;
                  }),
                  modifyImageRow((value) {
                    book.image = value;
                  }),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _contentController,
                      validator: (value) {
                        if ((value?.length ?? 0) >= 300) {
                          return "300 글자 이상 입력할 수 없습니다";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        book.content = value;
                      },
                      maxLines: 6,
                      decoration: const InputDecoration(
                        label: Center(child: Text('책 내용 입력')),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 70,
                  height: 40,
                  child: FloatingActionButton(
                    heroTag: "btn2",
                    shape: const BeveledRectangleBorder(),
                    backgroundColor: const Color.fromARGB(220, 255, 255, 255),
                    onPressed: () {
                      if ((_formKey.currentState?.validate() ?? false)) {
                        _formKey.currentState?.save();
                        sendHttpMsg("PUT", book);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('수정 완료'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget modifyAuthorRow(FormFieldSetter onSaved) {
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
              controller: _authorController,
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

  Widget modifyImageRow(FormFieldSetter onSaved) {
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
              controller: _imageController,
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

  Widget modifyPublicherRow(FormFieldSetter onSaved) {
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
              controller: _publicherController,
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
}
