import 'package:book/screen/view/list/book_create_view.dart';
import 'package:book/screen/view/list/list_view.dart';
import 'package:flutter/material.dart';

// list_screen -> body : isGridView ? MyGirdView : MyListView
// 위 위젯의 상위에서 상태를 동록한다. ( List<Book> : Provider 등록 )
class ListMainView extends StatefulWidget {
  const ListMainView({super.key});

  @override
  State<ListMainView> createState() => _ListMainViewState();
}

class _ListMainViewState extends State<ListMainView> {
  bool isGridView = false;
  bool isAllSelected = false;

  @override
  void initState() {
    super.initState();
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
                setState(() {});
              },
              icon: const Icon(Icons.refresh)),
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                onTap: () {
                  //showCreateBookDialog(context);
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
      // body 작성하기
      body: const MyListView(),
    );
  }
}
