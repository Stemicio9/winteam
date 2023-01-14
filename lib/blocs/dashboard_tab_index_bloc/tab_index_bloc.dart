import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabIndexCubit extends Cubit<TabIndexState> {
  TabIndexCubit() : super(const TabIndexState(0));

  void setTabIndex(int index) {
    emit(TabIndexState(index));
  }
}

@immutable
class TabIndexState {
  final int index;
  const TabIndexState(this.index);
}

