import 'package:book/model(service)/book_controller.dart';
import 'package:book/screen/view/list/grid_view.dart';
import 'package:book/screen/view/list/list_view.dart';
import 'package:book/screen/view_model/list_view_model.dart';
import 'package:book/test_ground/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// list_screen -> body : isGridView ? MyGirdView : MyListView
// 위 위젯의 상위에서 상태를 동록한다. ( List<Book> : Provider 등록 )
class ListMainView extends StatefulWidget {
  const ListMainView({super.key});

  @override
  State<ListMainView> createState() => _ListMainViewState();
}

class _ListMainViewState extends State<ListMainView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var bookController = Provider.of<BookController>(context);
    var listViewModel = Provider.of<ListViewModel>(context);
    print('메인 리스트뷰 위젯 재실행');

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          '리스트   ${context.watch<Counter>().num}',
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                value: listViewModel.isGridViewMode,
                onChanged: (bool value) {
                  setState(() {
                    listViewModel.isGridViewMode = value;
                  });
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
                    context.read<Counter>().increment();
                    print('버튼 on ${context.read<Counter>().num}');
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
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(border: Border.all(width: 1)),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: listViewModel.isGridViewMode
                ? const MyGridView()
                : const MyListView(),
          ),
          Text(
            '리스트 세션 2',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(border: Border.all(width: 1)),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: !listViewModel.isGridViewMode
                ? const MyGridView()
                : const MyListView(),
          ),
        ],
      ),
    );
  }
}
