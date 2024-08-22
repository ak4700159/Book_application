import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel {
  LoginViewModel({required this.id, required this.passwd});
  String id;
  String passwd;
  // 회원가입 또는 비밀번호 아이디 찾을 때 필요한 정보.
  String? email;
  String? name;
  String? phoneNumber;

  GlobalKey<FormState> idFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> pwdFormKey = GlobalKey<FormState>();

  // 로그인 함수 -> 백엔드로 아이디와 passwd가 전달되고
  // 전달받은 메시지에 따라 로직을 처리해야됨
  // 1. 존재하지 않은 ID입니다.
  // 2. 비밀번호가 틀렸습니다.

  Future<bool> login() async {
    // 임시로 아이디와 비밀번호를 설정.
    if (id == "5645164" && passwd == "1234") {
      // 로그인 성공 시 내부 저장소의 isLogin 항목의 값이 true로 바뀐다
      // 이는 다음 번에 로그인 시 자동으로 로그인에 성공하게 된다
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLogin', true);
      return true;
    }
    return false;
  }

// vaildator 함수는 TextFormField함수의 vaildator 속성에 등록될 함수이며
// 필드 안의 문자열에 대한 유효성 검사를 진행하게 된다.
  idValidator(value) {
    String idPattern = "[a-zA-Z0-9]";
    if (value?.isEmpty ?? false) {
      return '아이디를 입력해주세요';
    } else if (value.length < 5) {
      return '아이디는 최소 5글자 이상입니다.';
    } else if (!RegExp(idPattern).hasMatch(value)) {
      return '영문, 숫자로만 이루어진 아이디만 입력 가능합니다.';
    }
    return null;
  }

  passwdValidator(value) {
    String pwdPattern = "[a-zA-Z0-9]";
    if (value?.isEmpty ?? false) {
      return '비밀번호를 입력해주세요';
    } else if (!RegExp(pwdPattern).hasMatch(value)) {
      return '영문 숫자로만 이루어진 비밀번호만 입력 가능합니다.';
    }
    return null;
  }

  saveId(value) {
    id = value;
  }

  savePwd(value) {
    passwd = value;
  }

  // Form에 등록된 키를 이용해 텍스트 필드 유효성 검사를 하고
  // 검사에 통과하게 되면 상태를 저장하게 된다.
  checkLogin() {
    if ((idFormKey.currentState?.validate() ?? false) &&
        (pwdFormKey.currentState?.validate() ?? false)) {
      idFormKey.currentState?.save();
      pwdFormKey.currentState?.save();
      return login();
    }
    return false;
  }
}
