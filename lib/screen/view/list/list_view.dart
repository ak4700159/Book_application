import 'package:book/model(service)/book.dart';
import 'package:book/model(service)/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ------------  리스트뷰 ---------------
class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    var bookController = Provider.of<BookController>(context);
    // TODO: implement build
    return bookController.books.isEmpty
        ? const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('리스트뷰 데이터 로딩 중',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
            ),
          )
        : ListView.builder(itemBuilder: (BuildContext context, int index) {
            return getBookListTile(bookController.books[index], context,
                bookController.deleteBook);
          });
  }
}

Container getBookListTile(
    Book book, BuildContext context, Function onDeleteBook) {
  return Container(
    decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black, width: 2))),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        selectedColor: Colors.red,
        onLongPress: () {},
        onTap: () {},
        title: Text(book.title),
        leading: Image.network(
          book.image,
          errorBuilder: (context, object, stack) {
            return Image.network(
                "https://d0.awsstatic.com/Digital%20Marketing/sitemerch/sign-in/KO/Site-Merch_PAC_GuardDuty_Sign-in_KO.png");
          },
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_add)),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                onDeleteBook(book.title);
              },
            ),
          ],
        ),
      ),
    ),
  );
}
