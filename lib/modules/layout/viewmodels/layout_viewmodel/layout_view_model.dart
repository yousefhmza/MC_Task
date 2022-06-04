import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cart/screens/cart_screen.dart';
import '../../../products/screens/home_screen.dart';
import '../../../ui_screens/categories_screen.dart';
import '../../../ui_screens/profile_screen.dart';
import 'layout_states.dart';

class LayoutViewModel extends Cubit<LayoutStates> {
  LayoutViewModel() : super(LayoutInitialState());

  int currentScreenIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    CartScreen(),
    CategoriesScreen(),
    ProfileScreen(),
  ];

  void setCurrentScreenIndex(int index) {
    currentScreenIndex = index;
    emit(SetScreenIndexState());
  }
}
