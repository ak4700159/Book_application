import 'package:book/model(service)/book.dart';
import 'package:book/model(service)/book_controller.dart';
import 'package:book/screen/view_model/list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ------------  리스트뷰 ---------------
class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    var bookController = Provider.of<BookController>(context);
    var listViewModel = Provider.of<ListViewModel>(context);

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
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return MyListTile(
                  book: bookController.books[index],
                  onDeleteBook: bookController.deleteBook,
                  index: index);
            },
            itemCount: bookController.books.length,
          );
  }
}

class MyListTile extends StatelessWidget {
  MyListTile(
      {super.key,
      required this.book,
      required this.index,
      required this.onDeleteBook});
  Function onDeleteBook;
  int index;
  Book book;

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<ListViewModel>(context);

    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black, width: 2))),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          minTileHeight: 150,
          selectedColor: Colors.red,
          onLongPress: () {
            listViewModel.toggleSelected(index);
            print('제스처 감지 : ${listViewModel.isSeletedMode}');
          },
          onTap: () {
            Navigator.pushNamed(context, '/list/detail',
                arguments: {"book": book});
          },
          title: Text(book.title),
          leading: Image.network(
            book.image,
            errorBuilder: (context, object, stack) {
              return Icon(
                Icons.library_books,
                size: 80,
              );
            },
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: listViewModel.isSeletedMode
                ? [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.bookmark_add)),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        onDeleteBook(book.title);
                      },
                    ),
                    Checkbox(
                        value: listViewModel.selectedList[index],
                        onChanged: (value) {
                          listViewModel.selectedList[index] = value ?? false;
                        }),
                  ]
                : [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.bookmark_add)),
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
}
