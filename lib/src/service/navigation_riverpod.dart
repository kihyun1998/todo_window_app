import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/state/NaviState.dart';

class NaviRiverpod extends Notifier<NaviState> {
  @override
  NaviState build() {
    return const NaviState();
  }

  void SelectedIndex(int index) {
    state.index = index;
  }
}
