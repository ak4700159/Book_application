import 'package:book/functions/network.dart';
import 'package:book/models/book.dart';
import 'package:book/screens/detail_screen.dart';
import 'package:flutter/material.dart';

// ------------  리스트뷰 ---------------
class MyListView extends StatefulWidget {
  MyListView(
      {super.key,
      required this.callback,
      required this.isSelectd,
      required this.selectedAll,
      required this.books});
  List<bool> isSelectd;
  bool selectedAll;
  Function callback;
  List<Book> books;

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  late List<bool> isSelectd;
  late List<Book> books;
  late bool selectedAll;
  late Function callback;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelectd = widget.isSelectd;
    selectedAll = widget.selectedAll;
    callback = widget.callback;
    books = widget.books;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (BuildContext context, int index) {
        Book book = books[index];
        return getBookTile(book, context, (book) {
          setState(() {
            books.remove(book!);
          });
          sendHttpMsg("DELETE", book);
        });
      },
    );
  }
}

Container getBookTile(Book book, BuildContext context, Function onDeleteBook) {
  return Container(
    decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black, width: 2))),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        selectedColor: Colors.red,
        onLongPress: () {},
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailScreen(book: book)));
        },
        title: Text(book.title),
        leading: Image.network(
          book.image,
          errorBuilder: (context, object, stack) {
            return Image.network(
                width: 10,
                height: 10,
                "https://d0.awsstatic.com/Digital%20Marketing/sitemerch/sign-in/KO/Site-Merch_PAC_GuardDuty_Sign-in_KO.png");
          },
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/modify_screen',
                    arguments: book,
                  );
                },
                icon: const Icon(Icons.bookmark_add)),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                onDeleteBook(book);
              },
            ),
          ],
        ),
      ),
    ),
  );
}
