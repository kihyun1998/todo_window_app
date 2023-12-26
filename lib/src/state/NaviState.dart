// ignore_for_file: file_names

class NaviState {
  final int index;
  final bool isExtended;

  NaviState({
    int? index,
    bool? isExtended,
  })  : index = index ?? 0,
        isExtended = isExtended ?? false;

  NaviState copyWith({
    int? index,
    bool? isExtended,
  }) {
    return NaviState(
      index: index ?? this.index,
      isExtended: isExtended ?? this.isExtended,
    );
  }
}
