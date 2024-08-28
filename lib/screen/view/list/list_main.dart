import 'package:book/main.dart';
import 'package:book/model(service)/book.dart';
import 'package:book/model(service)/book_controller.dart';
import 'package:book/screen/view/list/grid_view.dart';
import 'package:book/screen/view/list/list_view.dart';
import 'package:book/screen/view_model/list_view_model.dart';
import 'package:book/test_ground/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

// list_screen -> body : isGridView ? MyGirdView : MyListView
// 위 위젯의 상위에서 상태를 동록한다. ( List<Book> : Provider 등록 )
class ListMainView extends ConsumerWidget {
  const ListMainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var localListViewModel = ref.watch(listViewModel);
    print('메인 리스트뷰 위젯 재실행');

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          '리스트',
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
          Column(
            children: [
              Switch(
                value: localListViewModel.isGridViewMode,
                onChanged: (bool value) {
                  localListViewModel.toggleSelectedMode();
                },
              ),
              const Text('그리드뷰 활성화'),
            ],
          ),
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
              PopupMenuItem(
                  onTap: () {
                    ref.read(notifierBookController).insertBook(Book("content",
                        title: "title",
                        author: "author",
                        image: "image",
                        publicher: "publicher"));
                  },
                  child: const Text(
                    '테스트 버튼',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )),
            ];
          }),
        ],
      ),
      // body 작성하기
      body: Column(
        children: [
          Text(
            '리스트 세션 1',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(border: Border.all(width: 1)),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: localListViewModel.isGridViewMode
                ? const MyGridView()
                : const MyListView(),
          ),
          Text(
            '리스트 세션 2',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(border: Border.all(width: 1)),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: !localListViewModel.isGridViewMode
                ? const MyGridView()
                : const MyListView(),
          ),
        ],
      ),
    );
  }
}
