import 'package:book/model(service)/book.dart';
import 'package:book/model(service)/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ------------  그리드뷰 ---------------
class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var bookController = Provider.of<BookController>(context);
    return bookController.books.isEmpty
        ? const Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('그리드뷰 데이터 로딩 중',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  strokeWidth: 7,
                  color: Colors.black,
                ),
              ),
            ],
          ))
        : GridView.builder(
            itemCount: bookController.books.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return GridTile(
                  header: Text(bookController.books[index].title),
                  child: getBookGirdTile(
                      bookController.books[index], context, () {}));
            });
  }
}

Widget getBookGirdTile(Book book, BuildContext context, Function onDeleteBook) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black, width: 2))),
      child: GridTile(
        child: Image.network(book.image),
      ),
    ),
  );
}
