import 'package:book/models/book.dart';
import 'package:get/get.dart';

class Books extends GetxController {
  late List<Book> books;
  late List<bool> isChecked;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    books = await fetchBook();
  }

  void updateBook() async {
    books = await fetchBook();
  }

  void deleteBook(String title) {
    books.removeWhere((book) => book.title == title);
  }

  void insertBook(Book book) {
    books.add(book);
  }

  void sortBook(bool asent) {
    if (asent == true) {
      books.sort((a, b) => a.title.length.compareTo(b.title.length));
    } else {
      books.sort((a, b) => b.title.length.compareTo(a.title.length));
    }
  }

  void modifyBook(Book book) {
    books = books.map((value) {
      if (value.title == book.title) {
        return book;
      }
      return value;
    }).toList();
  }
}
