import 'package:flutter/material.dart';

// ------------  리스트뷰 ---------------
class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text('텅텅'),
    );
  }
}


/*
  @override
  Widget build(BuildContext context) {
    return GetX<Books>(
      //init: Books(),
      builder: (controller) {
        return Center(
          // ignore: invalid_use_of_protected_member
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return getBookTile(
                controller.books.value[index],
                context,
                (book) {
                  controller.deleteBook(book.title);
                },
              );
            },
            itemCount: controller.books.value.length,
          ),
        );
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
*/
