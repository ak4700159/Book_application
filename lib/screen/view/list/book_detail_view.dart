import 'package:book/model(service)/book.dart';
import 'package:flutter/material.dart';

class DetailBookView extends StatelessWidget {
  DetailBookView({super.key});

  @override
  Widget build(BuildContext context) {
    // ModalRoute 객체를 통해서 디테일 페이지로 변환될 때 전달된
    // 인자를 받을 수 있게 된다.
    Map<String, Book> data =
        ModalRoute.of(context)?.settings.arguments as Map<String, Book>;
    Book book = data["book"] ??
        Book("content",
            title: "title",
            author: "author",
            image: "image",
            publicher: "publicher");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          book.title,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            book.image,
            errorBuilder: (context, object, stack) {
              return const Center(
                child: Icon(
                  Icons.library_books,
                  size: 100,
                ),
              );
            },
          ),
          Container(
            height: 2,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "제목 : ${book.title}",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "저자 : ${book.author}",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "출판사 : ${book.publicher}",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 2,
            color: Colors.black,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            //color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: RichText(
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    text:
                        "내용 : ${book.content!.isEmpty ? "빈문자열" : book.content ?? "null 값이 활성화되어 있는 상황"}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
