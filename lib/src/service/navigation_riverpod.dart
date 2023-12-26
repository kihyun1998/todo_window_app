import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/state/NaviState.dart';

final naviProvider =
    NotifierProvider<NaviRiverpod, NaviState>(NaviRiverpod.new);

class NaviRiverpod extends Notifier<NaviState> {
  @override
  NaviState build() {
    return NaviState();
  }

  void onDestinationSelected(int newIndex) {
    state = state.copyWith(index: newIndex);
  }

  // 앞에 느낌표 : not 연산자
  // 뒤에 느낌표 : null이 아님을 확신
  // 이유 : not 연산자는 nullable 변수에 사용할 수 없다.
  void toggleExtended() {
    state = state.copyWith(isExtended: !state.isExtended);
  }
}
