import 'package:book/models/book.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.book});
  Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          book.title,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Image.network(
            book.image,
            errorBuilder: (context, object, stack) {
              return Image.network(
                  "https://d0.awsstatic.com/Digital%20Marketing/sitemerch/sign-in/KO/Site-Merch_PAC_GuardDuty_Sign-in_KO.png");
            },
          ),
          Container(
            height: 2,
            color: Colors.black,
          ),
          Text(
            "제목 : ${book.title}",
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            "저자 : ${book.author}",
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 2,
            color: Colors.black,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: RichText(
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text:
                        "내용 : ${book.content ?? "비어있습니다비어있습니다비어있습니다비어있습니다비어있습니다비어있습니다비어있습니다비어있습니다비어있습니다비어있습니다비어있습니다비어있습니다비어있습니다비어있습니다비어있습니다비어있습니다비어있습니다비어있습니다비어있습니다"}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
