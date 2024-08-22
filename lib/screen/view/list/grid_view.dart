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
                  child: getBookGirdTile(
                      bookController.books[index], context, () {}, index));
            });
  }
}

Widget getBookGirdTile(
    Book book, BuildContext context, Function onDeleteBook, int index) {
  return Container(
    margin: const EdgeInsets.all(10.0),
    padding: const EdgeInsets.all(15.0),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        color: ((index % 4 == 1) || (index % 4 == 2))
            ? Colors.grey
            : Colors.white),
    child: GridTile(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              book.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Image.network(
            book.image,
            errorBuilder: (context, object, stack) {
              return const Icon(
                Icons.library_books,
                size: 60,
              );
            },
          ),
        ],
      ),
    ),
  );
}
