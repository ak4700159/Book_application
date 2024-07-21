import 'package:book/models/book.dart';

class Sample {
  final List<Book> _books = [
    Book("ㅁ나ㅓ론ㅁㅇ랴모럄ㄴㄹㅁ나ㅓ론ㅁㅇ랴모럄ㄴㄹㅁ나ㅓ론ㅁㅇ랴모럄ㄴㄹㅁ나ㅓ론ㅁㅇ랴모럄ㄴㄹ",
        title: "프랑켄슈타인",
        author: "메리 셸리",
        image:
            "https://img.hankyung.com/photo/200908/2009082672551_2009082878801.jpg",
        publicher: "몰라"),
    Book("",
        title: "둘리",
        author: "몰라",
        image:
            "https://tse4.mm.bing.net/th?id=OIP.ain8Vz-oOecW4sSJhxKIQQHaEK&pid=Api&P=0&h=220",
        publicher: "몰라"),
  ];

  List<Book> getBooks() {
    return _books;
  }
}
