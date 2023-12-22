class NaviState {
  const NaviState({
    int? index,
    bool? isExtended,
  })  : _index = index ?? 0,
        _isExtended = isExtended ?? false;

  final int _index;
  final bool _isExtended;

  int get index => _index;

  set index(NaviState naviState) {
    _naviState = naviState;
  }
}
