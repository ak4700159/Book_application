import 'package:flutter/material.dart';

class ListViewModel with ChangeNotifier {
  ListViewModel() {}

// 리스트 페이지에서 타일을 오래 눌렀을 때
// selected Mode로 바뀐다.
// selected Mode에서 원하는 데이터를 터치해서 단체 삭제가 가능
  bool isSeletedMode = false;
  // 그리드뷰와 리스트뷰의 변동 기준
  bool isGridViewMode = false;
  // 전체 리스트 선택할 때 참조되는 값
  bool isAllSelected = false;

  // selectedList는 언제나 실제 리스트에서 출력되고 있는 데이터의 길이와
  // 매핑되어야 한다. 그러기 위해서는.. 어떤 방법이 제일 효과적일까?
  late List<bool> selectedList;

  removeIndex(int index) {
    selectedList.removeAt(index);
    notifyListeners();
  }

  addIndex() {
    selectedList.add(false);
    checkAllChecked();
    notifyListeners();
  }

  void toggleSelected(int index) {
    selectedList[index] = !(selectedList[index]);
    checkAllChecked();
    notifyListeners();
  }

  void checkAllChecked() {
    for (int i = 0; i < selectedList.length; i++) {
      if (selectedList[i] == false) {
        isAllSelected = false;
        break;
      }
    }
    notifyListeners();
  }

  void deleteCheckedBook() {
    selectedList.removeWhere((value) => value == true);
    notifyListeners();
  }
}
