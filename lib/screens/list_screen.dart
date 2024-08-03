import 'package:book/functions/network.dart';
import 'package:book/models/book.dart';
import 'package:book/screens/book_create_screen.dart';
import 'package:book/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late Future<List<Book>> books;
  @override
  void initState() {
    super.initState();
    books = fetchBook();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '도서목록 앱',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            // 로그아웃 창
            // 메인화면 or 로그아웃
          },
          icon: const Icon(
            Icons.door_back_door_rounded,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  books = fetchBook();
                });
              },
              icon: const Icon(Icons.refresh)),
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                onTap: () {
                  showCreateBookDialog(context);
                },
                child: const Text(
                  '도서 추가하기',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              PopupMenuItem(
                  onTap: () {},
                  child: const Text(
                    '도서 삭제하기',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )),
              PopupMenuItem(
                  onTap: () {},
                  child: const Text(
                    '도서 수정하기',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )),
            ];
          }),
        ],
      ),
      body: FutureBuilder(
        future: books,
        builder: (constext, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                Book book = snapshot.data![index];
                return getBookTile(book, context, (book) {
                  setState(() {
                    snapshot.data?.remove(book!);
                  });
                  deleteBook(book?.title);
                });
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

Container getBookTile(Book book, BuildContext context, Function onDeleteBook) {
  bool select = false;
  return Container(
    decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black, width: 2))),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        selectedColor: Colors.red,
        selected: select,
        onLongPress: () {
          select = true;
        },
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailScreen(book: book)));
        },
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
